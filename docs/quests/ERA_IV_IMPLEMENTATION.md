# Era IV: Automation Age - Quest Implementation Guide

> **Purpose:** Step-by-step instructions for implementing Era IV quests in Better Questing
> **Total Quests:** ~20-25 (estimated)
> **Theme:** BuildCraft automation, pipes, engines, logistics, Quarry mining
> **Prereq:** Era III Complete (Quest 48)

---

## Overview

Era IV transitions players from manual IC2 machine operation to **fully automated systems** using BuildCraft. Players will:

1. Learn the fundamentals of MJ (Minecraft Joules) power
2. Build engines to power BuildCraft machines
3. Master pipe logistics (item, fluid, power transport)
4. Automate their IC2 factories with pipes
5. Unlock the legendary **Quarry** for automated mining
6. Prepare for cross-mod power integration

### Design Philosophy

Era IV is about the **"Aha!" moment** when players realize machines can run themselves. The progression should feel rewarding:

- Early: "I made a pipe move items!"
- Mid: "My whole smeltery runs automatically!"
- Late: "The Quarry mines FOR me while I build!"

---

## Pre-Implementation Research

### BuildCraft 7.99.24.8 Item IDs

> **NOTE:** Verify all IDs with `/ct hand` in-game before implementation!

#### Engines (Power Generation)

| Engine | Registry ID | Output | Fuel |
|--------|-------------|--------|------|
| **Redstone Engine** | `buildcraftcore:engine:0` | 1 RF/t | Redstone signal |
| **Stirling Engine** | `buildcraftcore:engine:1` | 10-40 RF/t | Solid fuels |
| **Combustion Engine** | `buildcraftcore:engine:2` | 30-60 RF/t | Oil/Fuel + Coolant |

#### Pipes - Item Transport

| Pipe | Registry ID | Function |
|------|-------------|----------|
| **Cobblestone Pipe** | `buildcrafttransport:pipe_cobblestone_item` | Cheap, slow |
| **Stone Pipe** | `buildcrafttransport:pipe_stone_item` | No connections to cobble |
| **Gold Pipe** | `buildcrafttransport:pipe_gold_item` | Speed boost |
| **Iron Pipe** | `buildcrafttransport:pipe_iron_item` | One-way, switchable |
| **Diamond Pipe** | `buildcrafttransport:pipe_diamond_item` | Sorting/filtering |
| **Obsidian Pipe** | `buildcrafttransport:pipe_obsidian_item` | Item pickup from world |
| **Emzuli Pipe** | `buildcrafttransport:pipe_emzuli_item` | Advanced extraction |

#### Pipes - Fluid Transport

| Pipe | Registry ID | Function |
|------|-------------|----------|
| **Cobblestone Fluid Pipe** | `buildcrafttransport:pipe_cobblestone_fluid` | Basic fluid |
| **Stone Fluid Pipe** | `buildcrafttransport:pipe_stone_fluid` | No cobble connect |
| **Gold Fluid Pipe** | `buildcrafttransport:pipe_gold_fluid` | Faster flow |
| **Iron Fluid Pipe** | `buildcrafttransport:pipe_iron_fluid` | One-way fluid |
| **Wooden Fluid Pipe** | `buildcrafttransport:pipe_wood_fluid` | Extraction |

#### Pipes - Power (Kinesis)

| Pipe | Registry ID | Max RF/t |
|------|-------------|----------|
| **Wood Kinesis Pipe** | `buildcrafttransport:pipe_wood_power` | Extraction only |
| **Cobblestone Kinesis Pipe** | `buildcrafttransport:pipe_cobblestone_power` | 80 RF/t |
| **Stone Kinesis Pipe** | `buildcrafttransport:pipe_stone_power` | 160 RF/t |
| **Quartz Kinesis Pipe** | `buildcrafttransport:pipe_quartz_power` | 320 RF/t |
| **Gold Kinesis Pipe** | `buildcrafttransport:pipe_gold_power` | 1280 RF/t |
| **Diamond Kinesis Pipe** | `buildcrafttransport:pipe_diamond_power` | 10240 RF/t |

#### Machines

| Machine | Registry ID | Function |
|---------|-------------|----------|
| **Quarry** | `buildcraftbuilders:quarry` | Auto-mining |
| **Mining Well** | `buildcraftfactory:mining_well` | Single-column mining |
| **Pump** | `buildcraftfactory:pump` | Fluid extraction |
| **Tank** | `buildcraftfactory:tank` | Fluid storage (16B) |
| **Refinery** | `buildcraftfactory:refinery` | Oil → Fuel |
| **Auto Workbench** | `buildcraftfactory:autoworkbench_item` | Auto-crafting |
| **Chute** | `buildcraftfactory:chute` | Item input |

#### Gears (Crafting Components)

| Gear | Registry ID | Recipe |
|------|-------------|--------|
| **Wood Gear** | `buildcraftcore:gear_wood` | 4 sticks |
| **Stone Gear** | `buildcraftcore:gear_stone` | 4 cobble + wood gear |
| **Iron Gear** | `buildcraftcore:gear_iron` | 4 iron + stone gear |
| **Gold Gear** | `buildcraftcore:gear_gold` | 4 gold + iron gear |
| **Diamond Gear** | `buildcraftcore:gear_diamond` | 4 diamond + gold gear |

---

## Quest Structure

Era IV has a **linear start** that branches into **specializations**:

```
              [Welcome to Automation]
                        |
                 [Gear Crafting]
                        |
                  [First Engine]
                        |
            ┌───────────┼───────────┐
            ▼           ▼           ▼
       [ITEM PIPES] [FLUID PIPES] [POWER PIPES]
        (4 quests)   (3 quests)   (3 quests)
            |           |           |
            └───────────┼───────────┘
                        ▼
              [AUTOMATION PROJECTS]
                   (4 quests)
                        |
                  [THE QUARRY]
                   (3 quests)
                        |
               [ERA IV COMPLETE]
```

---

## Quest Specifications

### INTRODUCTION BRANCH

#### Quest 49: Welcome to Automation
**Position:** Center (0, 0)
**Quest ID:** 49
**Prerequisite:** Quest 48 (Era III Complete)

| Property | Value |
|----------|-------|
| **Name** | Welcome to Automation |
| **Icon** | `buildcraftfactory:autoworkbench_item` |
| **Description** | "Master Engineer!\n\nYour IC2 factory hums with power, but every item still needs your hands. It's time to change that.\n\nBuildCraft introduces PIPES - the arteries of automation. Items flow, fluids pump, power transmits... all without you lifting a finger.\n\nBy the end of this era, machines will feed machines, and you'll unlock the legendary QUARRY - a device that mines entire chunks automatically!\n\nWelcome to the Automation Age." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Auto-complete introduction |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:stick` | 32 |
| Item | `minecraft:cobblestone` | 64 |
| XP | 300 XP | - |

---

#### Quest 50: The Gear System
**Position:** (0, 48)
**Quest ID:** 50
**Prerequisite:** Quest 49

| Property | Value |
|----------|-------|
| **Name** | The Gear System |
| **Icon** | `buildcraftcore:gear_iron` |
| **Description** | "BuildCraft machines need GEARS - mechanical components that transfer rotational force.\n\nThe gear progression:\n🟫 **Wood Gear** - 4 sticks in a cross\n⬜ **Stone Gear** - 4 cobble around a wood gear\n⬛ **Iron Gear** - 4 iron around a stone gear\n🟨 **Gold Gear** - 4 gold around an iron gear\n💎 **Diamond Gear** - 4 diamond around a gold gear\n\nStart simple. Craft the foundation of all BuildCraft machines!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftcore:gear_wood` | 4 |
| Crafting | `buildcraftcore:gear_stone` | 4 |
| Crafting | `buildcraftcore:gear_iron` | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcraftcore:gear_iron` | 4 |
| Item | `minecraft:gold_ingot` | 8 |

---

#### Quest 51: Stirling Engine
**Position:** (0, 96)
**Quest ID:** 51
**Prerequisite:** Quest 50

| Property | Value |
|----------|-------|
| **Name** | Your First Engine |
| **Icon** | `buildcraftcore:engine:1` |
| **Description** | "Engines convert fuel into MJ (Minecraft Joules) - BuildCraft's power unit.\n\nThe **Stirling Engine** burns solid fuels (coal, wood) and produces steady power.\n\n⚠️ **IMPORTANT:** Engines need a redstone signal to run! Place a lever next to it and flip it ON.\n\n💡 **Tip:** Engines can overheat and explode if not outputting power. Always connect them to something that uses power!\n\nRecipe: 3 Cobble, 1 Glass, 1 Iron Gear, 2 Stone, 1 Piston" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftcore:engine:1` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:coal` | 64 |
| Item | `minecraft:lever` | 4 |
| Item | `buildcraftcore:gear_stone` | 8 |

---

### ITEM PIPES BRANCH

#### Quest 52: Wooden Extraction Pipe
**Position:** (-64, 144)
**Quest ID:** 52
**Prerequisite:** Quest 51

| Property | Value |
|----------|-------|
| **Name** | Extraction Basics |
| **Icon** | `buildcrafttransport:pipe_wood_item` |
| **Description** | "The **Wooden Pipe** is special - it EXTRACTS items from inventories.\n\nHow it works:\n1. Place wooden pipe against a chest/machine\n2. Connect an engine to the wooden pipe\n3. Power the engine with redstone\n4. Items get pulled out!\n\nWooden pipes don't connect to each other - they're extraction only.\n\nRecipe: Wood Plank + Glass + Wood Plank (shapeless)" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcrafttransport:pipe_wood_item` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcrafttransport:pipe_wood_item` | 8 |
| Item | `minecraft:glass` | 32 |

---

#### Quest 53: Transport Pipes
**Position:** (-64, 192)
**Quest ID:** 53
**Prerequisite:** Quest 52

| Property | Value |
|----------|-------|
| **Name** | Transport Network |
| **Icon** | `buildcrafttransport:pipe_stone_item` |
| **Description** | "Transport pipes carry items from A to B.\n\n**Cobblestone Pipe** - Cheap but connects to everything\n**Stone Pipe** - Won't connect to cobblestone (useful for routing!)\n**Gold Pipe** - Speeds up items passing through\n\nPro Tips:\n- Items that reach a dead end get ejected into the world\n- Always have a destination chest at the end of your network\n- Use stone/cobble mismatch to prevent unwanted connections" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcrafttransport:pipe_cobble_item` | 16 |
| Crafting | `buildcrafttransport:pipe_stone_item` | 8 |
| Crafting | `buildcrafttransport:pipe_gold_item` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcrafttransport:pipe_stone_item` | 16 |
| Item | `minecraft:chest` | 8 |

---

#### Quest 54: Iron Pipe Routing
**Position:** (-64, 240)
**Quest ID:** 54
**Prerequisite:** Quest 53

| Property | Value |
|----------|-------|
| **Name** | Directional Control |
| **Icon** | `buildcrafttransport:pipe_iron_item` |
| **Description** | "The **Iron Pipe** only outputs in ONE direction!\n\nRight-click to change the output direction. Use this to:\n- Split lines without items going backward\n- Create one-way systems\n- Direct items to specific machines\n\nCombine with redstone to switch directions automatically!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcrafttransport:pipe_iron_item` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcrafttransport:pipe_iron_item` | 8 |
| Item | `minecraft:redstone` | 16 |

---

#### Quest 55: Diamond Sorting Pipe
**Position:** (-64, 288)
**Quest ID:** 55
**Prerequisite:** Quest 54

| Property | Value |
|----------|-------|
| **Name** | Smart Sorting |
| **Icon** | `buildcrafttransport:pipe_diamond_item` |
| **Description** | "The **Diamond Pipe** is the brain of your item network!\n\nRight-click to open the GUI and assign items to colors. Items matching a filter go that direction.\n\nExample:\n- North (Black): Iron Ore → Macerator\n- South (White): Iron Dust → Furnace\n- West (Red): Iron Ingots → Storage\n\nUnfiltered items take the default (no color) direction.\n\nThis single pipe enables full factory automation!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcrafttransport:pipe_diamond_item` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcrafttransport:pipe_diamond_item` | 2 |
| Item | `minecraft:diamond` | 4 |

---

### FLUID PIPES BRANCH

#### Quest 56: Fluid Transport
**Position:** (0, 144)
**Quest ID:** 56
**Prerequisite:** Quest 51

| Property | Value |
|----------|-------|
| **Name** | Liquid Logistics |
| **Icon** | `buildcrafttransport:pipe_wood_fluid` |
| **Description** | "Fluid pipes work like item pipes but for liquids!\n\n**Wooden Fluid Pipe** - Extracts from tanks/machines\n**Cobblestone/Stone Fluid Pipe** - Transport\n**Gold Fluid Pipe** - Faster flow\n**Iron Fluid Pipe** - One-way flow\n\nPerfect for:\n- Pumping lava to Geothermal Generators\n- Moving water for farming\n- Oil processing systems" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcrafttransport:pipe_wood_fluid` | 4 |
| Crafting | `buildcrafttransport:pipe_stone_fluid` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcrafttransport:pipe_stone_fluid` | 16 |
| Item | `buildcraftfactory:tank` | 2 |

---

#### Quest 57: BuildCraft Tanks
**Position:** (0, 192)
**Quest ID:** 57
**Prerequisite:** Quest 56

| Property | Value |
|----------|-------|
| **Name** | Tank Storage |
| **Icon** | `buildcraftfactory:tank` |
| **Description** | "BuildCraft Tanks store 16 buckets of any fluid.\n\nStack them vertically to increase capacity - they auto-connect!\n\nRecipe: 8 Glass in a ring\n\nUse for:\n- Lava buffer for Geothermals\n- Water storage for farms\n- Oil/Fuel storage for refineries\n\nPro tip: Place tanks adjacent horizontally and they stay separate - useful for multiple fluid types!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftfactory:tank` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:lava_bucket` | 8 |
| Item | `minecraft:glass` | 32 |

---

#### Quest 58: The Pump
**Position:** (0, 240)
**Quest ID:** 58
**Prerequisite:** Quest 57

| Property | Value |
|----------|-------|
| **Name** | Fluid Extraction |
| **Icon** | `buildcraftfactory:pump` |
| **Description** | "The **Pump** extracts fluids from the world!\n\nPlace it above a liquid and power it with an engine. It will:\n- Drain lakes (water, oil)\n- Pull lava from the Nether\n- Work through any depth\n\nPro Setup: Pump + Fluid Pipes + Ender Tank = Nether lava to Overworld!\n\nRecipe: 1 Tank, 2 Iron Gear, 1 Mining Well, 4 Iron Ingot\n(Mining Well: 3 Iron, 3 Iron Gear, 1 Redstone)" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftfactory:pump` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcraftcore:engine:1` | 2 |
| Item | `buildcrafttransport:pipe_gold_fluid` | 8 |

---

### POWER PIPES BRANCH

#### Quest 59: Kinesis Pipes
**Position:** (64, 144)
**Quest ID:** 59
**Prerequisite:** Quest 51

| Property | Value |
|----------|-------|
| **Name** | Power Distribution |
| **Icon** | `buildcrafttransport:pipe_wood_power` |
| **Description** | "Kinesis Pipes transport MJ power!\n\n**Wooden Kinesis Pipe** - Extracts from engines\n**Cobblestone Kinesis** - 80 MJ/t max\n**Stone Kinesis** - 160 MJ/t\n**Gold Kinesis** - 1280 MJ/t\n**Diamond Kinesis** - 10240 MJ/t\n\n⚠️ Power is lost over distance! Keep engines close to machines, or use better pipes.\n\nAlways start with a Wooden Kinesis Pipe attached to your engine!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcrafttransport:pipe_wood_power` | 4 |
| Crafting | `buildcrafttransport:pipe_stone_power` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcrafttransport:pipe_gold_power` | 4 |
| Item | `minecraft:redstone` | 32 |

---

#### Quest 60: Energy Bridge (EU ↔ MJ)
**Position:** (64, 192)
**Quest ID:** 60
**Prerequisite:** Quest 59

| Property | Value |
|----------|-------|
| **Name** | Power Conversion |
| **Icon** | `energyconverters:energy_bridge` |
| **Description** | "You have IC2 EU power and need BuildCraft MJ power. Solution: Energy Converters!\n\nThe **Energy Bridge** is the hub. Attach:\n- **EU Consumer** - Accepts IC2 EU\n- **MJ Producer** - Outputs BuildCraft MJ\n\nConversion: 2.5 EU = 1 MJ (approximately)\n\nNow your IC2 power infrastructure can run BuildCraft machines without separate engines!\n\nRecipe: Check JEI for Energy Converters mod recipes" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `energyconverters:energy_bridge` | 1 |
| Retrieval | `energyconverters:energy_consumer_eu` | 1 |
| Retrieval | `energyconverters:energy_producer_mj` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `energyconverters:energy_bridge` | 1 |
| Item | `ic2:itemcable:1` | 32 |

---

#### Quest 61: Combustion Engine
**Position:** (64, 240)
**Quest ID:** 61
**Prerequisite:** Quest 60

| Property | Value |
|----------|-------|
| **Name** | High Power Engines |
| **Icon** | `buildcraftcore:engine:2` |
| **Description** | "The **Combustion Engine** is BuildCraft's powerhouse!\n\nFuel: Oil (slow) or Fuel (fast)\nCoolant: Water (required!)\nOutput: 30-60 MJ/t\n\n⚠️ **DANGER:** Without coolant, combustion engines EXPLODE!\n\nSetup:\n1. Pipe water into the engine constantly\n2. Pipe oil/fuel into the engine\n3. Connect to machine via kinesis pipe\n4. Activate with redstone\n\nOne combustion engine can power a Quarry!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftcore:engine:2` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcraftfactory:tank` | 4 |
| Item | `minecraft:bucket` | 8 |

---

### AUTOMATION PROJECTS

#### Quest 62: Automated Ore Processing
**Position:** (0, 336)
**Quest ID:** 62
**Prerequisite:** Quest 55, Quest 58, Quest 59 (all pipe branches)

| Property | Value |
|----------|-------|
| **Name** | Factory Assembly |
| **Icon** | `ic2:te:4` (Macerator) |
| **Description** | "Time to connect the dots!\n\nBuild an automated ore processing line:\n1. Chest (input) → Wooden Pipe → Diamond Pipe\n2. Diamond Pipe sorts: Ore → Macerator, Dust → Furnace\n3. Macerator → Pipe → back to Diamond Pipe (dust out)\n4. Furnace → Pipe → Output Chest\n\nOne setup processes ALL your ores automatically!\n\nBonus: Use Induction Furnace for 2x speed." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:te:4` | 1 |
| Retrieval | `ic2:te:2` | 1 |
| Retrieval | `buildcrafttransport:pipe_diamond_item` | 1 |
| Retrieval | `buildcraftcore:engine:1` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:iron_ore` | 64 |
| Item | `minecraft:gold_ore` | 32 |
| Item | `buildcrafttransport:pipe_gold_item` | 16 |

---

#### Quest 63: Lava Power Station
**Position:** (-48, 384)
**Quest ID:** 63
**Prerequisite:** Quest 62

| Property | Value |
|----------|-------|
| **Name** | Geothermal Array |
| **Icon** | `ic2:te:8` (Geothermal) |
| **Description** | "Build a self-sustaining lava power station!\n\nSetup:\n1. Pump in Nether (above lava lake)\n2. Fluid pipes to Ender Tank (or long pipe run)\n3. Ender Tank in Overworld\n4. Fluid pipes to multiple Geothermal Generators\n5. Geothermals feed into MFSU\n\nResult: Infinite power from Nether lava!\n\nPro tip: One pump can supply 4-6 Geothermals." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `buildcraftfactory:pump` | 1 |
| Retrieval | `ic2:te:8` | 4 |
| Retrieval | `buildcrafttransport:pipe_stone_fluid` | 32 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:lava_bucket` | 16 |
| Item | `ic2:itemlapotroncrystal` | 1 |
| XP | 500 XP | - |

---

### THE QUARRY

#### Quest 64: Mining Well
**Position:** (48, 384)
**Quest ID:** 64
**Prerequisite:** Quest 62

| Property | Value |
|----------|-------|
| **Name** | Drilling Down |
| **Icon** | `buildcraftfactory:mining_well` |
| **Description** | "The **Mining Well** is the Quarry's little brother.\n\nIt drills a single column straight down to bedrock, replacing stone with Mining Pipe.\n\nUseful for:\n- Quick vertical shafts\n- Testing power setups\n- Crafting ingredient for Pump\n\nRecheap: 3 Iron, 3 Iron Gear, 2 Stone Gear, 1 Redstone" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftfactory:mining_well` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `buildcraftcore:gear_gold` | 2 |
| Item | `minecraft:diamond` | 4 |

---

#### Quest 65: The Legendary Quarry
**Position:** (0, 432)
**Quest ID:** 65
**Prerequisite:** Quest 63, Quest 64

| Property | Value |
|----------|-------|
| **Name** | The Quarry |
| **Icon** | `buildcraftbuilders:quarry` |
| **Description** | "THE QUARRY - the most iconic BuildCraft machine!\n\nWhat it does:\n- Mines a configurable area (default 9x9, max 64x64)\n- Digs from surface to bedrock\n- Outputs items via pipes or adjacent inventory\n\nRecipe:\n- 2 Diamond Gear (corners)\n- 2 Gold Gear (corners)\n- 3 Iron Gear (bottom)\n- 2 Diamond Pickaxe (sides)\n- 1 Redstone (center)\n\nPower: Needs ~15-30 MJ/t for good speed. Use Combustion Engine or EU→MJ converter.\n\nThis. Changes. Everything." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `buildcraftbuilders:quarry` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:diamond_pickaxe` | 2 |
| Item | `buildcraftcore:gear_diamond` | 4 |
| Item | `minecraft:emerald` | 8 |
| XP | 1000 XP | - |

---

#### Quest 66: Quarry Operations
**Position:** (0, 480)
**Quest ID:** 66
**Prerequisite:** Quest 65

| Property | Value |
|----------|-------|
| **Name** | Full Automation |
| **Icon** | `minecraft:diamond_ore` |
| **Description** | "Your Quarry is built. Now optimize it!\n\nSetup Checklist:\n☐ Power source (Combustion Engine / EU converter)\n☐ Landmark poles for custom area (optional)\n☐ Chest or pipe on Quarry for item output\n☐ Pipe network to sorting system\n☐ Void pipe or overflow for cobblestone/dirt\n\nPro Tips:\n- Use Diamond Pipe to sort ores from junk\n- 4 Stirling Engines = slow but works\n- 1 Combustion Engine = good speed\n- EU→MJ from MFSU = best efficiency\n\nRun your Quarry overnight. Wake up to thousands of ores!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `minecraft:diamond_ore` | 16 |
| Retrieval | `minecraft:gold_ore` | 32 |
| Retrieval | `minecraft:iron_ore` | 128 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:diamond_block` | 4 |
| Item | `minecraft:emerald_block` | 2 |
| Item | `buildcrafttransport:pipe_void_item` | 8 |

---

### ERA COMPLETION

#### Quest 67: ERA IV COMPLETE
**Position:** (0, 544)
**Quest ID:** 67
**Prerequisite:** Quest 66

| Property | Value |
|----------|-------|
| **Name** | ERA IV COMPLETE: Master of Automation |
| **Icon** | `buildcraftbuilders:quarry` |
| **Description** | "AUTOMATION MASTER!\n\nYou've achieved what few engineers dream of:\n\n✅ Built self-running factories\n✅ Mastered pipe logistics\n✅ Connected IC2 and BuildCraft power\n✅ Deployed automated mining\n\nYour machines work while you sleep. Resources flow like water. The foundation is complete.\n\nBut there's more...\n\nEra V introduces NUCLEAR POWER - reactors, uranium processing, and the incredible energy output that powers end-game tech.\n\nOr perhaps you'll explore ProjectE and turn dirt into diamonds?\n\nThe choice is yours, Engineer." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `buildcraftbuilders:quarry` | 1 |
| Retrieval | `buildcrafttransport:pipe_diamond_item` | 4 |
| Retrieval | `ic2:te:74` (MFSU) | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:firework_rocket` | 32 |
| Item | `minecraft:nether_star` | 1 |
| Item | `ic2:itemcrafting:2` (Adv Circuit) | 16 |
| Item | `minecraft:diamond_block` | 8 |
| XP | 3000 XP | - |

---

## Quest Line Configuration Summary

| Property | Value |
|----------|-------|
| **Line ID** | 3 |
| **Name** | Era IV: Automation Age |
| **Description** | "Machines that run themselves! Master BuildCraft pipes and engines, automate your IC2 factory, and deploy the legendary Quarry to mine while you sleep. The age of manual labor is over." |
| **Icon** | `buildcraftbuilders:quarry` |
| **Visibility** | UNLOCKED (after Quest 48) |
| **Order** | 3 |

---

## Implementation Checklist

### Pre-Implementation
- [ ] Verify ALL BuildCraft item IDs with `/ct hand`
- [ ] Check Energy Converters mod item IDs
- [ ] Confirm BuildCraft version compatibility (7.99.24.8)
- [ ] Test engine explosion mechanics for quest warnings

### Quest Creation
- [ ] Create Quest Line in BQ Editor
- [ ] Add all 19 quests with correct prerequisites
- [ ] Set icons using verified item IDs
- [ ] Configure tasks (crafting, retrieval, checkbox)
- [ ] Add rewards

### Visual Layout
- [ ] Arrange quests in tree structure (see diagram above)
- [ ] Branch points: Introduction → 3 Pipe branches → Automation → Quarry
- [ ] Ensure connecting lines are clear

### Testing
- [ ] Complete Quest 48 → Era IV unlocks
- [ ] All quests completable with correct items
- [ ] Rewards grant correctly
- [ ] Quest 67 unlocks Era V

---

## Notes for Integrator

### Known Issues to Watch
1. **BuildCraft pipe IDs** may vary - verify each one
2. **Energy Converters** mod uses different naming conventions
3. **Combustion Engine explosion** - ensure warning text is clear
4. **Quarry power requirements** changed in BC 7.99.x - verify

### Recipe Research Needed
- Energy Bridge crafting recipe
- EU Consumer / MJ Producer recipes
- Void Pipe recipe (for overflow management)

### Cross-References
- `research/IC2_CLASSIC_QUICK_REFERENCE.md` - IC2 items
- `config/buildcraft/main.cfg` - BC settings
- `config/energyconverters.cfg` - Power ratios

---

*Document created by Curator Agent. Ready for Integrator implementation.*
