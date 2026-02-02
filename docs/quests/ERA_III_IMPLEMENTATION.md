# Era III: Industrial Age - Quest Implementation Guide

> **Purpose:** Step-by-step instructions for implementing Era III quests in Better Questing
> **Total Quests:** 25
> **Theme:** IC2 mastery, EU power systems, ore processing, advanced machines
> **Prereq:** Era II Complete

---

## Overview

Era III is the heart of IC2 Classic progression. Players will:
- Build their first ore-processing machines (Macerator = 2x ores!)
- Explore multiple power generation methods
- Progress through energy storage tiers
- Craft advanced circuits and machines
- Prepare for BuildCraft automation

This is a **branching era** with three main paths that converge at the end.

---

## Pre-Implementation Setup

### Item ID Reference (IC2 Classic)

> ⚠️ **CRITICAL: IC2 Classic uses `ic2:te` namespace for ALL machines!**
> The IDs below are from Gemini Deep Research Report. **ALWAYS verify with `/ct hand` in-game!**
> Full reference: `research/IC2_CLASSIC_QUICK_REFERENCE.md`

#### Processing Machines (`ic2:te` namespace)

| Machine | Registry ID | Metadata | Function |
|---------|-------------|----------|----------|
| **Macerator** | `<ic2:te:4>` | 4 | Ore → 2x Dust |
| **Electric Furnace** | `<ic2:te:2>` | 2 | EU smelting |
| **Compressor** | `<ic2:te:5>` | 5 | Plates, Carbon |
| **Extractor** | `<ic2:te:6>` | 6 | 3x Rubber |
| **Induction Furnace** | `<ic2:te:46>` | 46 | Fast dual-smelt |
| **Recycler** | `<ic2:te:48>` | 48 | Scrap production |

#### Generators (`ic2:te` namespace)

| Generator | Registry ID | Output |
|-----------|-------------|--------|
| **Solar Panel** | `<ic2:te:8>` | 1 EU/t (verify - may share ID) |
| **Water Mill** | `<ic2:te:9>` | Variable |
| **Geothermal** | `<ic2:te:8>` | 20 EU/t (verify) |
| **Nuclear Reactor** | `<ic2:te:22>` | Variable |

#### Energy Storage (`ic2:te` namespace)

| Storage | Registry ID | Capacity | Max EU/t |
|---------|-------------|----------|----------|
| **BatBox** | `<ic2:te:72>` | 40k EU | 32 (LV) |
| **MFE** | `<ic2:te:73>` | 600k EU | 128 (MV) |
| **MFSU** | `<ic2:te:74>` | 10M EU | 512 (HV) |

#### Transformers (`ic2:te` namespace)

| Transformer | Registry ID | Conversion |
|-------------|-------------|------------|
| **LV Transformer** | `<ic2:te:77>` | 32 ↔ 128 EU |
| **MV Transformer** | `<ic2:te:78>` | 128 ↔ 512 EU |
| **HV Transformer** | `<ic2:te:79>` | 512 ↔ 2048 EU |

#### Crafting Components

| Item | Registry ID | Notes |
|------|-------------|-------|
| Electronic Circuit | `<ic2:itemcrafting:1>` | Basic circuits |
| Advanced Circuit | `<ic2:itemcrafting:2>` | Advanced circuits |
| Machine Casing | `<ic2:resource:1>` | Basic machine block |
| Adv Machine Casing | `<ic2:resource:13>` | Advanced machines |
| Refined Iron | `<ic2:itemingot:3>` | Meta 3 |
| Energy Crystal | `<ic2:itemenergycrystal>` | MFE component |
| Lapotron Crystal | `<ic2:itemlapotroncrystal>` | MFSU component |
| Carbon Plate | `<ic2:itemcarbonplate>` | Advanced recipes |
| Gold Cable | `<ic2:itemcable:2>` | MV cable |
| HV Cable | `<ic2:itemcable:4>` | HV cable |
| Glass Fibre Cable | `<ic2:itemcable:9>` | Best cable |

#### Verification Workflow
```
1. /ct hand - Get exact ID of held item
2. Check logs/crafttweaker.log for registry name
3. Update quest tasks/rewards with verified ID
```

---

## Quest Line Configuration

### Quest Line: Era III - Industrial Age
- **Name:** Era III: Industrial Age
- **Description:** "The machines are alive! Master ore processing, power generation, and energy storage. Double your resources with the Macerator, harness the sun and earth for power, and build the infrastructure for a true factory."
- **Icon:** `ic2:blockmacerator`
- **Visibility:** UNLOCKED (visible when Era II complete)
- **Prerequisite Quest Line:** Era II (Gateway: Quest 25)

---

## Quest Structure

Era III has **three branches** that converge:

```
                [Welcome to Industry]
                         |
          ┌──────────────┼──────────────┐
          ▼              ▼              ▼
    [ORE PROCESSING] [POWER GEN]  [ENERGY STORAGE]
      (5 quests)     (5 quests)    (4 quests)
          |              |              |
          └──────────────┼──────────────┘
                         ▼
               [ADVANCED MACHINES]
                   (6 quests)
                         |
                         ▼
               [ERA III COMPLETE]
```

---

## Quest Specifications

### INTRODUCTION

#### Quest 1: Welcome to Industry
**Position:** Center top (0, 0)
**Quest ID:** 26

| Property | Value |
|----------|-------|
| **Name** | Welcome to Industry |
| **Icon** | `ic2:blockmacerator` |
| **Description** | "Welcome to the Industrial Age, Engineer!\n\nYou've built a generator and learned the basics of EU power. Now it's time to put that power to WORK.\n\nThis era introduces:\n⚡ **Ore Processing** - Double your mining output!\n☀️ **Power Generation** - Solar, water, geothermal\n🔋 **Energy Storage** - Store millions of EU\n⚙️ **Advanced Machines** - Faster, better, stronger\n\nThree paths await. You can tackle them in any order, but you'll need to master all three to advance." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Auto-complete on view |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuit` | 8 |
| Item | `minecraft:redstone` | 32 |
| XP | 200 XP | - |

**Prerequisites:** Era II Complete (Quest 25)

**Unlocks:** Quest 2 (Ore Processing intro), Quest 7 (Power Gen intro), Quest 12 (Energy Storage intro)

---

### ORE PROCESSING BRANCH (Quests 2-6)

#### Quest 2: The Macerator
**Position:** Left branch (-2, 1)
**Quest ID:** 27

| Property | Value |
|----------|-------|
| **Name** | The Macerator |
| **Icon** | `ic2:blockmacerator` |
| **Description** | "The Macerator is the most important machine in IC2!\n\n**What it does:**\nGrinds ore into 2 dust → Smelt dust → 2 ingots\n**DOUBLE YOUR ORES!**\n\n**Recipe:**\n- 3 Flint (top row)\n- 1 Cobblestone, 1 Machine Block, 1 Cobblestone (middle)\n- 1 Cobblestone, 1 Circuit, 1 Cobblestone (bottom)\n\n**Machine Block:** 8 Refined Iron in a square (empty center)\n\nThis single machine will transform your resource economy!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockmacerator` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:iron_ore` | 32 |
| Item | `minecraft:gold_ore` | 8 |

**Prerequisites:** Quest 1

**Unlocks:** Quest 3 (Double Your Ores)

---

#### Quest 3: Double Your Ores
**Position:** Left branch (-2, 2)
**Quest ID:** 28

| Property | Value |
|----------|-------|
| **Name** | Double Your Ores |
| **Icon** | `minecraft:iron_ingot` |
| **Description** | "Put your Macerator to work!\n\n**Process:**\n1. Place Macerator next to your power (BatBox output)\n2. Put ore in the top slot\n3. Wait for grinding (watch the progress bar)\n4. Collect 2 dust from output\n5. Smelt dust in furnace → 2 ingots!\n\n**Challenge:** Process enough ore to get 64 iron ingots using your Macerator.\n\nYou just saved yourself hours of mining!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `minecraft:iron_ingot` × 64, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuit` | 4 |
| Item | `minecraft:diamond` | 2 |

**Prerequisites:** Quest 2

**Unlocks:** Quest 4 (Electric Furnace)

---

#### Quest 4: Electric Furnace
**Position:** Left branch (-2, 3)
**Quest ID:** 29

| Property | Value |
|----------|-------|
| **Name** | Electric Furnace |
| **Icon** | `ic2:blockelectricfurnace` |
| **Description** | "Why burn coal when you have ELECTRICITY?\n\nThe Electric Furnace smelts items using EU instead of fuel.\n\n**Benefits:**\n- No more coal management\n- Connects directly to your power grid\n- Faster than iron furnace\n- Can be upgraded later!\n\n**Recipe:**\n- 1 Circuit (top center)\n- 1 Refined Iron, 1 Iron Furnace, 1 Refined Iron (middle)\n- 1 Redstone, 1 Refined Iron, 1 Redstone (bottom)\n\nPair it with your Macerator: Ore → Macerator → E-Furnace → Ingots!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockelectricfurnace` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:coal` | 64 |
| Item | `ic2:itemingot` meta 3 (Refined Iron) | 8 |

**Prerequisites:** Quest 3

**Unlocks:** Quest 5 (Extractor)

---

#### Quest 5: The Extractor
**Position:** Left branch (-2, 4)
**Quest ID:** 30

| Property | Value |
|----------|-------|
| **Name** | The Extractor |
| **Icon** | `ic2:blockextractor` |
| **Description** | "Remember getting 1 Rubber from 1 Resin in a furnace?\n\nThe Extractor gives you **3 Rubber per Resin!**\n\n**Triple efficiency!**\n\n**Recipe:**\n- 4 Tree Taps (corners)\n- 1 Machine Block (center)\n- 1 Circuit (bottom center)\n\n**Other uses:**\n- Extract rubber from rubber wood\n- Process various IC2 materials\n\nNever waste resin in a furnace again!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockextractor` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemharz` (Sticky Resin) | 32 |
| Item | `ic2:itemrubber` | 32 |

**Prerequisites:** Quest 4

**Unlocks:** Quest 6 (The Compressor)

---

#### Quest 6: The Compressor
**Position:** Left branch (-2, 5)
**Quest ID:** 31

| Property | Value |
|----------|-------|
| **Name** | The Compressor |
| **Icon** | `ic2:blockcompressor` |
| **Description** | "The Compressor squeezes materials into denser forms.\n\n**Key recipes:**\n- Coal → Coal Ball → Compressed Coal → Coal Chunk → Diamond!\n- Refined Iron → Dense Iron Plate\n- 8 Cobblestone → Stone\n- Snowballs → Ice\n- Carbon Mesh → Carbon Plate (for advanced items)\n\n**Recipe:**\n- 1 Stone, 1 Machine Block, 1 Stone (top)\n- 1 Stone, 1 Circuit, 1 Stone (bottom)\n\nYou've now completed your basic ore processing setup!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockcompressor` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemcarbonplate` | 4 |
| Item | `minecraft:coal` | 64 |

**Prerequisites:** Quest 5

**Unlocks:** Quest 17 (Convergence: Advanced Machines)

---

### POWER GENERATION BRANCH (Quests 7-11)

#### Quest 7: Alternative Energy
**Position:** Center branch (0, 1)
**Quest ID:** 32

| Property | Value |
|----------|-------|
| **Name** | Alternative Energy |
| **Icon** | `ic2:blocksolargenerator` |
| **Description** | "Burning coal works, but it's not sustainable!\n\nIC2 offers several renewable power options:\n\n☀️ **Solar Panel** - Free power from sunlight\n💧 **Water Mill** - Power from water flow\n🌋 **Geothermal** - Massive power from lava\n\nEach has pros and cons. A smart engineer uses multiple sources!\n\nLet's explore your options..." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Auto-complete on view |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:glowstone_dust` | 16 |
| Item | `minecraft:redstone` | 16 |

**Prerequisites:** Quest 1

**Unlocks:** Quest 8 (Solar Power), Quest 9 (Water Power), Quest 10 (Geothermal Power)

---

#### Quest 8: Solar Power
**Position:** Center-left (-1, 2)
**Quest ID:** 33

| Property | Value |
|----------|-------|
| **Name** | Solar Power |
| **Icon** | `ic2:blocksolargenerator` |
| **Description** | "The Solar Panel generates free EU from sunlight!\n\n**Output:** 1 EU/t during daytime\n**Requirements:** Clear view of sky, daytime, no rain\n**Lifetime:** Infinite (no fuel needed!)\n\n**Recipe:**\n- 3 Coal Dust (top)\n- 3 Glass (middle)\n- 1 Circuit, 1 Generator, 1 Circuit (bottom)\n\n**Pro tip:** Place many panels for more power. They're weak individually but scale infinitely!\n\nLater: Environmental Tech solar arrays produce MUCH more power." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blocksolargenerator` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:glowstone` | 8 |
| Item | `minecraft:glass` | 16 |

**Prerequisites:** Quest 7

**Unlocks:** Quest 11 (Power Comparison)

---

#### Quest 9: Water Power
**Position:** Center (0, 2)
**Quest ID:** 34

| Property | Value |
|----------|-------|
| **Name** | Water Power |
| **Icon** | `ic2:blockwatermill` |
| **Description** | "Water Mills generate power from flowing water!\n\n**Passive Mode:** Place adjacent to water source = 0.25 EU/t\n**Active Mode:** Feed water buckets/cells = 2 EU/t\n\n**Recipe:**\n- 2 Sticks (top corners)\n- 3 Wood Planks (top center, middle sides)\n- 1 Generator (center)\n\n**Best setup:** Surround with water sources for passive generation, or pump water in for more power.\n\nGood for early game, but you'll need MANY for serious power." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockwatermill` × 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:bucket` | 4 |
| Item | `ic2:itemcable` meta 1 | 32 |

**Prerequisites:** Quest 7

**Unlocks:** Quest 11 (Power Comparison)

---

#### Quest 10: Geothermal Power
**Position:** Center-right (1, 2)
**Quest ID:** 35

| Property | Value |
|----------|-------|
| **Name** | Geothermal Power |
| **Icon** | `ic2:blockgeothermal` |
| **Description** | "The Geothermal Generator is your mid-game powerhouse!\n\n**Input:** Lava (buckets or cells)\n**Output:** 20 EU/t (double a coal Generator!)\n**Per Bucket:** 20,000 EU\n\n**Recipe:**\n- 4 Glass (corners)\n- 4 Refined Iron (edges)\n- 1 Generator (center)\n\n**Pro Setup:**\n1. Build a Pump in the Nether over a lava lake\n2. Pipe lava to Overworld using Ender Tanks\n3. Feed into Geothermal Generators\n4. Enjoy nearly infinite power!\n\nThis is THE power source for mid-game." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockgeothermal` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:lava_bucket` | 4 |
| Item | `ic2:itemingot` meta 3 (Refined Iron) | 8 |

**Prerequisites:** Quest 7

**Unlocks:** Quest 11 (Power Comparison)

---

#### Quest 11: Power Comparison
**Position:** Center (0, 3)
**Quest ID:** 36

| Property | Value |
|----------|-------|
| **Name** | Power Comparison |
| **Icon** | `minecraft:comparator` |
| **Description** | "Let's compare your power options:\n\n| Generator | Output | Fuel | Best For |\n|-----------|--------|------|----------|\n| Coal Gen | 10 EU/t | Coal | Early game |\n| Solar | 1 EU/t | None | Free, passive |\n| Water Mill | 0.25-2 EU/t | Water | Passive backup |\n| Geothermal | 20 EU/t | Lava | Main power |\n\n**Recommendation:**\n- Early: Coal Generators\n- Mid: Geothermal + Nether lava\n- Late: Solar arrays (Environmental Tech)\n- End: Draconic Evolution\n\nBuild at least one Geothermal to proceed!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:blockgeothermal` × 1, consume: false |
| Retrieval | `ic2:blocksolargenerator` × 1, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:lava_bucket` | 8 |
| Item | `minecraft:coal_block` | 16 |

**Prerequisites:** Quest 8, Quest 9, Quest 10

**Unlocks:** Quest 17 (Convergence: Advanced Machines)

---

### ENERGY STORAGE BRANCH (Quests 12-16)

#### Quest 12: Storing Energy
**Position:** Right branch (2, 1)
**Quest ID:** 37

| Property | Value |
|----------|-------|
| **Name** | Storing Energy |
| **Icon** | `ic2:blockmfe` |
| **Description** | "You already have a BatBox, but it only holds 40,000 EU.\n\nIC2 has a tiered energy storage system:\n\n| Tier | Block | Storage | Max EU/t |\n|------|-------|---------|----------|\n| LV | BatBox | 40,000 | 32 |\n| MV | CESU | 300,000 | 128 |\n| HV | MFE | 4,000,000 | 512 |\n| EV | MFSU | 10,000,000 | 2048 |\n\n**Warning:** Sending too much EU/t into a machine will EXPLODE it!\nMatch your cables and storage to your power tier." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Auto-complete on view |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemrebattery` | 4 |
| Item | `minecraft:redstone` | 32 |

**Prerequisites:** Quest 1

**Unlocks:** Quest 13 (CESU Step-Up)

---

#### Quest 13: CESU Step-Up
**Position:** Right branch (2, 2)
**Quest ID:** 38

| Property | Value |
|----------|-------|
| **Name** | CESU Step-Up |
| **Icon** | `ic2:blockcesu` |
| **Description** | "The CESU (Compact Energy Storage Unit) is your MV-tier storage.\n\n**Stats:**\n- Storage: 300,000 EU\n- Max Input/Output: 128 EU/t\n- Tier: MV (Medium Voltage)\n\n**Recipe:**\n- 5 Bronze Plates (top and sides)\n- 3 Advanced RE-Batteries (middle row)\n- 1 Bronze Plate (bottom center)\n\n**Advanced RE-Battery:** Crafted with 4 bronze, 2 gold cable, 2 sulfur dust\n\nThe CESU bridges the gap between early-game BatBox and late-game MFE." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockcesu` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemcable` meta 2 (Gold Cable) | 16 |
| Item | `ic2:itemingot` meta 2 (Bronze Ingot) | 16 |

**Prerequisites:** Quest 12

**Unlocks:** Quest 14 (MFE Power)

---

#### Quest 14: MFE Power
**Position:** Right branch (2, 3)
**Quest ID:** 39

| Property | Value |
|----------|-------|
| **Name** | MFE Power |
| **Icon** | `ic2:blockmfe` |
| **Description** | "The MFE (Medium Frequency Energy) stores serious power!\n\n**Stats:**\n- Storage: 4,000,000 EU (4M!)\n- Max Input/Output: 512 EU/t\n- Tier: HV (High Voltage)\n\n**Recipe:**\n- 4 Gold Cable (corners)\n- 4 Energy Crystals (edges)\n- 1 Machine Block (center)\n\n**Energy Crystal:** 9 Redstone around 1 Diamond\n\nThe MFE is your main storage for mid-game. Connect multiple generators to fill it up!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockmfe` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemenergycrystal` | 1 |
| Item | `minecraft:diamond` | 2 |

**Prerequisites:** Quest 13

**Unlocks:** Quest 15 (MFSU Mastery)

---

#### Quest 15: MFSU Mastery
**Position:** Right branch (2, 4)
**Quest ID:** 40

| Property | Value |
|----------|-------|
| **Name** | MFSU Mastery |
| **Icon** | `ic2:blockmfsu` |
| **Description** | "The MFSU (Multi-Functional Storage Unit) is IC2's ultimate storage!\n\n**Stats:**\n- Storage: 10,000,000 EU (10M!)\n- Max Input/Output: 2048 EU/t\n- Tier: EV (Extreme Voltage)\n\n**Recipe:**\n- 1 Lapotron Crystal (top center)\n- 1 Advanced Machine Block, 1 MFE, 1 Advanced Machine Block (middle)\n- 1 Advanced Circuit, 1 Advanced Machine Block, 1 Advanced Circuit (bottom)\n\n**Lapotron Crystal:** 6 Lapis around 1 Energy Crystal and 2 Circuits\n\nOne MFSU can power your entire base!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockmfsu` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemlapotroncrystal` | 1 |
| Item | `ic2:itemcable` meta 9 (Glass Fibre) | 16 |

**Prerequisites:** Quest 14

**Unlocks:** Quest 16 (Cable Tiers)

---

#### Quest 16: Cable Tiers
**Position:** Right branch (2, 5)
**Quest ID:** 41

| Property | Value |
|----------|-------|
| **Name** | Cable Tiers |
| **Icon** | `ic2:itemcable` meta 9 (Glass Fibre) |
| **Description** | "Different cables handle different voltages!\n\n| Cable | Max EU/t | Loss | Best For |\n|-------|----------|------|----------|\n| Copper | 32 | High | LV only |\n| Gold | 128 | Medium | MV |\n| HV | 512 | Low | HV |\n| Glass Fibre | 8192 | Minimal | Everything |\n\n**Warning:** Cable that's too weak will BURN and potentially explode!\n\n**Glass Fibre Cable:**\n- 6 Glass, 2 Silver Dust, 1 Diamond = 4 Cable\n\nGlass Fibre can carry any voltage with almost no loss. Worth the cost!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:itemcable` meta 9 (Glass Fibre) × 16, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemcable` meta 9 | 16 |
| Item | `minecraft:diamond` | 1 |

**Prerequisites:** Quest 15

**Unlocks:** Quest 17 (Convergence: Advanced Machines)

---

### ADVANCED MACHINES BRANCH (Quests 17-24)

#### Quest 17: Advanced Components
**Position:** Center bottom (0, 6)
**Quest ID:** 42

| Property | Value |
|----------|-------|
| **Name** | Advanced Components |
| **Icon** | `ic2:itempartcircuitadv` |
| **Description** | "You've mastered the three pillars of IC2:\n✓ Ore Processing\n✓ Power Generation\n✓ Energy Storage\n\nNow it's time to upgrade your machines!\n\nAdvanced machines require **Advanced Circuits** and **Advanced Machine Blocks**.\n\n**Advanced Circuit:**\n- 4 Redstone, 2 Glowstone, 2 Lapis\n- 1 Electronic Circuit (center)\n\nStock up - you'll need many of these!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:itempartcircuitadv` × 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:glowstone_dust` | 32 |
| Item | `minecraft:dye` meta 4 (Lapis) | 32 |

**Prerequisites:** Quest 6 (Compressor), Quest 11 (Power Comparison), Quest 16 (Cable Tiers)

**Unlocks:** Quest 18 (Advanced Machine Block)

---

#### Quest 18: Advanced Machine Block
**Position:** Center bottom (0, 7)
**Quest ID:** 43

| Property | Value |
|----------|-------|
| **Name** | Advanced Machine Block |
| **Icon** | `ic2:blockadvancedmachine` |
| **Description** | "The Advanced Machine Block is the foundation of upgraded machines.\n\n**Recipe:**\n- 2 Carbon Plates (top/bottom center)\n- 2 Advanced Alloy (left/right center)\n- 1 Machine Block (center)\n- 4 Steel Plates (corners)\n\n**Advanced Alloy:** Iron + Bronze + Tin plates compressed\n**Carbon Plate:** 8 Coal → Macerator → Compressor chain\n\nThese blocks are expensive but enable much faster machines!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockadvancedmachine` × 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemcarbonplate` | 8 |
| Item | `minecraft:iron_ingot` | 32 |

**Prerequisites:** Quest 17

**Unlocks:** Quest 19, Quest 20, Quest 21

---

#### Quest 19: Induction Furnace
**Position:** Left bottom (-1, 8)
**Quest ID:** 44

| Property | Value |
|----------|-------|
| **Name** | Induction Furnace |
| **Icon** | `ic2:blockinductionfurnace` |
| **Description** | "The Induction Furnace is a MASSIVE upgrade!\n\n**Features:**\n- Smelts TWO items at once\n- Gets faster as it heats up (up to 4x speed!)\n- Heat is maintained while powered\n\n**Recipe:**\n- 1 Advanced Circuit (top center)\n- 2 Copper Cable, 1 Advanced Machine Block (middle)\n- 1 Copper Cable, 1 Electric Furnace, 1 Copper Cable (bottom)\n\n**Pro tip:** Keep it running 24/7 - cold startup is slow, but a hot furnace is FAST." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockinductionfurnace` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuitadv` | 4 |
| Item | `minecraft:coal_block` | 16 |

**Prerequisites:** Quest 18

**Unlocks:** Quest 22 (Processing Upgrade)

---

#### Quest 20: Rotary Macerator
**Position:** Center bottom (0, 8)
**Quest ID:** 45

| Property | Value |
|----------|-------|
| **Name** | Rotary Macerator |
| **Icon** | `ic2:blockrotarymacerator` |
| **Description** | "The Rotary Macerator spins up to INSANE speeds!\n\n**Features:**\n- Starts slow, speeds up over time\n- At max speed: 4x faster than basic Macerator!\n- Maintains spin while powered\n\n**Recipe:**\n- 1 Advanced Circuit (top center)\n- 2 Advanced Alloy, 1 Advanced Machine Block (middle)\n- 1 Advanced Alloy, 1 Macerator, 1 Advanced Alloy (bottom)\n\n**Synergy:** Pair with Induction Furnace for blazing fast ore processing!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockrotarymacerator` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuitadv` | 4 |
| Item | `minecraft:iron_ore` | 64 |

**Prerequisites:** Quest 18

**Unlocks:** Quest 22 (Processing Upgrade)

---

#### Quest 21: Singularity Compressor
**Position:** Right bottom (1, 8)
**Quest ID:** 46

| Property | Value |
|----------|-------|
| **Name** | Singularity Compressor |
| **Icon** | `ic2:blocksingularitycompressor` |
| **Description** | "The Singularity Compressor uses micro black holes!\n\n**Features:**\n- Much faster compression\n- Same recipes as basic Compressor\n- Essential for mass Carbon Plate production\n\n**Recipe:**\n- 1 Advanced Circuit (top center)\n- 2 Advanced Alloy, 1 Advanced Machine Block (middle)\n- 1 Advanced Alloy, 1 Compressor, 1 Advanced Alloy (bottom)\n\n**Use case:** When making lots of Carbon Plates for Advanced Machine Blocks, speed matters!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blocksingularitycompressor` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itempartcircuitadv` | 4 |
| Item | `minecraft:coal` | 64 |

**Prerequisites:** Quest 18

**Unlocks:** Quest 22 (Processing Upgrade)

---

#### Quest 22: Processing Upgrade
**Position:** Center bottom (0, 9)
**Quest ID:** 47

| Property | Value |
|----------|-------|
| **Name** | Processing Upgrade |
| **Icon** | `ic2:itemupgrade` |
| **Description** | "Your advanced machines can be upgraded even further!\n\n**Overclocker Upgrade:**\n- Increases speed by 70%\n- Increases power usage by 160%\n- Stackable (diminishing returns)\n\n**Transformer Upgrade:**\n- Allows machine to accept higher voltage\n- Necessary for MFSU-tier power\n\n**Energy Storage Upgrade:**\n- Increases internal EU buffer\n- Helps with overclockers\n\n**Recipe (Overclocker):**\n- 2 Coolant Cells, 1 Electronic Circuit, 2 Copper Cable\n\nCareful - too many overclockers and your machine will consume enormous power!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | Overclocker Upgrade × 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | Overclocker Upgrade | 4 |
| Item | Transformer Upgrade | 2 |
| Item | Energy Storage Upgrade | 2 |

**Prerequisites:** Quest 19, Quest 20, Quest 21

**Unlocks:** Quest 23 (Centrifuge Extractor)

---

#### Quest 23: Centrifuge Extractor
**Position:** Center bottom (0, 10)
**Quest ID:** 48

| Property | Value |
|----------|-------|
| **Name** | Centrifuge Extractor |
| **Icon** | `ic2:blockcentrifugeextractor` |
| **Description** | "The Centrifuge Extractor completes your advanced machine set!\n\n**Features:**\n- Spins up like other advanced machines\n- Much faster rubber extraction\n- Also processes other extractable materials\n\n**Recipe:**\n- 1 Advanced Circuit (top center)\n- 2 Advanced Alloy, 1 Advanced Machine Block (middle)\n- 1 Advanced Alloy, 1 Extractor, 1 Advanced Alloy (bottom)\n\nWith all four advanced processors, your factory is ready for serious automation!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | `ic2:blockcentrifugeextractor` × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemharz` | 64 |
| Item | `ic2:itempartcircuitadv` | 4 |

**Prerequisites:** Quest 22

**Unlocks:** Quest 24 (Nuclear Preview)

---

#### Quest 24: Nuclear Preview
**Position:** Center bottom (0, 11)
**Quest ID:** 49

| Property | Value |
|----------|-------|
| **Name** | Nuclear Preview |
| **Icon** | `ic2:blockreactor` |
| **Description** | "There's one more power source we haven't covered: NUCLEAR!\n\n**Nuclear Reactors produce massive EU/t** but require careful design to avoid... accidents.\n\n**Components:**\n- Reactor Chamber (expands capacity)\n- Uranium Cells (fuel)\n- Coolant Cells (prevent meltdown)\n- Heat Vents (dissipate heat)\n\n**Warning:** A poorly designed reactor WILL explode and irradiate the area!\n\nFor now, just craft a Reactor Chamber to prove you understand the basics. Full nuclear engineering comes in Era IV!" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Crafting | Reactor Chamber × 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:iron_ingot` | 32 |
| Item | `minecraft:lead_ingot` | 16 |
| Item | Uranium Ore | 4 |

**Prerequisites:** Quest 23

**Unlocks:** Quest 25 (Era III Complete)

---

### ERA III COMPLETE

#### Quest 25: ERA III COMPLETE - The Age of Automation
**Position:** Center bottom (0, 12) - Make it larger/special
**Quest ID:** 50

| Property | Value |
|----------|-------|
| **Name** | ERA III COMPLETE: The Age of Automation |
| **Icon** | `buildcraft:blockquarry` |
| **Description** | "⚡ CONGRATULATIONS, MASTER ENGINEER! ⚡\n\nYou've conquered the Industrial Age:\n\n✓ Mastered ore processing (Macerator → 2x ores!)\n✓ Harnessed renewable energy (Solar, Geothermal)\n✓ Built EU storage infrastructure (MFE/MFSU)\n✓ Upgraded to advanced machines\n✓ Previewed nuclear power\n\nBut your factory still requires manual work. Time to change that!\n\n**Era IV: Automation Age**\nBuildCraft pipes, engines, and the legendary QUARRY await. Your machines will run themselves while you focus on bigger projects.\n\n🔧 Welcome to TRUE automation! 🔧" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Retrieval | `ic2:blockmfe` × 1, consume: false |
| Retrieval | `ic2:blockmacerator` × 1, consume: false |
| Retrieval | `ic2:blockelectricfurnace` × 1, consume: false |
| Retrieval | `ic2:blockextractor` × 1, consume: false |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:firework_rocket` | 16 |
| Item | `ic2:itempartcircuitadv` | 8 |
| Item | `buildcraft:pipeitemsiron` | 16 |
| Item | `minecraft:diamond` | 4 |
| XP | 2000 XP | - |

**Prerequisites:** Quest 24 (Nuclear Preview)

**Special:** This quest unlocks Era IV: Automation Age

---

## Visual Layout (Full)

```
                              [1. Welcome to Industry]
                                        |
              ┌─────────────────────────┼─────────────────────────┐
              ▼                         ▼                         ▼
    [2. The Macerator]       [7. Alternative Energy]    [12. Storing Energy]
              |                         |                         |
    [3. Double Your Ores]    ┌─────────┼─────────┐      [13. CESU Step-Up]
              |              ▼         ▼         ▼                |
    [4. Electric Furnace]  [8.Sol]  [9.Wat]  [10.Geo]   [14. MFE Power]
              |              └─────────┼─────────┘                |
    [5. The Extractor]                 ▼                [15. MFSU Mastery]
              |              [11. Power Comparison]               |
    [6. The Compressor]                |                [16. Cable Tiers]
              |                        |                          |
              └────────────────────────┼──────────────────────────┘
                                       ▼
                          [17. Advanced Components]
                                       |
                          [18. Advanced Machine Block]
                                       |
                    ┌──────────────────┼──────────────────┐
                    ▼                  ▼                  ▼
          [19. Induction]    [20. Rotary Mac]    [21. Singularity]
                    └──────────────────┼──────────────────┘
                                       ▼
                          [22. Processing Upgrade]
                                       |
                          [23. Centrifuge Extractor]
                                       |
                          [24. Nuclear Preview]
                                       |
                          [25. ERA III COMPLETE]
                                       |
                                       ▼
                          [Era IV: Automation Age]
```

---

## Quest Dependencies Summary

```
1 → 2 → 3 → 4 → 5 → 6 ────────────────────┐
1 → 7 → 8 ─┐                              │
1 → 7 → 9 ─┼→ 11 ─────────────────────────┼→ 17 → 18 → 19 ─┐
1 → 7 → 10 ┘                              │       ├→ 20 ─┼→ 22 → 23 → 24 → 25
1 → 12 → 13 → 14 → 15 → 16 ───────────────┘       └→ 21 ─┘
```

---

## Testing Checklist

After creating all quests:

- [ ] Era III becomes visible after Era II completion
- [ ] Three branches unlock from Quest 1
- [ ] Ore Processing branch (2-6) works sequentially
- [ ] Power Gen branch allows parallel completion (8, 9, 10)
- [ ] Quest 11 requires ALL THREE power types
- [ ] Energy Storage branch (12-16) works sequentially
- [ ] Quest 17 requires ALL THREE branches complete (6, 11, 16)
- [ ] Advanced Machines branch (17-24) works correctly
- [ ] Quest 22 requires all three advanced machines (19, 20, 21)
- [ ] Quest 25 verifies ownership of key machines
- [ ] All rewards dispense correctly
- [ ] Run `/bq_admin default save` when complete

---

## Notes for Implementation

### Convergence Points
Era III has TWO convergence points:
1. **Quest 17** - Requires completing ALL THREE branches (Ore, Power, Storage)
2. **Quest 22** - Requires all three advanced processors (19, 20, 21)

### Branch Balance
Each branch has roughly equal length:
- Ore Processing: 5 quests
- Power Generation: 5 quests  
- Energy Storage: 5 quests
- Advanced Machines: 8 quests
- Gateway: 1 quest

### Teaching Goals
| Branch | What Players Learn |
|--------|-------------------|
| Ore Processing | Machine recipes, ore doubling, processing chain |
| Power Generation | Renewable energy options, Geothermal setup |
| Energy Storage | Voltage tiers, cable types, storage scaling |
| Advanced | Upgrading machines, preparing for automation |

### Handoff to Era IV
Era IV: Automation Age will cover:
- BuildCraft engines (Redstone, Stirling, Combustion)
- Pipe networks (Transport, Fluid, Kinesis)
- Quarry operation
- Auto-crafting tables
- Energy Converters (EU ↔ MJ ↔ RF)

---

*Implementation Time Estimate: 60-90 minutes*
*Quest IDs: 26-50 (continuing from Era II's 11-25)*
*Save frequently with `/bq_admin default save`*
