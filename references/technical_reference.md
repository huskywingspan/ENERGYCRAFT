# EnergyCraft Technical Reference Compilation

This document compiles technical references, syntax guides, and documentation links for modpack development.

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
- `balance` - EU costs, output rates
- `protection` - explosion settings
- `misc` - general gameplay

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

| Engine | Output |
|--------|--------|
| Redstone Engine | 0.05 MJ/t (minimal) |
| Stirling Engine | 1 MJ/t |
| Combustion Engine | 3-6 MJ/t |

**Config:** `config/buildcraft/main.cfg`

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

| Tier | Capacity |
|------|----------|
| Tier 1 | 45.5M RF |
| Tier 2 | 273M RF |
| Tier 3 | 1.64B RF |
| Tier 4 | 9.88B RF |
| Tier 5 | 59.3B RF |
| Tier 6 | 356B RF |
| Tier 7 | 2.14T RF |
| Tier 8 | 9.22E RF (max long) |

### Config Location
`config/brandon3055/draconicevolution.cfg`

Key options:
- `mobGrinderEnabled` - Disable for balance
- `chaosGuardianHealth` - Increase difficulty
- `fusionRecipes` - Recipe modifications

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
- `craftableTome` - Enable Tome of Knowledge crafting
- `enableWatchFunctions` - Watch of Flowing Time
- `pedestalCooldown` - Pedestal effects

---

## 6. Project Red Reference

### Module Prefixes

| Module | Prefix |
|--------|--------|
| Base | `projectred-core` |
| Integration | `projectred-integration` |
| Transmission | `projectred-transmission` |
| Fabrication | `projectred-fabrication` |
| Illumination | `projectred-illumination` |
| Exploration | `projectred-exploration` |
| Transportation | `projectred-transportation` |

### Common Items

```zs
// Wires
<projectred-transmission:wire:0>    // Red Alloy Wire

// Gates
<projectred-integration:gate:X>     // Where X = gate type

// Alloys
<projectred-core:resource_item:100> // Red Alloy Ingot
<projectred-core:resource_item:101> // Electrotine Alloy Ingot
```

### Config
`config/ProjectRed.cfg`

---

## 7. Forestry Reference

### Bees Quick Reference

| Bee Type | Source |
|----------|--------|
| Forest | Oak trees |
| Meadows | Plains |
| Modest | Desert |
| Tropical | Jungle |
| Wintry | Snow |
| Marshy | Swamp |

### Key Items

```zs
// Machines
<forestry:apiary>
<forestry:bee_house>
<forestry:carpenter>
<forestry:thermionic_fabricator>

// Bees (complex NBT - use JEI)
<forestry:bee_drone_ge>
<forestry:bee_princess_ge>
<forestry:bee_queen_ge>
```

### Config
`config/forestry/*.cfg`

---

## 8. Energy Conversion Ratios

### Standard Ratios (from Energy Converters)

| From | To | Ratio |
|------|-----|-------|
| 1 EU | RF | 2.5 RF |
| 1 MJ | RF | 10 RF |
| 1 EU | MJ | 0.25 MJ |
| 4 EU | MJ | 1 MJ |
| 1 RF | EU | 0.4 EU |

### In Practice

| EU/t | RF/t | MJ/t |
|------|------|------|
| 32 (LV) | 80 | 8 |
| 128 (MV) | 320 | 32 |
| 512 (HV) | 1280 | 128 |
| 2048 (EV) | 5120 | 512 |

---

## 9. Useful Links

### Documentation
- **CraftTweaker:** https://docs.blamejared.com/1.12/en/
- **ProjectE Wiki:** https://github.com/sinkillerj/ProjectE/wiki
- **FTB Wiki (general):** https://ftbwiki.org/

### In-Game Tools
- **JEI** - Recipe viewer, item lookup
- **WAILA/HWYLA** - Block information
- **NEI** - Recipe/item database

### Commands Reference
| Purpose | Command |
|---------|---------|
| Get item ID | `/ct hand` |
| Reload scripts | `/ct reload` |
| Check EMC | `/projecte EMC` |
| Set EMC | `/projecte setEMC <item> <value>` |

---

## 10. File Locations Quick Reference

| Purpose | Path |
|---------|------|
| CraftTweaker scripts | `scripts/*.zs` |
| CraftTweaker log | `crafttweaker.log` |
| IC2 Config | `config/ic2/ic2.cfg` |
| BuildCraft Config | `config/buildcraft/main.cfg` |
| DE Config | `config/brandon3055/draconicevolution.cfg` |
| ProjectE Config | `config/ProjectE/ProjectE.cfg` |
| ProjectE Custom EMC | `config/ProjectE/custom_emc.json` |
| Forestry Config | `config/forestry/*.cfg` |

---

*This reference is a living document. Use `/ct hand` in-game to verify exact item IDs for your mod versions.*
