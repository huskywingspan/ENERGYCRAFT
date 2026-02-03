"""
IC2 Classic Quest ID Fixer
Corrects incorrect IC2 item IDs in DefaultQuests.json

IC2 Classic uses ic2:te with metadata, not ic2:blockmacerator style IDs.
"""

import json
import re
import shutil
from pathlib import Path

# ID mappings: old_id -> (new_id, damage_value)
# These are based on IC2 Classic research - VERIFY with /ct hand in-game
ID_MAPPINGS = {
    # ===== VERIFIED & APPLIED =====
    # Machines (Tile Entities)
    "ic2:blockgenerator": ("ic2:te", 3),
    "ic2:blockbatbox": ("ic2:te", 72),
    "ic2:blockmfe": ("ic2:te", 73),
    "ic2:blockmfsu": ("ic2:te", 74),
    "ic2:blockmacerator": ("ic2:te", 4),
    "ic2:blockcompressor": ("ic2:te", 5),
    "ic2:blockextractor": ("ic2:te", 6),
    "ic2:blockelectricfurnace": ("ic2:te", 2),
    "ic2:blockgeothermal": ("ic2:te", 8),
    "ic2:blockwatermill": ("ic2:te", 9),
    "ic2:blockinductionfurnace": ("ic2:te", 46),
    "ic2:blockreactor": ("ic2:te", 22),
    
    # ===== NEEDS VERIFICATION - UNCOMMENT AFTER /ct hand CHECK =====
    # Run in-game: get item, hold it, /ct hand, check crafttweaker.log
    
    # Solar Panel - get the item and verify!
    # "ic2:blocksolargenerator": ("ic2:te", ???),
    
    # CESU (MV Storage) - get the item and verify!
    # "ic2:blockcesu": ("ic2:te", ???),
    
    # Advanced Machine Block - might be ic2:resource:13
    # "ic2:blockadvancedmachine": ("ic2:resource", 13),
    
    # Advanced Processing Machines - need verification
    # "ic2:blockrotarymacerator": ("ic2:te", ???),
    # "ic2:blocksingularitycompressor": ("ic2:te", ???),
    # "ic2:blockcentrifugeextractor": ("ic2:te", ???),
    
    # Reactor Chamber - need verification
    # "ic2:blockreactorchamber": ("ic2:te", ???),
    
    # ===== PROBABLY CORRECT (non-tile-entity blocks) =====
    # These likely don't need changing:
    # - ic2:blockmetal (storage blocks)
    # - ic2:blocksapling (rubber sapling)
    # - ic2:blockfurnace (iron furnace)
}

def fix_item_id(item_dict):
    """Fix a single item dictionary if it has a wrong ID."""
    if not isinstance(item_dict, dict):
        return False
    
    item_id = item_dict.get("id:8")
    if item_id and item_id in ID_MAPPINGS:
        new_id, new_damage = ID_MAPPINGS[item_id]
        old_id = item_id
        item_dict["id:8"] = new_id
        item_dict["Damage:2"] = new_damage
        return old_id  # Return old ID for logging
    return False

def walk_and_fix(obj, path="", fixes=None):
    """Recursively walk JSON structure and fix item IDs."""
    if fixes is None:
        fixes = []
    
    if isinstance(obj, dict):
        # Check if this dict looks like an item (has id:8 key)
        if "id:8" in obj:
            old_id = fix_item_id(obj)
            if old_id:
                fixes.append((path, old_id, obj["id:8"], obj["Damage:2"]))
        
        # Recurse into nested dicts
        for key, value in obj.items():
            walk_and_fix(value, f"{path}/{key}", fixes)
    
    elif isinstance(obj, list):
        for i, item in enumerate(obj):
            walk_and_fix(item, f"{path}[{i}]", fixes)
    
    return fixes

def main():
    # Paths
    quest_file = Path(__file__).parent.parent / "config" / "betterquesting" / "DefaultQuests.json"
    backup_file = quest_file.with_suffix(".json.backup")
    
    print(f"Quest file: {quest_file}")
    print(f"Backup: {backup_file}")
    print()
    
    if not quest_file.exists():
        print(f"ERROR: Quest file not found: {quest_file}")
        return
    
    # Create backup
    shutil.copy2(quest_file, backup_file)
    print(f"✓ Created backup: {backup_file.name}")
    
    # Load JSON
    with open(quest_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    print(f"✓ Loaded quest data")
    print()
    
    # Find and fix IDs
    fixes = walk_and_fix(data)
    
    if not fixes:
        print("No IDs needed fixing!")
        return
    
    # Report fixes
    print(f"Fixed {len(fixes)} item IDs:")
    print("-" * 60)
    for path, old_id, new_id, new_damage in fixes:
        # Shorten path for readability
        short_path = path.split("/")[-3:] if "/" in path else [path]
        print(f"  {'/'.join(short_path)}")
        print(f"    {old_id} -> {new_id} (Damage: {new_damage})")
    print("-" * 60)
    print()
    
    # Save fixed JSON
    with open(quest_file, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    
    print(f"✓ Saved updated quest file")
    print()
    print("IMPORTANT: Test in-game to verify IDs are correct!")
    print("If issues occur, restore from backup:")
    print(f"  copy \"{backup_file}\" \"{quest_file}\"")

if __name__ == "__main__":
    main()
