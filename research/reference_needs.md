# EnergyCraft Technical Reference Needs

## Overview

This document identifies the technical documentation, wiki references, and data sources needed for EnergyCraft modpack development. These references are critical for:
- CraftTweaker recipe scripting (item IDs, NBT data)
- Config modifications (understanding options)
- Balance decisions (default values, progression)
- Quest book content (explaining mechanics)

---

## Priority 1: Core Tech Mods (Most Scripting)

### 1. IC2 Classic
**Why Critical:** Primary tech mod, extensive recipe changes needed

| Reference Type | Needed For |
|----------------|------------|
| Item ID list | CraftTweaker scripts |
| Machine recipes (default) | Understanding what to modify |
| Config options | Difficulty balancing |
| Energy values | EU costs, generation rates |
| Ore dictionary entries | Cross-mod compatibility |

**Known Sources:**
- IC2 Classic Wiki (if exists)
- IC2 Forums
- In-game JEI + `/ct hand`

---

### 2. BuildCraft
**Why Critical:** Secondary tech mod, MJ system, automation

| Reference Type | Needed For |
|----------------|------------|
| Item IDs | Recipe gating |
| Engine power outputs | Balance calculations |
| Config options | Feature toggling |
| Pipe mechanics | Quest explanations |

**Known Sources:**
- BuildCraft Wiki (mod-buildcraft.com)
- GitHub documentation

---

### 3. Draconic Evolution
**Why Critical:** End-game content, extensive gating needed

| Reference Type | Needed For |
|----------------|------------|
| Item IDs (all tiers) | CraftTweaker recipes |
| Fusion Crafting recipes | Understanding dependencies |
| Energy Core capacities | Progression balance |
| Config options | Disabling OP features |
| Ritual of Draconic Resurrection | Quest content |

**Known Sources:**
- DE Wiki (draconic-evolution.fandom.com)
- Brandon's Core documentation

---

### 4. ProjectE
**Why Critical:** EMC balance is crucial

| Reference Type | Needed For |
|----------------|------------|
| Default EMC values | Balance baseline |
| EMC JSON format | custom_emc.json syntax |
| Transmutation mechanics | Quest content |
| Config options | Exploit prevention |

**Known Sources:**
- ProjectE Wiki
- GitHub documentation
- Example custom_emc.json files

---

### 5. Project Red
**Why Critical:** Redstone replacement, wiring

| Reference Type | Needed For |
|----------------|------------|
| Item IDs (all modules) | Recipe references |
| Wire types & properties | Quest explanations |
| Gate logic | Tutorial quests |
| Config options | Feature availability |

**Known Sources:**
- Project Red Wiki
- Minecraft Forum threads

---

## Priority 2: Supporting Mods

### 6. Forestry
| Reference Type | Needed For |
|----------------|------------|
| Bee species list | Quest content |
| Machine item IDs | Recipe integration |
| Farm multiblock specs | Tutorial quests |

### 7. Railcraft  
| Reference Type | Needed For |
|----------------|------------|
| Machine item IDs | Recipe gating |
| Steam boiler mechanics | Energy integration |
| Track types | Quest content |

### 8. CC:Tweaked (ComputerCraft)
| Reference Type | Needed For |
|----------------|------------|
| Peripheral API | Quest examples |
| Turtle commands | Tutorial programs |
| Config options | Network settings |

### 9. Logistics Pipes
| Reference Type | Needed For |
|----------------|------------|
| Pipe types | Recipe references |
| Crafting logistics | Integration with BC |

### 10. Energy Converters
| Reference Type | Needed For |
|----------------|------------|
| Conversion ratios | Balance verification |
| Item IDs | Recipe confirmation |

---

## Priority 3: CraftTweaker Syntax

### CraftTweaker 2 for 1.12.2
| Reference Type | Needed For |
|----------------|------------|
| Recipe syntax | All scripting |
| Ore dictionary methods | Cross-mod recipes |
| JEI integration | Hiding/showing items |
| Mod-specific brackets | IC2, BC, etc. |
| NBT handling | Meta/damage values |

**Known Sources:**
- CraftTweaker Docs (docs.blamejared.com)
- ModTweaker documentation

---

## Priority 4: Config Reference

### General Config Patterns
| Mod | Config File | Key Settings |
|-----|-------------|--------------|
| IC2 Classic | `ic2/ic2.cfg` | Difficulty, recipes, worldgen |
| BuildCraft | `buildcraft/main.cfg` | Power, quarry, worldgen |
| Draconic Evolution | `brandon3055/draconicevolution.cfg` | Features, difficulty |
| ProjectE | `ProjectE/ProjectE.cfg` | Transmutation limits |
| Forestry | `forestry/*.cfg` | Bees, farms, difficulty |
| Railcraft | `railcraft/*.cfg` | Modules, worldgen |

---

## Data Collection Methods

### Method 1: In-Game Commands
```
/ct hand              - Get item ID of held item
/ct inventory         - Dump inventory to log
/ct recipes           - List all recipes
/ct oredict           - List ore dictionary entries
/ct syntax            - CraftTweaker syntax help
```

### Method 2: JEI Usage
- Search for item → see recipe
- Right-click → see uses
- Export mode for recipe viewing

### Method 3: Config File Reading
- Direct inspection of cfg files
- Comments explain options

### Method 4: Wiki/Documentation
- Online wikis for detailed mechanics
- GitHub repos for up-to-date info

---

## Reference Compilation Checklist

**Last Updated:** 2026-02-02

### Phase 1: Item IDs & Recipes
- [x] IC2 Classic item ID patterns (cables, circuits, ore dict)
- [x] BuildCraft item ID dump (gears, pipes, machines, ore dict)
- [x] Draconic Evolution item ID dump (cores, machines, materials)
- [x] Project Red item ID dump (modules, pipes, chips)
- [x] Forestry item ID patterns (machines, bees)

### Phase 2: Config Documentation
- [x] IC2 Classic config options (energy, crafting, features)
- [x] Draconic Evolution config options (tweaks, world, stats)
- [x] ProjectE config options (difficulty, pedestals, cooldowns)
- [x] BuildCraft config options (general, worldgen, modules)
- [x] Energy Converters config (conversion ratios)

### Phase 3: Mechanic Documentation
- [x] EU power system guide (tiers, generators)
- [x] MJ power system guide (engines, consumption)
- [x] EMC system guide (values, custom_emc.json format)
- [x] Energy Core capacities (all tiers documented)
- [ ] Fusion Crafting detailed guide (partial - need injector tiers)
- [ ] Bee breeding detailed guide (basic info only)

### Phase 4: CraftTweaker Patterns
- [x] CraftTweaker 1.12.2 syntax (comprehensive)
- [x] Recipe operations (add, remove, modify)
- [x] Ore dictionary usage
- [x] Common gating patterns documented

### Phase 5: Additional Research Needed
- [ ] Full gate type list for Project Red Integration
- [ ] Complete pipe meta values for BuildCraft
- [ ] IC2 Classic machine block meta values
- [ ] Forestry bee species complete list
- [ ] Logistics Pipes detailed documentation

---

## Completed Reference Document

**Location:** `references/technical_reference.md`

This comprehensive document now contains:
1. CraftTweaker 1.12.2 complete syntax reference
2. IC2 Classic item IDs, energy values, ore dictionary
3. BuildCraft items, power values, ore dictionary
4. Draconic Evolution items, config, energy cores
5. ProjectE EMC format, config, balance tips
6. Project Red modules, pipes, chips
7. Forestry basic reference
8. Energy conversion ratios (with calculations)
9. Logistics Pipes overview
10. File locations and commands

---

## Web Research Priorities

### Completed ✓
1. ~~IC2 Classic item IDs~~ - Documented from configs
2. ~~CraftTweaker 1.12.2 syntax~~ - From docs.blamejared.com
3. ~~Draconic Evolution item IDs~~ - Verified in scripts
4. ~~IC2 Classic config guide~~ - From config files
5. ~~BuildCraft ore dictionary~~ - From GitHub wiki
6. ~~Project Red pipe types~~ - From projectredwiki.com
7. ~~Energy conversion ratios~~ - Calculated from configs

### Still Needed (Lower Priority)
8. IC2 Classic machine block meta values (need in-game `/ct hand`)
9. Complete Forestry bee breeding chart
10. Railcraft detailed reference
11. Community modpack comparison examples
