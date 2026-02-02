# Era II: Bronze Age - Quest Implementation Guide

> **Purpose:** Step-by-step instructions for implementing Era II quests in Better Questing
> **Total Quests:** 15
> **Theme:** First tech steps, IC2 basics, manual machines, first power generation
> **Prereq:** Era I Complete

---

## Pre-Implementation Setup

### Verify Era I Completion
Before starting Era II implementation:
1. Ensure Era I quests are saved (`/bq_admin default save`)
2. Test that "ERA I COMPLETE" quest works as gateway
3. Confirm Era II will be visible after Era I completion

### Item ID Reference (IC2 Classic)

> ⚠️ **CRITICAL: IC2 Classic uses `ic2:te` namespace for machines!**
> These IDs are from Gemini Deep Research. **ALWAYS verify with `/ct hand` in-game before implementation!**
> See: `research/IC2_CLASSIC_QUICK_REFERENCE.md` for complete reference.

**Materials & Items:**
| Item | Registry Name | Notes |
|------|---------------|-------|
| Copper Ingot | `<ic2:itemingot:0>` | Meta 0 |
| Tin Ingot | `<ic2:itemingot:1>` | Meta 1 |
| Bronze Ingot | `<ic2:itemingot:2>` | Meta 2 |
| Sticky Resin | `<ic2:itemharz>` | Raw rubber from trees |
| Rubber Bar | `<ic2:itemrubber>` | Smelted resin |
| Copper Cable (Uninsulated) | `<ic2:itemcable:0>` | |
| Copper Cable (Insulated) | `<ic2:itemcable:1>` | |
| RE-Battery | `<ic2:itemrebattery>` | |
| Electronic Circuit | `<ic2:itemcrafting:1>` | ⚠️ Updated from report |

**Machines (use `ic2:te` namespace!):**
| Machine | Registry Name | Notes |
|---------|---------------|-------|
| Generator | `<ic2:te:3>` | ⚠️ NOT ic2:blockgenerator |
| BatBox | `<ic2:te:72>` | ⚠️ NOT ic2:blockbatbox |
| Iron Furnace | `<ic2:blockfurnace>` | Verify - may be different | |

---

## Quest Line Configuration

### Quest Line: Era II - Bronze Age
- **Name:** Era II: Bronze Age
- **Description:** "The age of metal begins! Discover copper and tin, learn to alloy bronze, and take your first steps into electrical engineering. Master these fundamentals and you'll be ready for true industry."
- **Icon:** `ic2:itemingot` (Bronze Ingot, meta 2)
- **Visibility:** UNLOCKED (visible when Era I complete)
- **Prerequisite Quest Line:** Era I (Gateway: Quest 10)

---

## Quest Specifications

### Quest 1: The Age of Metals
**Position:** Center top (0, 0)
**Quest ID:** 11

| Property | Value |
|----------|-------|
| **Name** | The Age of Metals |
| **Icon** | `ic2:itemingot` (Copper, meta 0) |
| **Description** | "Welcome to the Bronze Age, Engineer!\n\nYou've noticed strange orange and gray ores while mining. These are Copper and Tin - the foundation of electrical technology.\n\nCopper conducts electricity. Tin strengthens alloys. Together, they make Bronze - stronger than iron for many applications.\n\nYour first task: find these new ores!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Auto-complete on view (intro quest) |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:torch` | 32 |
| XP | 100 XP | - |

**Prerequisites:** Era I Complete (Quest 10)

**Unlocks:** Quest 2 (Copper & Tin)

---

### Quest 2: Copper & Tin
**Position:** Below intro (0, 1)
**Quest ID:** 12

| Property | Value |
|----------|-------|
| **Name** | Copper & Tin |
| **Icon** | `ic2:blockmetal` (Copper Ore) |
| **Description** | "Mine copper and tin ore. They spawn at similar levels to iron (Y=0-64), so you've probably already seen them!\n\n**Copper** - Orange ore, very common\n**Tin** - Gray/white ore, less common\n\nYou'll need lots of both. The machines ahead are hungry for metal!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:itemingot` meta 0 (Copper Ingot) × 32, consume: false |
| Retrieval | `ic2:itemingot` meta 1 (Tin Ingot) × 32, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemingot` meta 2 (Bronze Ingot) | 16 |
| Item | `ic2:blockmetal` meta 0 (Copper Ore) | 8 |

**Prerequisites:** Quest 1

**Unlocks:** Quest 3 (Bronze Alloy), Quest 4 (Rubber Hunt)

---

### Quest 3: Bronze Alloy
**Position:** Left branch (-1, 2)
**Quest ID:** 13

| Property | Value |
|----------|-------|
| **Name** | Bronze Alloy |
| **Icon** | `ic2:itemingot` meta 2 (Bronze Ingot) |
| **Description** | "Bronze is made by combining Copper and Tin dust in a 3:1 ratio:\n\n**Recipe:** 3 Copper Dust + 1 Tin Dust = 4 Bronze Dust\n\nTo get dust, you need to crush ingots or ore. For now, use a Forge Hammer (shapeless: 5 iron + 2 sticks) to manually crush ores and ingots into dust.\n\nLater, machines will do this automatically!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:itemingot` meta 2 (Bronze Ingot) × 16, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemtoolforgehammer` | 1 |
| Item | `ic2:itemingot` meta 2 (Bronze Ingot) | 8 |

**Prerequisites:** Quest 2

**Unlocks:** Quest 6 (Bronze Tools)

---

### Quest 4: Rubber Hunt
**Position:** Right branch (1, 2)
**Quest ID:** 14

| Property | Value |
|----------|-------|
| **Name** | Rubber Hunt |
| **Icon** | `ic2:itemharz` (Sticky Resin) |
| **Description** | "Look for tall trees with orange spots on their trunks - these are Rubber Trees!\n\nCraft a Treetap (5 wood planks in a 'Y' shape) and right-click the orange spots to extract Sticky Resin. Each spot can be tapped multiple times.\n\n**Pro Tip:** Rubber trees spawn in swamps and forests. Their saplings can be replanted!\n\nSmelt the resin into Rubber bars - essential for insulating wires." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:itemharz` (Sticky Resin) × 16, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemtreetap` | 2 |
| Item | `ic2:itemrubber` (Rubber Bar) | 16 |
| Item | `ic2:blocksapling` (Rubber Sapling) | 4 |

**Prerequisites:** Quest 2

**Unlocks:** Quest 5 (Rubber Processing)

---

### Quest 5: Rubber Processing
**Position:** Below Rubber Hunt (1, 3)
**Quest ID:** 15

| Property | Value |
|----------|-------|
| **Name** | Rubber Processing |
| **Icon** | `ic2:itemrubber` (Rubber Bar) |
| **Description** | "Smelt your Sticky Resin in a furnace to get Rubber bars.\n\n1 Sticky Resin → 1 Rubber (in furnace)\n\nRubber is used to insulate cables, preventing power loss and keeping you from getting shocked!\n\n**Future Tech:** An Extractor machine will give you 3 Rubber per Resin instead of 1. Efficiency matters!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:itemrubber` × 32, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemrubber` | 16 |
| Item | `minecraft:coal` | 16 |

**Prerequisites:** Quest 4

**Unlocks:** Quest 7 (First Wires)

---

### Quest 6: Bronze Tools
**Position:** Below Bronze Alloy (-1, 3)
**Quest ID:** 16

| Property | Value |
|----------|-------|
| **Name** | Bronze Tools |
| **Icon** | `ic2:itemtoolbronzepickaxe` |
| **Description** | "Bronze tools are between iron and diamond in durability! They're a great stepping stone while you save diamonds for machines.\n\nCraft bronze tools just like iron tools, but with bronze ingots.\n\nThe Bronze Pickaxe can mine anything iron can, and lasts longer!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:itemtoolbronzepickaxe` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemingot` meta 2 (Bronze Ingot) | 16 |
| Item | `minecraft:stick` | 16 |

**Prerequisites:** Quest 3

**Unlocks:** Quest 8 (The Forge)

---

### Quest 7: First Wires
**Position:** Center (0, 4)
**Quest ID:** 17

| Property | Value |
|----------|-------|
| **Name** | First Wires |
| **Icon** | `ic2:itemcable` meta 1 (Insulated Copper Cable) |
| **Description** | "Time to make your first electrical cables!\n\n**Step 1:** Craft Copper Cable\n- Put a Copper Ingot in a crafting grid (shapeless) = 3 Uninsulated Copper Cable\n\n**Step 2:** Insulate with Rubber\n- Copper Cable + Rubber = Insulated Copper Cable\n\nInsulated cables don't shock you and lose less power over distance. Always insulate your cables!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:itemcable` meta 1 (Insulated Copper Cable) × 32, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemcable` meta 1 | 32 |
| Item | `ic2:itemrubber` | 16 |

**Prerequisites:** Quest 5 (Rubber Processing), Quest 6 (Bronze Tools)

**Unlocks:** Quest 9 (Iron Furnace)

---

### Quest 8: The Forge
**Position:** Below Bronze Tools (-1, 4)
**Quest ID:** 18

| Property | Value |
|----------|-------|
| **Name** | The Forge |
| **Icon** | `ic2:itemtoolforgehammer` |
| **Description** | "The Forge Hammer is a manual ore processing tool.\n\n**Craft:** 5 Iron Ingots + 2 Sticks (shapeless)\n\n**Use:** Put ore or ingot in crafting grid with hammer = Dust\n\nDust can be smelted into ingots. When you crush ORE into dust and smelt it, you get the same amount as normal... but soon you'll have a Macerator that doubles your output!\n\nThe hammer has durability - it will break eventually." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:itemtoolforgehammer` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:iron_ingot` | 8 |
| Item | `minecraft:coal` | 32 |

**Prerequisites:** Quest 6

**Unlocks:** Quest 9 (Iron Furnace)

---

### Quest 9: Iron Furnace
**Position:** Center (0, 5)
**Quest ID:** 19

| Property | Value |
|----------|-------|
| **Name** | Iron Furnace |
| **Icon** | `ic2:blockfurnace` |
| **Description** | "The Iron Furnace is a stepping stone between vanilla furnaces and electric machines.\n\n**Benefits:**\n- Smelts 20% faster than stone furnace\n- Uses same fuel as regular furnace\n- Required to craft the Generator!\n\n**Recipe:** Iron around a Furnace (like making a chest but with a furnace in the middle)" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockfurnace` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:iron_ingot` | 16 |
| Item | `minecraft:coal` | 64 |

**Prerequisites:** Quest 7, Quest 8

**Unlocks:** Quest 10 (Power Generation)

---

### Quest 10: Power Generation
**Position:** Below Iron Furnace (0, 6)
**Quest ID:** 20

| Property | Value |
|----------|-------|
| **Name** | Power Generation |
| **Icon** | `ic2:blockgenerator` |
| **Description** | "This is it - your first GENERATOR!\n\nThe Generator burns fuel (coal, charcoal, wood) and produces **EU** (Energy Units) - the power that runs IC2 machines.\n\n**Output:** 10 EU/t (EU per tick)\n**Fuel:** Same as furnace - coal is best\n\n**Recipe:** \n- Top: RE-Battery\n- Middle: Iron Furnace\n- Bottom: 3 Stone\n- Sides: Nothing\n\nPlace it down and feed it coal. The gauge shows stored EU!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockgenerator` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:coal` | 64 |
| Item | `ic2:itemrebattery` (RE-Battery) | 2 |

**Prerequisites:** Quest 9

**Unlocks:** Quest 11 (Battery Power), Quest 12 (Your First Circuit)

---

### Quest 11: Battery Power
**Position:** Left branch (-1, 7)
**Quest ID:** 21

| Property | Value |
|----------|-------|
| **Name** | Battery Power |
| **Icon** | `ic2:itemrebattery` |
| **Description** | "The RE-Battery stores 10,000 EU and can be charged in a Generator or BatBox.\n\n**Recipe:** \n- 4 Tin Ingots (corners)\n- 2 Copper Cable (top/bottom center)\n- 2 Redstone (left/right center)\n- 1 Tin Ingot (center)\n\nBatteries let you carry power around! Put a charged battery in a Generator to transfer its power out.\n\nLater, better batteries will store much more energy." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:itemrebattery` × 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:redstone` | 16 |
| Item | `ic2:itemingot` meta 1 (Tin Ingot) | 8 |

**Prerequisites:** Quest 10

**Unlocks:** Quest 13 (BatBox Basics)

---

### Quest 12: Your First Circuit
**Position:** Right branch (1, 7)
**Quest ID:** 22

| Property | Value |
|----------|-------|
| **Name** | Your First Circuit |
| **Icon** | `ic2:itempartcircuit` |
| **Description** | "The Electronic Circuit is the brain of every IC2 machine!\n\n**Recipe:**\n- 6 Insulated Copper Cable (top and bottom rows)\n- 2 Redstone (left and right center)\n- 1 Refined Iron Ingot (center)\n\n**Getting Refined Iron:**\nSmelt Iron Ingot in a furnace → Refined Iron\n(Later: Use Compressor for better efficiency)\n\nYou'll need LOTS of circuits. Start stockpiling!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:itempartcircuit` × 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuit` | 4 |
| Item | `minecraft:redstone` | 32 |

**Prerequisites:** Quest 10

**Unlocks:** Quest 14 (Era II Complete Preview)

---

### Quest 13: BatBox Basics
**Position:** Below Battery Power (-1, 8)
**Quest ID:** 23

| Property | Value |
|----------|-------|
| **Name** | BatBox Basics |
| **Icon** | `ic2:blockbatbox` |
| **Description** | "The BatBox stores 40,000 EU and helps buffer your power supply.\n\n**Why you need it:**\n- Generators produce power constantly\n- Machines draw power in bursts\n- BatBox stores excess for when you need it\n\n**Recipe:**\n- 5 Wood Planks (top, sides, bottom corners)\n- 3 RE-Batteries (middle row)\n- 1 Wood Plank (bottom center)\n\nThe dot on the BatBox shows the OUTPUT side - point this toward your machines!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockbatbox` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemrebattery` | 4 |
| Item | `ic2:itemcable` meta 1 | 16 |

**Prerequisites:** Quest 11

**Unlocks:** Quest 14 (Era II Complete Preview)

---

### Quest 14: First Power Grid
**Position:** Center (0, 8)
**Quest ID:** 24

| Property | Value |
|----------|-------|
| **Name** | First Power Grid |
| **Icon** | `ic2:blockgenerator` |
| **Description** | "Time to build your first power infrastructure!\n\n**Setup:**\n1. Place Generator\n2. Place BatBox next to it (dot facing AWAY from generator)\n3. Connect machines to BatBox output with cables\n4. Feed coal to Generator\n5. Watch the power flow!\n\n**Tip:** The Generator's dot is the OUTPUT. The BatBox dot is also OUTPUT. Connect input sides to output sides!\n\nYou now have a working power grid. Era III awaits!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:blockgenerator` × 1, consume: false |
| Retrieval | `ic2:blockbatbox` × 1, consume: false |
| Retrieval | `ic2:itemcable` meta 1 × 16, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuit` | 8 |
| Item | `minecraft:redstone` | 32 |

**Prerequisites:** Quest 12, Quest 13

**Unlocks:** Quest 15 (Era II Complete)

---

### Quest 15: ERA II COMPLETE - The Industrial Revolution
**Position:** Bottom center (0, 9) - Make it larger/special
**Quest ID:** 25

| Property | Value |
|----------|-------|
| **Name** | ERA II COMPLETE: The Industrial Revolution |
| **Icon** | `ic2:blockmacerator` |
| **Description** | "⚡ CONGRATULATIONS, ENGINEER! ⚡\n\nYou've mastered the Bronze Age:\n✓ Discovered copper, tin, and rubber\n✓ Created bronze alloy\n✓ Built your first generator\n✓ Crafted electronic circuits\n✓ Established a power grid\n\nThe Industrial Revolution begins NOW.\n\nEra III introduces:\n- The MACERATOR (double your ores!)\n- Electric Furnace (faster smelting)\n- Compressor & Extractor\n- Advanced power storage\n\nYour factory empire awaits!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Manual completion (gateway quest) |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:firework_rocket` | 8 |
| Item | `ic2:itemrebattery` | 4 |
| Item | `ic2:itempartcircuit` | 8 |
| Item | `minecraft:diamond` | 2 |
| XP | 1000 XP | - |

**Prerequisites:** Quest 14 (First Power Grid)

**Special:** This quest unlocks Era III quest line

---

## Visual Layout

```
                    [1. The Age of Metals]
                              |
                    [2. Copper & Tin]
                         /        \
         [3. Bronze Alloy]        [4. Rubber Hunt]
                   |                      |
         [6. Bronze Tools]        [5. Rubber Processing]
                   |                      |
         [8. The Forge]                   |
                   \                     /
                    -------[7. First Wires]
                              |
                    [9. Iron Furnace]
                              |
                    [10. Power Generation]
                         /        \
         [11. Battery Power]  [12. Your First Circuit]
                   |                      |
         [13. BatBox Basics]              |
                   \                     /
                    -------[14. First Power Grid]
                              |
                    [15. ERA II COMPLETE]
                              |
                              ▼
                    [Era III: Industrial Age]
```

---

## Quest Dependencies Summary

```
1 → 2 → 3 → 6 → 8 ─┐
    |              |
    └→ 4 → 5 ──────┼→ 7 → 9 → 10 → 11 → 13 ─┐
                                |            ├→ 14 → 15
                                └→ 12 ───────┘
```

**Dependency Logic:**
- Quest 7 (First Wires) requires BOTH rubber (Q5) AND bronze tools (Q6)
- Quest 9 (Iron Furnace) requires BOTH wires (Q7) AND forge (Q8)
- Quest 14 (First Power Grid) requires BOTH circuits (Q12) AND batbox (Q13)

---

## Testing Checklist

After creating all quests:

- [ ] Era II becomes visible after Era I completion
- [ ] Quest 1 auto-completes when opened
- [ ] Quest 2 detects copper AND tin ingots (both required)
- [ ] Quest 3 detects bronze ingots
- [ ] Quest 4 detects sticky resin (not rubber)
- [ ] Quest 5 detects rubber bars
- [ ] Quest 6 requires CRAFTING bronze pickaxe
- [ ] Quest 7 requires both Q5 AND Q6 complete (convergence)
- [ ] Quest 8 requires CRAFTING forge hammer
- [ ] Quest 9 requires CRAFTING iron furnace
- [ ] Quest 10 requires CRAFTING generator
- [ ] Quest 11 requires CRAFTING batteries (x2)
- [ ] Quest 12 requires CRAFTING circuits (x4)
- [ ] Quest 13 requires CRAFTING batbox
- [ ] Quest 14 detects placed/owned generator + batbox + cables
- [ ] Quest 15 requires Q14 complete
- [ ] All rewards dispense correctly
- [ ] Run `/bq_admin default save` when complete

---

## Item ID Verification Commands

> ⚠️ **MANDATORY STEP:** IC2 Classic IDs differ from IC2 Experimental!
> The `/ct hand` command is your source of truth.

### Verification Workflow
```
1. Launch game in Creative mode
2. Open JEI, search for target item
3. Pick up item into inventory
4. Run: /ct hand
5. Check crafttweaker.log for exact ID
6. Update quest tasks/rewards with verified ID
```

### Expected IDs (verify these!):
```
/give @p ic2:itemingot 1 0      # Copper Ingot
/give @p ic2:itemingot 1 1      # Tin Ingot  
/give @p ic2:itemingot 1 2      # Bronze Ingot
/give @p ic2:itemharz 1         # Sticky Resin
/give @p ic2:itemrubber 1       # Rubber Bar
/give @p ic2:itemcable 1 1      # Insulated Copper Cable
/give @p ic2:itemrebattery 1    # RE-Battery
/give @p ic2:itemcrafting 1 1   # Electronic Circuit (UPDATED)
/give @p ic2:te 1 3             # Generator (ic2:te namespace!)
/give @p ic2:te 1 72            # BatBox (ic2:te namespace!)
```

### If Commands Fail:
1. Use `/ct hand` while holding the item
2. Check `logs/crafttweaker.log`
3. Update this guide with correct IDs
4. See `research/IC2_CLASSIC_QUICK_REFERENCE.md` for full reference

---

## Notes for Implementation

### Task Types Used
| Type | Usage |
|------|-------|
| **Checkbox** | Tutorial/intro quests (Q1, Q15) |
| **Retrieval** | Collect items, consume: false (Q2-Q5, Q14) |
| **Crafting** | Must craft specific item (Q6-Q13) |

### Key Teaching Points
Each quest teaches a core concept:

| Quest | Concept |
|-------|---------|
| Q1-2 | New ores exist beyond vanilla |
| Q3 | Alloys combine materials |
| Q4-5 | Rubber trees and processing |
| Q6 | Bronze as tool material |
| Q7 | Cable crafting and insulation |
| Q8 | Manual ore processing |
| Q9 | Upgrade path to electric |
| Q10 | First generator, EU power |
| Q11 | Portable power storage |
| Q12 | Circuits as machine components |
| Q13 | Stationary power storage |
| Q14 | Connecting a power grid |

### Reward Philosophy
- **Early quests:** Return resources to help progression
- **Crafting quests:** Give materials for NEXT step
- **Gateway quest:** Celebration + head start on next era

### Description Best Practices
- Include actual recipes where helpful
- Explain WHY something matters
- Tease future upgrades/machines
- Use formatting (`\n`, `**bold**`) for clarity

---

## Handoff to Era III

Era III: Industrial Age will cover:
- Macerator (ore doubling)
- Electric Furnace
- Compressor (plates, carbon)
- Extractor (3x rubber)
- Energy storage tiers (CESU, MFE, MFSU)
- Solar/Water/Geothermal power
- Nuclear introduction

**Prereq items needed from Era II:**
- Electronic Circuits (lots)
- Copper/Tin/Bronze infrastructure
- Understanding of EU power
- Generator + BatBox familiarity

---

*Implementation Time Estimate: 45-60 minutes*
*Quest IDs: 11-25 (continuing from Era I's 1-10)*
*Save frequently with `/bq_admin default save`*
