# EnergyCraft Technical Reference Compilation

This document compiles technical references, syntax guides, and documentation links for modpack development.

**Last Updated:** 2026-02-02  
**Research Status:** Comprehensive compilation from documentation, configs, and in-game verification

---

## Table of Contents
1. [CraftTweaker 1.12.2](#1-crafttweaker-1122-quick-reference)
2. [IC2 Classic](#2-ic2-classic-reference)
3. [BuildCraft](#3-buildcraft-reference)
4. [Draconic Evolution](#4-draconic-evolution-reference)
5. [ProjectE EMC](#5-projecte-emc-reference)
6. [Project Red](#6-project-red-reference)
7. [Forestry](#7-forestry-reference)
8. [Energy Conversion](#8-energy-conversion-ratios)
9. [Logistics Pipes](#9-logistics-pipes-reference)
10. [File Locations](#10-file-locations-quick-reference)

---

## 1. CraftTweaker 1.12.2 Quick Reference

### Basic Syntax

```zs
// Import (optional but recommended)
import crafttweaker.item.IItemStack;

// Variables
val item = <modid:itemname>;        // Immutable
var item = <modid:itemname>;        // Mutable
val anyMeta = <modid:item:*>;       // Wildcard meta
val stack = <modid:item> * 4;       // Stack of 4

// Ore Dictionary
<ore:ingotIron>                     // Ore dict entry
<ore:ingotIron>.firstItem           // First item in ore dict
```

### Recipe Operations

```zs
// REMOVE recipes
recipes.remove(<modid:item>);                    // Remove all recipes for item
recipes.removeShaped(<modid:item>);              // Remove only shaped
recipes.removeShapeless(<modid:item>);           // Remove only shapeless
recipes.removeByMod("modid");                    // Remove all from mod
recipes.removeByInput(<modid:item>);             // Remove recipes using item

// ADD shaped recipe (1.12 requires unique name!)
recipes.addShaped("recipe_name", <output>, [
    [<item>, <item>, <item>],
    [<item>, null, <item>],
    [<item>, <item>, <item>]
]);

// ADD shapeless recipe
recipes.addShapeless("recipe_name", <output>, [<item1>, <item2>, <item3>]);

// ADD mirrored recipe
recipes.addShapedMirrored("recipe_name", <output>, [[<a>, <b>], [<c>, <d>]]);
```

### Useful Commands

| Command | Purpose |
|---------|---------|
| `/ct hand` | Print held item's bracket notation |
| `/ct inventory` | Dump inventory to log |
| `/ct recipes` | List all recipes |
| `/ct oredict` | List ore dictionary |
| `/ct syntax` | Syntax help |
| `/ct reload` | Reload scripts without restart |

### Common Patterns

```zs
// Damaged items as input
<minecraft:stone_pickaxe>.anyDamage()

// NBT matching
<minecraft:potion>.withTag({Potion: "minecraft:healing"})

// Multiple valid inputs (ore dict style)
<ore:ingotIron> | <ore:ingotCopper>
```

**Documentation:** https://docs.blamejared.com/1.12/en/

---

## 2. IC2 Classic Reference

### Item Bracket Format
```zs
<ic2:itemname>           // Basic item
<ic2:itemname:meta>      // With metadata
```

### Common Item IDs (verify with /ct hand)

| Category | Example IDs |
|----------|-------------|
| **Machines** | `<ic2:blockmachine:X>` where X = machine type |
| **Cables** | `<ic2:cable:X>` |
| **Tools** | `<ic2:wrench>`, `<ic2:treetap>` |
| **Armor** | `<ic2:quantum_helmet>` |
| **Resources** | `<ic2:ingot:X>`, `<ic2:dust:X>` |

### Machine Metadata (IC2 Classic specific - verify in-game!)

Common machine block IDs:
- Generator
- Macerator  
- Electric Furnace
- Extractor
- Compressor
- Canning Machine
- Recycler
- Mass Fabricator

**Note:** IC2 Classic uses different IDs than IC2 Experimental!

### Config Location
`config/ic2/ic2.cfg`

Key config sections:
- `balance` - EU costs, output rates, RF per EU ratio (default: 8)
- `crafting` - Recipe toggles, steel mode, recycler blacklist
- `features` - Gameplay features, easy mode, explosion settings
- `world` - Ore generation, explosion power

### IC2 Classic Energy Values

**Generator Output (EU/t):**
| Generator | Base Output | Config Key |
|-----------|-------------|------------|
| Generator | 10 EU/t | `energyGeneratorBase` |
| Geothermal | 20 EU/t | `energyGeneratorGeo` |
| Semifluid | 100 EU/t | `energyGeneratorLiquid` |
| Nuclear (per rod) | 5 EU/t | `energyGeneratorNuclear` |
| Solar Panel | Depends | `energyGeneratorSolar*` |
| Wind Mill | Variable | `energyGeneratorWind` |

**Voltage Tiers:**
| Tier | Max EU/t | Cable Type |
|------|----------|------------|
| LV | 32 | Copper, Tin |
| MV | 128 | Gold |
| HV | 512 | Glass Fibre |
| EV | 2048 | HV Cable |
| IV | 8192 | - |

### IC2 Classic Ore Dictionary Entries

```zs
// Ingots
<ore:ingotCopper>
<ore:ingotTin>
<ore:ingotBronze>
<ore:ingotSilver>
<ore:ingotRefinedIron>    // Or ingotSteel if enabled

// Dusts
<ore:dustCopper>
<ore:dustTin>
<ore:dustBronze>
<ore:dustIron>
<ore:dustGold>

// Circuits (CRITICAL for cross-mod recipes)
<ore:circuitBasic>        // Electronic Circuit
<ore:circuitAdvanced>     // Advanced Circuit

// Plates
<ore:plateIron>
<ore:plateCopper>
<ore:plateTin>
```

### IC2 Classic Cable Item IDs

```zs
// Cable format: <ic2:itemcable:META>
<ic2:itemcable:0>   // Copper Cable
<ic2:itemcable:1>   // Insulated Copper
<ic2:itemcable:2>   // Gold Cable
<ic2:itemcable:3>   // Insulated Gold
<ic2:itemcable:4>   // Double Insulated Gold
<ic2:itemcable:5>   // Iron Cable
<ic2:itemcable:6>   // Insulated Iron
<ic2:itemcable:7>   // Double Insulated Iron
<ic2:itemcable:8>   // Triple Insulated Iron
<ic2:itemcable:9>   // Glass Fibre Cable  ← Most used for HV
<ic2:itemcable:10>  // Tin Cable
<ic2:itemcable:11>  // Detector Cable
<ic2:itemcable:12>  // Splitter Cable
<ic2:itemcable:13>  // Insulated Tin
```

---

## 3. BuildCraft Reference

### Item Bracket Format
```zs
<buildcraftcore:itemname>
<buildcraftfactory:itemname>
<buildcrafttransport:itemname>
<buildcraftsilicon:itemname>
<buildcraftbuilders:itemname>
```

### Core Items

| Item | Bracket |
|------|---------|
| Gears | `<buildcraftcore:gear_wood>`, `gear_stone`, `gear_iron`, `gear_gold`, `gear_diamond` |
| Wrench | `<buildcraftcore:wrench>` |
| Engines | `<buildcraftcore:engine>` (with meta) |

### Transport (Pipes)

Pipes follow pattern: `<buildcrafttransport:pipe_TYPE_MATERIAL>`

Materials: `wood`, `cobblestone`, `stone`, `sandstone`, `iron`, `gold`, `diamond`, `obsidian`, `quartz`, `clay`

Types:
- Item pipes (default)
- Fluid pipes (`_fluid` suffix)
- Power pipes (`_power` suffix)

### Factory Items

| Machine | Bracket |
|---------|---------|
| Quarry | `<buildcraftfactory:quarry>` |
| Mining Well | `<buildcraftfactory:mining_well>` |
| Pump | `<buildcraftfactory:pump>` |
| Tank | `<buildcraftfactory:tank>` |
| Refinery | `<buildcraftfactory:refinery>` |

### Power Values (MJ)

| Engine | Output | Fuel |
|--------|--------|------|
| Redstone Engine | 0.05 MJ/t | Redstone signal only |
| Stirling Engine | 1.0 MJ/t | Solid fuels (coal, etc.) |
| Combustion Engine | 3-6 MJ/t | Oil/Fuel + coolant |

**MJ Consumption (approximate):**
| Machine | MJ/operation |
|---------|--------------|
| Mining Well | ~4 MJ/block |
| Quarry | ~20-60 MJ/block |
| Pump | ~2 MJ/bucket |
| Refinery | ~1.5 MJ/bucket |

### BuildCraft Ore Dictionary

From BuildCraft Core:
```zs
<ore:craftingTableWood>   // Crafting Table
<ore:gearWood>            // Wood Gear
<ore:gearStone>           // Stone Gear
<ore:gearIron>            // Iron Gear
<ore:gearGold>            // Gold Gear
<ore:gearDiamond>         // Diamond Gear
```

From BuildCraft Silicon:
```zs
<ore:chipsetRed>          // Redstone Chipset
<ore:chipsetIron>         // Iron Chipset
<ore:chipsetGold>         // Golden Chipset
<ore:chipsetDiamond>      // Diamond Chipset
<ore:chipsetEmerald>      // Emerald Chipset
<ore:chipsetQuartz>       // Quartz Chipset
<ore:chipsetComp>         // Redstone Comp Chipset
<ore:chipsetPulsating>    // Pulsating Chipset
<ore:redstoneCrystal>     // Redstone Crystal
```

### BuildCraft Gear Recipes (Default)

```zs
// Wood Gear = 4 sticks around wood plank
// Stone Gear = 4 cobble + wood gear center
// Iron Gear = 4 iron + stone gear center
// Gold Gear = 4 gold + iron gear center
// Diamond Gear = 4 diamond + gold gear center
```

**Config:** `config/buildcraft/main.cfg`

Key settings:
- `general.miningMultiplier` - Power cost for mining machines
- `general.quarryMaxBlockMineRate` - Quarry speed limit
- `worldgen.oil.enable` - Oil generation
- `modules.ic2` - IC2 integration (enabled by default)

---

## 4. Draconic Evolution Reference

### Item Bracket Format
```zs
<draconicevolution:itemname>
<draconicevolution:itemname:meta>
```

### Key Items

| Item | Bracket |
|------|---------|
| **Materials** | |
| Draconium Ore | `<draconicevolution:draconium_ore>` |
| Draconium Ingot | `<draconicevolution:draconium_ingot>` |
| Draconium Block | `<draconicevolution:draconium_block>` |
| Awakened Draconium | `<draconicevolution:draconic_ingot>` |
| Dragon Heart | `<draconicevolution:dragon_heart>` |
| Chaos Shard | `<draconicevolution:chaos_shard>` |
| | |
| **Energy Storage** | |
| Energy Core | `<draconicevolution:energy_storage_core>` |
| Energy Pylon | `<draconicevolution:energy_pylon>` |
| Particle Generator | `<draconicevolution:particle_generator>` |
| | |
| **Fusion Crafting** | |
| Fusion Crafting Core | `<draconicevolution:fusion_crafting_core>` |
| Crafting Injector (Basic) | `<draconicevolution:crafting_injector:0>` |
| Crafting Injector (Wyvern) | `<draconicevolution:crafting_injector:1>` |
| Crafting Injector (Draconic) | `<draconicevolution:crafting_injector:2>` |
| | |
| **Tools/Armor** | |
| Wyvern Pickaxe | `<draconicevolution:wyvern_pick>` |
| Draconic Pickaxe | `<draconicevolution:draconic_pick>` |
| Wyvern Armor | `<draconicevolution:wyvern_helm>`, etc. |

### Energy Core Capacities

| Tier | Capacity | Scientific |
|------|----------|------------|
| Tier 1 | 45,500,000 RF | 4.55×10⁷ |
| Tier 2 | 273,000,000 RF | 2.73×10⁸ |
| Tier 3 | 1,640,000,000 RF | 1.64×10⁹ |
| Tier 4 | 9,880,000,000 RF | 9.88×10⁹ |
| Tier 5 | 59,300,000,000 RF | 5.93×10¹⁰ |
| Tier 6 | 356,000,000,000 RF | 3.56×10¹¹ |
| Tier 7 | 2,140,000,000,000 RF | 2.14×10¹² |
| Tier 8 | 9.22×10¹⁸ RF | MAX LONG |

*Note: Configurable via `coreCapacity` array in DraconicEvolution.cfg*

### Fusion Crafting Injector Tiers

| Tier | Item ID | Description |
|------|---------|-------------|
| Basic | `<draconicevolution:crafting_injector:0>` | Entry-level fusion |
| Wyvern | `<draconicevolution:crafting_injector:1>` | Mid-tier recipes |
| Draconic | `<draconicevolution:crafting_injector:2>` | Advanced recipes |
| Chaotic | `<draconicevolution:crafting_injector:3>` | End-game recipes |

### Config Location
`config/brandon3055/DraconicEvolution.cfg`

Key options:
- `B:grinder=false` - Disable mob grinder (EnergyCraft default)
- `I:chaosGuardianHealth=6000` - 3x default for harder boss
- `B:disableLargeReactorBoom=false` - Reactor explosions
- `B:enableFlight=true` - Draconic armor flight
- `B:expensiveDragonRitual=true` - More expensive dragon ritual
- `D:coreCapacity` - Energy core tier capacities
- `S:grinderBlackList` - Entities immune to grinder
- `I:chaosIslandSeparation=10000` - Distance between chaos islands

### Chaos Guardian

**Default Stats:**
- Health: 2000 (default), 6000 (EnergyCraft)
- Special Abilities: Crystal respawning, creative player killing
- Loot: Dragon Heart, Chaos Shards

**Config toggles:**
```properties
B:disableGuardianCrystalRespawn=false  # "Wuss mode"
B:guardianCanKillCreative=true
I:chaosGuardianHealth=6000
```

### Important DE Item IDs

```zs
// Cores
<draconicevolution:draconic_core>      // Basic core
<draconicevolution:wyvern_core>        // Mid-tier core
<draconicevolution:awakened_core>      // Advanced core
<draconicevolution:chaotic_core>       // End-game core

// Materials  
<draconicevolution:chaos_shard:0>      // Small Chaos Fragment
<draconicevolution:chaos_shard:1>      // Medium Chaos Fragment
<draconicevolution:chaos_shard:2>      // Large Chaos Fragment
<draconicevolution:chaos_shard:3>      // Chaos Shard
<draconicevolution:dragon_heart>       // Dragon Heart

// Machines
<draconicevolution:grinder>            // Mob Grinder (consider disabling)
<draconicevolution:generator>          // Generator
<draconicevolution:energy_infuser>     // Draconic Infuser
<draconicevolution:disenchanter>       // Disenchanter

// Dislocators
<draconicevolution:dislocator>         // Basic (consumable)
<draconicevolution:dislocator_advanced> // Advanced (rechargeable)
```

---

## 5. ProjectE EMC Reference

### Setting Custom EMC

**Method 1: In-Game Commands**
```
/projecte setEMC <modid:item> <value>
/projecte removeEMC <modid:item>
/projecte reloadEMC
```

**Method 2: custom_emc.json**
Location: `config/ProjectE/custom_emc.json`

```json
{
    "entries": [
        {
            "item": "minecraft:diamond",
            "emc": 8192
        },
        {
            "item": "modid:item",
            "meta": 0,
            "emc": 1000
        },
        {
            "item": "modid:exploit_item",
            "emc": "none"
        }
    ]
}
```

### Default EMC Values (Vanilla Reference)

| Item | EMC |
|------|-----|
| Cobblestone | 1 |
| Wood (logs) | 32 |
| Coal | 128 |
| Iron Ingot | 256 |
| Gold Ingot | 2048 |
| Diamond | 8192 |
| Emerald | 16384 |

### EMC Value Guidelines

| Tier | Range | Examples |
|------|-------|----------|
| Abundant | 1-64 | Dirt, cobble, gravel |
| Common | 64-256 | Ores, basic metals |
| Uncommon | 256-2048 | Processed materials |
| Rare | 2048-16384 | Diamonds, enderium |
| Epic | 16384-262144 | Advanced materials |
| Legendary | 262144+ | Unique items |
| No EMC | `"none"` | Exploit-prone |

### Config Options
`config/ProjectE/ProjectE.cfg`

Key settings:
- `B:craftableTome=false` - Tome of Knowledge crafting (OP if enabled)
- `B:enableTimeWatch=true` - Watch of Flowing Time
- `D:covalenceLoss=1.0` - EMC loss on burn (1.0 = no loss)
- `D:katarDeathAura=1000.0` - Katar damage
- `B:offensiveAbilities=true` - Gem Armor offensive powers
- `B:disableAllRadiusMining=false` - DM/RM tool mining modes
- `B:pickaxeAoeVeinMining=false` - AOE vs vein mining mode

### Pedestal Cooldowns
Control how often pedestal effects trigger:
```properties
I:archangelPedCooldown=40    # Arrow shooting
I:bodyPedCooldown=10         # Food healing
I:harvestPedCooldown=10      # Crop growth
I:repairPedCooldown=20       # Item repair
I:soulPedCooldown=10         # Health healing
I:timePedBonus=18            # Time Watch bonus ticks
```

Set any cooldown to `-1` to disable that function.

### Items to Consider for No EMC (Exploit Prevention)

```json
{
  "item": "mod:exploit_item",
  "emc": "none"
}
```

**Common exploit-prone items:**
- Items with randomized NBT (spawners, mob drops)
- Infinite durability tools (before breaking)
- Loot bags/crates with random contents
- Energy storage items (store energy, transmute back)
- Machines that can duplicate (some mods)

---

## 6. Project Red Reference

### Module Prefixes

| Module | Prefix | Description |
|--------|--------|-------------|
| Core | `projectred-core` | Base items, alloys, tools |
| Integration | `projectred-integration` | Logic gates |
| Transmission | `projectred-transmission` | Wires, cables |
| Fabrication | `projectred-fabrication` | IC printing |
| Illumination | `projectred-illumination` | Lights, lamps |
| Exploration | `projectred-exploration` | World gen, tools |
| Transportation | `projectred-transportation` | Routed pipes |
| Expansion | `projectred-expansion` | Machines, frames |

### Common Items

```zs
// Wires (Transmission)
<projectred-transmission:wire:0>    // Red Alloy Wire
<projectred-transmission:wire:16>   // Bundled Cable

// Alloys (Core)
<projectred-core:resource_item:100> // Red Alloy Ingot
<projectred-core:resource_item:101> // Electrotine Alloy Ingot
<projectred-core:resource_item:103> // Electrotine

// Gates (Integration) - format: <projectred-integration:gate:X>
// X values for gate types (verify with JEI)
```

### Transportation Module - Pipe Types

| Pipe | Function |
|------|----------|
| Item Transport Pipe | Basic item movement (null-logic) |
| Routed Junction Pipe | Intersection connections |
| Routed Interface Pipe | Connects to inventories |
| Routed Crafting Pipe | Auto-crafting integration |
| Routed Request Pipe | Item requesting |
| Routed Extension Pipe | Crafting pipe expansion |
| Routed Firewall Pipe | Block items, influence routing |
| Network Valve Pipe | Flow control |
| Network Latency Pipe | Routing adjustment |

### Transportation Chips

| Chip | Function |
|------|----------|
| Item Responder | Accepts specific items |
| Dynamic Item Responder | Dynamic item acceptance |
| Item Overflow Responder | Overflow handling |
| Item Terminator | Destroys items |
| Item Extractor | Pulls items from inventory |
| Item Broadcaster | Shares inventory contents |
| Item Stock Keeper | Maintains stock levels |
| Item Crafting | Recipe programming |
| Item Crafting Extension | Multi-recipe support |

### Config
`config/ProjectRed.cfg`

Key settings:
```properties
B:"Logic Sounds"=true                    # Gate sounds
I:"Minimum Timer Ticks"=4                # Timer minimum
I:"Routed Pipes: Detection Frequency"=40 # Router tick rate
I:"Routed Pipes: Max Detection Count"=100 # Max pipe search
B:"Unbreakable Screwdriver"=false        # Screwdriver durability
```

### World Gen
```properties
B:"Copper Ore"=true
B:"Electrotine Ore"=true
B:"Marble"=true
B:"Ruby Ore"=true
B:"Sapphire Ore"=true
B:"Peridot Ore"=true
B:"Volcano"=true
```

---

## 7. Forestry Reference

### Bees Quick Reference

**Natural Hive Spawns:**
| Bee Type | Biome | Hive Type |
|----------|-------|-----------|
| Forest | Forest, Wooded | Forest Hive |
| Meadows | Plains, Sunflower | Meadows Hive |
| Modest | Desert, Badlands | Desert Hive |
| Tropical | Jungle | Jungle Hive |
| Wintry | Snowy | Snow Hive |
| Marshy | Swamp | Swamp Hive |
| Ender | The End | Ender Hive |

### Beekeeping Modes (config/forestry/apiculture.cfg)
```properties
S:mode=NORMAL   # Options: EASY, NORMAL, HARD, HARDCORE, INSANE
I:ticks.work=550  # Ticks per work cycle (250-850)
```

### Key Items

```zs
// Housing
<forestry:apiary>                   // Standard bee housing
<forestry:bee_house>                // Basic housing (no frames)
<forestry:alveary.plain>            // Alveary component

// Machines
<forestry:carpenter>                // Wood processing
<forestry:centrifuge>               // Comb processing
<forestry:squeezer>                 // Liquid extraction
<forestry:thermionic_fabricator>    // Circuit fabrication
<forestry:bottler>                  // Liquid bottling
<forestry:still>                    // Biomass → Ethanol
<forestry:fermenter>                // Biomass creation

// Bees (use JEI for specific species - NBT is complex)
<forestry:bee_drone_ge>             // Generic drone
<forestry:bee_princess_ge>          // Generic princess
<forestry:bee_queen_ge>             // Generic queen
```

### Config Files
- `config/forestry/apiculture.cfg` - Bee settings
- `config/forestry/arboriculture.cfg` - Tree settings
- `config/forestry/common.cfg` - General settings
- `config/forestry/backpacks.cfg` - Backpack settings

### Bee Products → EMC Considerations
Some bee products can be exploit-prone for EMC:
- Royal Jelly (easy to produce in bulk)
- Honey/Honeydew (automated)
- Propolis variants
- Wax products

Consider setting these to appropriate EMC or `"none"`.

---

## 8. Energy Conversion Ratios

### Energy Converters Mod Configuration
Location: `config/energyconverters.cfg`

**Current EnergyCraft Settings:**
```properties
D:euConversionFactor=4.0    # 1 EU = 4 internal units
D:feConversionFactor=1.0    # 1 FE = 1 internal unit  
D:mjConversionFactor=15.0   # 1 MJ = 15 internal units
D:rfConversionFactor=1.0    # 1 RF = 1 internal unit
D:conversionLoss=0.0        # No loss on conversion
```

### Calculated Conversion Ratios

| From | To | Ratio | Calculation |
|------|-----|-------|-------------|
| 1 EU | RF/FE | 4 RF | 4/1 = 4 |
| 1 EU | MJ | 0.267 MJ | 4/15 ≈ 0.267 |
| 1 MJ | RF/FE | 15 RF | 15/1 = 15 |
| 1 MJ | EU | 3.75 EU | 15/4 = 3.75 |
| 1 RF | EU | 0.25 EU | 1/4 = 0.25 |
| 1 RF | MJ | 0.067 MJ | 1/15 ≈ 0.067 |

### IC2 Classic Internal Setting
From `config/ic2/ic2.cfg`:
```properties
I:RFPerEU=8   # IC2's native conversion (if used)
```
*Note: This is IC2's internal setting, which may differ from Energy Converters.*

### Practical Power Equivalents

| IC2 Tier | EU/t | ≈ RF/t | ≈ MJ/t |
|----------|------|--------|--------|
| LV | 32 | 128 | 8.5 |
| MV | 128 | 512 | 34 |
| HV | 512 | 2,048 | 137 |
| EV | 2,048 | 8,192 | 546 |

**BuildCraft Engine Power:**
| Engine | MJ/t | ≈ RF/t | ≈ EU/t |
|--------|------|--------|--------|
| Stirling | 1.0 | 15 | 3.75 |
| Combustion (Oil) | 3.0 | 45 | 11.25 |
| Combustion (Fuel) | 6.0 | 90 | 22.5 |

---

## 9. Logistics Pipes Reference

*Lower Priority - Basic reference for future expansion*

### Pipe Types
| Pipe | Function |
|------|----------|
| Basic Logistics Pipe | Item routing foundation |
| Request Logistics Pipe | Request items from network |
| Provider Logistics Pipe | Provide items to network |
| Crafting Logistics Pipe | Auto-crafting |
| Supplier Logistics Pipe | Keep inventory stocked |
| Chassis Pipe | Modular pipe with slots |

### Modules
- Extractor Module
- ItemSink Module  
- Passive Supplier Module
- Provider Module
- Crafting Module
- QuickSort Module

### Integration
- Works with BuildCraft pipes
- Can connect to IC2 machines
- NEI/JEI integration for recipes

---

## 10. File Locations Quick Reference

| Purpose | Path |
|---------|------|
| **Scripts** | |
| CraftTweaker scripts | `scripts/*.zs` |
| CraftTweaker log | `crafttweaker.log` |
| | |
| **Core Mod Configs** | |
| IC2 Classic | `config/ic2/ic2.cfg` |
| IC2 Recipes | `config/ic2/*.json` |
| BuildCraft Main | `config/buildcraft/main.cfg` |
| BuildCraft Objects | `config/buildcraft/objects.cfg` |
| Draconic Evolution | `config/brandon3055/DraconicEvolution.cfg` |
| Brandon's Core | `config/brandon3055/BrandonsCore.cfg` |
| | |
| **ProjectE** | |
| Main Config | `config/ProjectE/ProjectE.cfg` |
| Custom EMC | `config/ProjectE/custom_emc.json` |
| EMC Mapping | `config/ProjectE/mapping.cfg` |
| Custom Conversions | `config/ProjectE/customConversions/` |
| | |
| **Project Red** | |
| Main Config | `config/ProjectRed.cfg` |
| | |
| **Forestry** | |
| Apiculture | `config/forestry/apiculture.cfg` |
| Common | `config/forestry/common.cfg` |
| | |
| **Energy Converters** | |
| Main Config | `config/energyconverters.cfg` |
| Custom Recipes | `config/energyconverters_recipes/` |
| | |
| **Other Useful** | |
| Forge Config | `config/forge.cfg` |
| JEI Config | `config/jei/` |

---

## 11. Useful Commands Reference

### CraftTweaker Commands
| Command | Purpose |
|---------|---------|
| `/ct hand` | Print held item's bracket notation |
| `/ct hand recipes` | Show recipes for held item |
| `/ct inventory` | Dump inventory to log |
| `/ct recipes` | List all recipes |
| `/ct oredict` | List ore dictionary entries |
| `/ct syntax` | Syntax help |
| `/ct reload` | Reload scripts (some limitations) |
| `/ct log` | Open the log file |

### ProjectE Commands
| Command | Purpose |
|---------|---------|
| `/projecte EMC` | Show EMC of held item |
| `/projecte setEMC <item> <value>` | Set custom EMC |
| `/projecte removeEMC <item>` | Remove EMC value |
| `/projecte reloadEMC` | Reload EMC mappings |

### Debug Commands
| Command | Purpose |
|---------|---------|
| `/give @p <modid:item:meta>` | Give item with meta |
| `/forge tracking te` | Tile entity tracking |
| `/forge tps` | Server TPS info |

---

## 12. CraftTweaker Common Patterns

### Recipe Gating Pattern
```zs
// Gate advanced mod item behind tech requirements
recipes.remove(<advancedmod:machine>);
recipes.addShaped("gated_machine", <advancedmod:machine>, [
    [<ore:circuitAdvanced>, <ore:gearGold>, <ore:circuitAdvanced>],
    [<ore:gearIron>, <basemod:core>, <ore:gearIron>],
    [<ore:circuitAdvanced>, <ore:gearGold>, <ore:circuitAdvanced>]
]);
```

### Ore Dictionary Unification
```zs
// Force all copper ingots to smelt to IC2 copper
furnace.remove(<*>, <ore:oreCopper>);
furnace.addRecipe(<ic2:ingot:0>, <ore:oreCopper>);
```

### Conditional Recipe Based on Mod
```zs
import mods.jei.JEI;

// Only if mod is loaded
if (loadedMods has "buildcraftcore") {
    recipes.addShaped("cross_mod_item", <output>, [
        [<buildcraftcore:gear_diamond>, <ic2:itemcable:9>, <buildcraftcore:gear_diamond>]
    ]);
}
```

### NBT-Sensitive Recipe
```zs
// Recipe that requires specific NBT
recipes.addShapeless("charged_item_recipe", <output>, [
    <mod:item>.withTag({charge: 10000})
]);
```

---

*This reference is a living document. Use `/ct hand` in-game to verify exact item IDs for your mod versions.*

**Sources:**
- In-game config files
- CraftTweaker Documentation (docs.blamejared.com/1.12)
- BuildCraft GitHub Wiki
- Project Red Wiki (projectredwiki.com)
- Mod source code and default configs
