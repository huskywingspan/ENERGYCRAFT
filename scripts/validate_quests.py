#!/usr/bin/env python3
"""
Better Questing JSON Validator for EnergyCraft
Validates DefaultQuests.json structure, references, and data integrity.

Usage:
    python validate_quests.py [path_to_json]
    
If no path provided, defaults to ../config/betterquesting/DefaultQuests.json
"""

import json
import sys
import os
from pathlib import Path
from collections import defaultdict

class QuestValidator:
    def __init__(self, json_path):
        self.json_path = Path(json_path)
        self.data = None
        self.errors = []
        self.warnings = []
        self.quest_ids = set()
        self.quest_names = {}
        self.line_ids = set()
        
    def load_json(self):
        """Load and parse the JSON file."""
        try:
            with open(self.json_path, 'r', encoding='utf-8') as f:
                self.data = json.load(f)
            return True
        except FileNotFoundError:
            self.errors.append(f"File not found: {self.json_path}")
            return False
        except json.JSONDecodeError as e:
            self.errors.append(f"Invalid JSON: {e}")
            return False
    
    def validate_format_version(self):
        """Check format version exists and is valid."""
        if "format:8" not in self.data:
            self.errors.append("Missing 'format:8' field")
        elif self.data["format:8"] != "2.0.0":
            self.warnings.append(f"Unexpected format version: {self.data['format:8']} (expected 2.0.0)")
    
    def validate_quest_database(self):
        """Validate the questDatabase section."""
        if "questDatabase:9" not in self.data:
            self.errors.append("Missing 'questDatabase:9' section")
            return
        
        quest_db = self.data["questDatabase:9"]
        
        for key, quest in quest_db.items():
            # Validate key format
            if not key.endswith(":10"):
                self.errors.append(f"Quest key '{key}' should end with ':10'")
                continue
            
            quest_index = key.replace(":10", "")
            
            # Validate questID exists and matches
            if "questID:3" not in quest:
                self.errors.append(f"Quest {key} missing 'questID:3'")
            else:
                quest_id = quest["questID:3"]
                self.quest_ids.add(quest_id)
                
                # Check if index matches ID
                try:
                    if int(quest_index) != quest_id:
                        self.warnings.append(f"Quest key index {quest_index} doesn't match questID {quest_id}")
                except ValueError:
                    pass
            
            # Validate required sections
            self._validate_quest_properties(quest, key)
            self._validate_quest_tasks(quest, key)
            self._validate_quest_rewards(quest, key)
            self._validate_prerequisites(quest, key)
    
    def _validate_quest_properties(self, quest, key):
        """Validate quest properties section."""
        if "properties:10" not in quest:
            self.errors.append(f"Quest {key} missing 'properties:10'")
            return
        
        props = quest["properties:10"]
        if "betterquesting:10" not in props:
            self.errors.append(f"Quest {key} missing 'betterquesting:10' in properties")
            return
        
        bq_props = props["betterquesting:10"]
        required_fields = ["name:8", "desc:8", "icon:10"]
        
        for field in required_fields:
            if field not in bq_props:
                self.errors.append(f"Quest {key} missing required field '{field}'")
        
        # Store quest name for reference
        if "name:8" in bq_props:
            quest_id = quest.get("questID:3", key)
            self.quest_names[quest_id] = bq_props["name:8"]
        
        # Validate icon
        if "icon:10" in bq_props:
            self._validate_item(bq_props["icon:10"], f"Quest {key} icon")
    
    def _validate_quest_tasks(self, quest, key):
        """Validate quest tasks section."""
        if "tasks:9" not in quest:
            self.errors.append(f"Quest {key} missing 'tasks:9'")
            return
        
        tasks = quest["tasks:9"]
        if not tasks:
            self.warnings.append(f"Quest {key} has no tasks")
            return
        
        valid_task_types = [
            "bq_standard:retrieval",
            "bq_standard:crafting", 
            "bq_standard:checkbox",
            "bq_standard:location",
            "bq_standard:hunt",
            "bq_standard:fluid",
            "bq_standard:meeting",
            "bq_standard:xp",
            "bq_standard:scoreboard",
            "bq_standard:trigger",
            "bq_standard:optional_retrieval"
        ]
        
        for task_key, task in tasks.items():
            if "taskID:8" not in task:
                self.errors.append(f"Quest {key} task {task_key} missing 'taskID:8'")
                continue
            
            task_type = task["taskID:8"]
            if task_type not in valid_task_types:
                self.warnings.append(f"Quest {key} has unknown task type: {task_type}")
            
            # Validate retrieval/crafting tasks have required items
            if task_type in ["bq_standard:retrieval", "bq_standard:crafting"]:
                if "requiredItems:9" not in task:
                    self.errors.append(f"Quest {key} {task_type} task missing 'requiredItems:9'")
                else:
                    for item_key, item in task["requiredItems:9"].items():
                        self._validate_item(item, f"Quest {key} task {task_key}")
            
            # Validate location tasks
            if task_type == "bq_standard:location":
                if "dimension:3" not in task:
                    self.warnings.append(f"Quest {key} location task missing 'dimension:3'")
    
    def _validate_quest_rewards(self, quest, key):
        """Validate quest rewards section."""
        if "rewards:9" not in quest:
            self.warnings.append(f"Quest {key} missing 'rewards:9' (no rewards)")
            return
        
        rewards = quest["rewards:9"]
        
        valid_reward_types = [
            "bq_standard:item",
            "bq_standard:xp",
            "bq_standard:choice",
            "bq_standard:command",
            "bq_standard:scoreboard"
        ]
        
        for reward_key, reward in rewards.items():
            if "rewardID:8" not in reward:
                self.errors.append(f"Quest {key} reward {reward_key} missing 'rewardID:8'")
                continue
            
            reward_type = reward["rewardID:8"]
            if reward_type not in valid_reward_types:
                self.warnings.append(f"Quest {key} has unknown reward type: {reward_type}")
            
            # Validate item rewards
            if reward_type == "bq_standard:item":
                if "rewards:9" not in reward:
                    self.errors.append(f"Quest {key} item reward missing 'rewards:9'")
                else:
                    for item_key, item in reward["rewards:9"].items():
                        self._validate_item(item, f"Quest {key} reward {reward_key}")
            
            # Validate XP rewards
            if reward_type == "bq_standard:xp":
                if "amount:3" not in reward:
                    self.errors.append(f"Quest {key} XP reward missing 'amount:3'")
    
    def _validate_prerequisites(self, quest, key):
        """Validate quest prerequisites reference valid quests."""
        if "preRequisites:11" not in quest:
            return  # No prerequisites is valid for starting quests
        
        prereqs = quest["preRequisites:11"]
        quest_id = quest.get("questID:3", key)
        
        for prereq_id in prereqs:
            if prereq_id == quest_id:
                self.errors.append(f"Quest {key} has itself as prerequisite")
    
    def validate_prerequisites_exist(self):
        """Second pass: check all prerequisites reference existing quests."""
        if "questDatabase:9" not in self.data:
            return
        
        for key, quest in self.data["questDatabase:9"].items():
            if "preRequisites:11" not in quest:
                continue
            
            for prereq_id in quest["preRequisites:11"]:
                if prereq_id not in self.quest_ids:
                    quest_name = self.quest_names.get(quest.get("questID:3"), key)
                    self.errors.append(f"Quest '{quest_name}' references non-existent prerequisite ID {prereq_id}")
    
    def _validate_item(self, item, context):
        """Validate an item definition."""
        if "id:8" not in item:
            self.errors.append(f"{context}: item missing 'id:8'")
            return
        
        item_id = item["id:8"]
        
        # Check item ID format (modid:itemname)
        if ":" not in item_id:
            self.warnings.append(f"{context}: item ID '{item_id}' missing mod prefix")
        
        # Check Count
        if "Count:3" not in item:
            self.warnings.append(f"{context}: item '{item_id}' missing 'Count:3'")
        elif item["Count:3"] <= 0:
            self.errors.append(f"{context}: item '{item_id}' has invalid count {item['Count:3']}")
        
        # Check Damage (metadata)
        if "Damage:2" not in item:
            self.warnings.append(f"{context}: item '{item_id}' missing 'Damage:2'")
    
    def validate_quest_lines(self):
        """Validate the questLines section."""
        if "questLines:9" not in self.data:
            self.errors.append("Missing 'questLines:9' section")
            return
        
        quest_lines = self.data["questLines:9"]
        referenced_quests = set()
        
        for line_key, line in quest_lines.items():
            if not line_key.endswith(":10"):
                self.errors.append(f"Quest line key '{line_key}' should end with ':10'")
                continue
            
            # Validate lineID
            if "lineID:3" not in line:
                self.errors.append(f"Quest line {line_key} missing 'lineID:3'")
            else:
                line_id = line["lineID:3"]
                if line_id in self.line_ids:
                    self.errors.append(f"Duplicate quest line ID: {line_id}")
                self.line_ids.add(line_id)
            
            # Validate properties
            if "properties:10" not in line:
                self.errors.append(f"Quest line {line_key} missing 'properties:10'")
            else:
                props = line["properties:10"]
                if "betterquesting:10" in props:
                    bq_props = props["betterquesting:10"]
                    if "name:8" not in bq_props:
                        self.errors.append(f"Quest line {line_key} missing name")
            
            # Validate quests in line
            if "quests:9" not in line:
                self.warnings.append(f"Quest line {line_key} has no quests")
                continue
            
            for quest_key, quest_pos in line["quests:9"].items():
                if "id:3" not in quest_pos:
                    self.errors.append(f"Quest line {line_key} quest {quest_key} missing 'id:3'")
                    continue
                
                quest_id = quest_pos["id:3"]
                referenced_quests.add(quest_id)
                
                # Validate position fields
                for field in ["x:3", "y:3", "sizeX:3", "sizeY:3"]:
                    if field not in quest_pos:
                        self.warnings.append(f"Quest line {line_key} quest {quest_key} missing '{field}'")
        
        # Check all referenced quests exist
        for quest_id in referenced_quests:
            if quest_id not in self.quest_ids:
                self.errors.append(f"Quest line references non-existent quest ID {quest_id}")
        
        # Check all quests are in a line
        unreferenced = self.quest_ids - referenced_quests
        for quest_id in unreferenced:
            quest_name = self.quest_names.get(quest_id, f"ID {quest_id}")
            self.warnings.append(f"Quest '{quest_name}' not assigned to any quest line")
    
    def validate_quest_settings(self):
        """Validate questSettings section."""
        if "questSettings:10" not in self.data:
            self.warnings.append("Missing 'questSettings:10' section")
            return
        
        settings = self.data["questSettings:10"]
        if "betterquesting:10" not in settings:
            self.warnings.append("Missing 'betterquesting:10' in questSettings")
    
    def check_circular_dependencies(self):
        """Check for circular prerequisite dependencies."""
        if "questDatabase:9" not in self.data:
            return
        
        # Build dependency graph
        deps = {}
        for key, quest in self.data["questDatabase:9"].items():
            quest_id = quest.get("questID:3")
            if quest_id is not None:
                deps[quest_id] = quest.get("preRequisites:11", [])
        
        # DFS to detect cycles
        visited = set()
        rec_stack = set()
        
        def has_cycle(quest_id, path):
            if quest_id in rec_stack:
                cycle_names = [self.quest_names.get(q, str(q)) for q in path + [quest_id]]
                self.errors.append(f"Circular dependency detected: {' -> '.join(cycle_names)}")
                return True
            
            if quest_id in visited:
                return False
            
            visited.add(quest_id)
            rec_stack.add(quest_id)
            
            for prereq in deps.get(quest_id, []):
                if has_cycle(prereq, path + [quest_id]):
                    return True
            
            rec_stack.remove(quest_id)
            return False
        
        for quest_id in deps:
            if quest_id not in visited:
                has_cycle(quest_id, [])
    
    def validate(self):
        """Run all validation checks."""
        print(f"Validating: {self.json_path}\n")
        
        if not self.load_json():
            return False
        
        self.validate_format_version()
        self.validate_quest_database()
        self.validate_prerequisites_exist()
        self.validate_quest_lines()
        self.validate_quest_settings()
        self.check_circular_dependencies()
        
        return len(self.errors) == 0
    
    def print_report(self):
        """Print validation report."""
        print("=" * 60)
        print("VALIDATION REPORT")
        print("=" * 60)
        
        # Summary
        print(f"\nQuests found: {len(self.quest_ids)}")
        print(f"Quest lines found: {len(self.line_ids)}")
        
        # Errors
        if self.errors:
            print(f"\n❌ ERRORS ({len(self.errors)}):")
            print("-" * 40)
            for i, error in enumerate(self.errors, 1):
                print(f"  {i}. {error}")
        else:
            print("\n✅ No errors found!")
        
        # Warnings
        if self.warnings:
            print(f"\n⚠️  WARNINGS ({len(self.warnings)}):")
            print("-" * 40)
            for i, warning in enumerate(self.warnings, 1):
                print(f"  {i}. {warning}")
        else:
            print("\n✅ No warnings!")
        
        # Quest list
        if self.quest_names:
            print("\n📜 QUEST LIST:")
            print("-" * 40)
            for quest_id in sorted(self.quest_names.keys()):
                print(f"  [{quest_id}] {self.quest_names[quest_id]}")
        
        print("\n" + "=" * 60)
        
        if self.errors:
            print("❌ VALIDATION FAILED")
            return False
        else:
            print("✅ VALIDATION PASSED")
            return True


def main():
    # Default path relative to script location
    script_dir = Path(__file__).parent
    default_path = script_dir.parent / "config" / "betterquesting" / "DefaultQuests.json"
    
    # Use provided path or default
    if len(sys.argv) > 1:
        json_path = sys.argv[1]
    else:
        json_path = default_path
    
    validator = QuestValidator(json_path)
    validator.validate()
    success = validator.print_report()
    
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
