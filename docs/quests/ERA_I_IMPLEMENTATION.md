# Era I: Stone Age - Quest Implementation Guide

> **Purpose:** Step-by-step instructions for implementing Era I quests in Better Questing
> **Total Quests:** 10
> **Theme:** Survival basics, quest system tutorial

---

## Pre-Implementation Setup

### In-Game Commands
```
/bq_admin edit          - Enable edit mode
/bq_admin reset all     - Reset all quest progress
/bq_admin default save  - Save quests to default config
/bq_admin default load  - Load default quests
```

### Workflow
1. Create a new Creative world
2. Run `/bq_admin edit`
3. Press ` (grave/tilde) to open quest book
4. Click QUESTS → EDIT → ADD NEW
5. Create quest line "Era I: Stone Age"
6. Click DESIGNER to enter visual editor
7. Create quests using NEW QUEST tool
8. Configure each quest (tasks, rewards, prerequisites)
9. Test with edit mode OFF
10. Run `/bq_admin default save` when complete

---

## Quest Line Configuration

### Quest Line: Era I - Stone Age
- **Name:** Era I: Stone Age
- **Description:** "Welcome to EnergyCraft! This chapter will teach you the basics of survival and introduce you to the quest system. Complete all quests to unlock the Age of Machines."
- **Icon:** `minecraft:wooden_pickaxe`
- **Visibility:** NORMAL (always visible)

---

## Quest Specifications

### Quest 1: Welcome to EnergyCraft
**Position:** Center of canvas (0, 0)

| Property | Value |
|----------|-------|
| **Name** | Welcome to EnergyCraft |
| **Icon** | `minecraft:book` |
| **Description** | "Welcome, Engineer! You hold in your hands the EnergyCraft Guidebook. This book will guide you from humble beginnings to mastering the very fabric of reality itself.\n\nYour journey begins here, in the Stone Age. Master the basics of survival before you can dream of harnessing the power of atoms and dragons.\n\nClick the checkmark below to claim your reward!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Auto-complete on view (Detection task) |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:torch` | 16 |
| Item | `minecraft:bread` | 8 |

**Prerequisites:** None (starting quest)

**Unlocks:** All other Era I quests

---

### Quest 2: Punch a Tree
**Position:** Below Welcome (0, 1)

| Property | Value |
|----------|-------|
| **Name** | Punch a Tree |
| **Icon** | `minecraft:log` |
| **Description** | "Every great engineer started somewhere. For you, that somewhere is punching trees.\n\nGather some wood to begin crafting your first tools. Any type of log will do!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `minecraft:log` (any meta/damage) × 16, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:wooden_pickaxe` | 1 |
| Item | `minecraft:crafting_table` | 1 |

**Prerequisites:** Quest 1 (Welcome)

---

### Quest 3: Stone Tools
**Position:** Below Punch a Tree (0, 2)

| Property | Value |
|----------|-------|
| **Name** | Stone Tools |
| **Icon** | `minecraft:stone_pickaxe` |
| **Description** | "Wood tools break too quickly. Upgrade to stone!\n\nCraft a stone pickaxe to mine faster and access stronger materials like iron and coal." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `minecraft:stone_pickaxe` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:coal` | 16 |
| Item | `minecraft:cobblestone` | 32 |

**Prerequisites:** Quest 2 (Punch a Tree)

---

### Quest 4: Mining Basics
**Position:** Below Stone Tools (0, 3)

| Property | Value |
|----------|-------|
| **Name** | Mining Basics |
| **Icon** | `minecraft:cobblestone` |
| **Description** | "Time to go underground! Mine some cobblestone to build with.\n\nPro tip: Press F3 to see your coordinates. Ores spawn more frequently below Y=64." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `minecraft:cobblestone` × 64, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:stone` | 64 |
| Item | `minecraft:ladder` | 16 |

**Prerequisites:** Quest 3 (Stone Tools)

---

### Quest 5: First Shelter
**Position:** Branch right from Mining (1, 3)

| Property | Value |
|----------|-------|
| **Name** | First Shelter |
| **Icon** | `minecraft:bed` |
| **Description** | "Monsters come out at night! Build a shelter and craft a bed to skip the darkness.\n\nA bed also sets your spawn point - very important for an engineer working with dangerous machinery later!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `minecraft:bed` (any color) × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:wool` (white) | 8 |
| Item | `minecraft:torch` | 32 |

**Prerequisites:** Quest 4 (Mining Basics)

---

### Quest 6: Food & Farming
**Position:** Branch left from Mining (-1, 3)

| Property | Value |
|----------|-------|
| **Name** | Food & Farming |
| **Icon** | `minecraft:wheat` |
| **Description** | "A hungry engineer is a dead engineer. Set up a sustainable food source!\n\nWheat is reliable, but later you'll discover machines that can automate farming entirely." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `minecraft:wheat` × 32, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:bread` | 16 |
| Item | `minecraft:bone_meal` | 16 |
| Item | `minecraft:wheat_seeds` | 8 |

**Prerequisites:** Quest 4 (Mining Basics)

---

### Quest 7: Iron Age
**Position:** Below Mining Basics (0, 4)

| Property | Value |
|----------|-------|
| **Name** | Iron Age |
| **Icon** | `minecraft:iron_ingot` |
| **Description** | "Iron is the backbone of industry. You'll need LOTS of it for machines, tools, and infrastructure.\n\nSmelt iron ore in a furnace to get iron ingots. Later, you'll learn to DOUBLE your ore output with machines!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `minecraft:iron_ingot` × 32, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:iron_pickaxe` | 1 |
| Item | `minecraft:bucket` | 2 |
| Item | `minecraft:iron_ingot` | 8 |

**Prerequisites:** Quest 5 (First Shelter), Quest 6 (Food & Farming)

---

### Quest 8: Diamond Hunt
**Position:** Below Iron Age (0, 5)

| Property | Value |
|----------|-------|
| **Name** | Diamond Hunt |
| **Icon** | `minecraft:diamond` |
| **Description** | "Diamonds are found deep underground, below Y=16. They're essential for advanced tools and will be needed for many machines.\n\nBring a water bucket - lava is common at diamond level!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `minecraft:diamond` × 5, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:diamond` | 3 |
| Item | `minecraft:obsidian` | 4 |

**Prerequisites:** Quest 7 (Iron Age)

---

### Quest 9: The Nether Awaits
**Position:** Branch right from Diamond (1, 5)

| Property | Value |
|----------|-------|
| **Name** | The Nether Awaits |
| **Icon** | `minecraft:obsidian` |
| **Description** | "The Nether holds valuable resources: Glowstone for lighting, Quartz for circuits, and rare ores.\n\nBuild a Nether Portal (4×5 obsidian frame) and light it with flint and steel. Be careful - it's dangerous!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Location | Dimension: -1 (Nether) |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:glowstone` | 16 |
| Item | `minecraft:quartz` | 32 |
| Item | `minecraft:blaze_rod` | 4 |

**Prerequisites:** Quest 8 (Diamond Hunt)

---

### Quest 10: ERA I COMPLETE - The Age of Machines
**Position:** Below Diamond Hunt (0, 6) - Make it larger/special

| Property | Value |
|----------|-------|
| **Name** | ERA I COMPLETE: The Age of Machines |
| **Icon** | `ic2:itemingot` (Copper Ingot) or `minecraft:furnace` |
| **Description** | "Congratulations, Engineer!\n\nYou've mastered the basics of survival. But this is just the beginning.\n\nThe next era introduces MACHINES - devices that process ores, generate power, and automate your world. Copper, Tin, and Rubber await!\n\n⚡ Welcome to the Bronze Age ⚡" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Manual completion (gateway quest) |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:fireworks` (celebration) | 8 |
| Item | `minecraft:furnace` | 4 |
| XP | 500 XP | - |

**Prerequisites:** Quest 8 (Diamond Hunt), Quest 9 (Nether Awaits)

**Special:** This quest unlocks Era II quest line

---

## Visual Layout

```
                    [1. Welcome to EnergyCraft]
                              |
                    [2. Punch a Tree]
                              |
                    [3. Stone Tools]
                              |
                    [4. Mining Basics]
                         /        \
            [6. Food & Farming]  [5. First Shelter]
                         \        /
                    [7. Iron Age]
                              |
                    [8. Diamond Hunt]
                         /        \
            (future)           [9. Nether Awaits]
                         \        /
                    [10. ERA I COMPLETE]
                              |
                              ▼
                    [Era II: Bronze Age]
```

---

## Quest Dependencies Summary

```
1 → 2 → 3 → 4 → 5 ─┐
                   ├→ 7 → 8 → 9 ─┐
              4 → 6 ─┘            ├→ 10
                            8 ────┘
```

---

## Testing Checklist

After creating all quests:

- [ ] Turn OFF edit mode (`/bq_admin edit`)
- [ ] Quest 1 auto-completes when opened
- [ ] Quest 2 detects logs in inventory (doesn't consume)
- [ ] Quest 3 requires crafting a stone pickaxe
- [ ] Quest 4 detects cobblestone (doesn't consume)
- [ ] Quest 5 requires crafting a bed
- [ ] Quest 6 detects wheat (doesn't consume)
- [ ] Quest 7 requires both 5 AND 6 complete first
- [ ] Quest 8 detects diamonds (doesn't consume)
- [ ] Quest 9 triggers when entering Nether
- [ ] Quest 10 requires 8 AND 9 complete
- [ ] All rewards dispense correctly
- [ ] Run `/bq_admin default save` when complete

---

## Notes for Implementation

### Task Types Used
- **Retrieval:** Player must have item in inventory
- **Crafting:** Player must craft the item
- **Location:** Player must visit dimension/coordinates
- **Checkbox:** Manual completion (for tutorials)

### Reward Best Practices
- Don't give items that skip progression
- Rewards should HELP with next quest
- Include some "bonus" items (extra torches, etc.)

### Description Formatting
- Use `\n` for line breaks
- Keep descriptions informative but not overwhelming
- Include gameplay tips where relevant
- Tease future content to build excitement

---

*Implementation Time Estimate: 30-45 minutes*
*Save frequently with `/bq_admin default save`*
