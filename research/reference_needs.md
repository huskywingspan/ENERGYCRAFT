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

### Phase 1: Item IDs & Recipes
- [ ] IC2 Classic item ID dump
- [ ] BuildCraft item ID dump  
- [ ] Draconic Evolution item ID dump
- [ ] Project Red item ID dump
- [ ] Forestry item ID dump

### Phase 2: Config Documentation
- [ ] IC2 Classic config options explained
- [ ] Draconic Evolution config options
- [ ] ProjectE config options
- [ ] BuildCraft config options

### Phase 3: Mechanic Documentation
- [ ] EU power system guide
- [ ] MJ power system guide
- [ ] EMC system guide
- [ ] Fusion Crafting guide
- [ ] Bee breeding guide

### Phase 4: CraftTweaker Patterns
- [ ] IC2 Classic CraftTweaker examples
- [ ] BuildCraft CraftTweaker examples
- [ ] Mod-specific bracket handlers

---

## Proposed Reference Structure

```
references/
├── item_ids/
│   ├── ic2_classic_items.md
│   ├── buildcraft_items.md
│   ├── draconic_evolution_items.md
│   └── project_red_items.md
├── configs/
│   ├── ic2_config_guide.md
│   ├── draconic_config_guide.md
│   └── projecte_config_guide.md
├── mechanics/
│   ├── eu_power_system.md
│   ├── mj_power_system.md
│   └── emc_system.md
└── crafttweaker/
    ├── syntax_reference.md
    ├── ic2_examples.zs
    └── common_patterns.md
```

---

## Web Research Priorities

### High Priority (Need Now)
1. **IC2 Classic item IDs** - Critical for recipe scripts
2. **CraftTweaker 1.12.2 syntax** - All scripting
3. **Draconic Evolution item IDs** - Current integration
4. **IC2 Classic config guide** - Balance settings

### Medium Priority (Need Soon)
5. BuildCraft item IDs
6. Project Red item IDs
7. ProjectE EMC defaults & config
8. Forestry bees reference

### Lower Priority (Nice to Have)
9. Railcraft reference
10. Logistics Pipes reference
11. Community modpack examples
