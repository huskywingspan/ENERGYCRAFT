# EnergyCraft Playtesting Checklist

> **Purpose:** Track testing progress and collect feedback during gameplay sessions  
> **Instructions:** Check off items as you test them, add notes in the feedback sections  
> **Last Updated:** February 2, 2026

---

## How to Use This Document

1. Play the game naturally, but reference this checklist
2. Mark items with:
   - `[x]` = Tested and working as expected
   - `[!]` = Tested but needs adjustment (add notes)
   - `[-]` = Tested and broken (add notes)
   - `[ ]` = Not yet tested
3. Add feedback in the `> Notes:` sections
4. Commit changes after each play session

---

## Session Log

| Date | Duration | Focus Area | Issues Found |
|------|----------|------------|--------------|
| | | | |

---

## 1. Core Mod Loading

### Game Launch
- [ ] Game launches without crashes
- [ ] No errors in main menu
- [ ] World loads successfully
- [ ] No red errors in chat on world load

> Notes:

### Mod Presence Verification
- [ ] IC2 Classic machines appear in JEI
- [ ] BuildCraft pipes/engines appear in JEI
- [ ] Project Red wiring appears in JEI
- [ ] ProjectE transmutation table works
- [ ] Draconic Evolution items appear in JEI
- [ ] Forestry bees/machines appear in JEI

> Notes:

---

## 2. Draconic Evolution Integration

### Recipe Gating (Check in JEI)
- [ ] **Energy Storage Core** requires Advanced Circuits + Diamond Block
- [ ] **Fusion Crafting Injector** requires BuildCraft Gold Gear
- [ ] **Fusion Crafting Core** requires BuildCraft Diamond Gear + Glass Fibre
- [ ] **Draconic Core** requires Electronic Circuit (ore:circuitBasic)
- [ ] **Wyvern Core** requires Advanced Circuit + Nether Star
- [ ] **Energy Pylon** requires BuildCraft Diamond Gear
- [ ] **Particle Generator** requires BuildCraft Iron Gear
- [ ] **Dislocator** requires Electronic Circuit + Ender Pearls
- [ ] **Reactor Core** requires Glass Fibre Cable + Awakened materials
- [ ] **Reactor Stabilizer** requires Glass Fibre Cable

> Notes:

### Config Verification
- [ ] Mob Grinder block does NOT appear in JEI (disabled)
- [ ] Mob Grinder cannot be crafted
- [ ] Chaos Guardian has increased health (test in creative if possible)

> Notes:

### EMC Values (Check in ProjectE)
- [ ] Draconium Ingot shows 8,192 EMC
- [ ] Dragon Heart shows 1,000,000 EMC
- [ ] Chaos Shard shows NO EMC (cannot be transmuted)
- [ ] Awakened Draconium shows NO EMC

> Notes:

---

## 3. IC2 Classic Balance

### UU-Matter Production
- [ ] Mass Fabricator has scrap amplifier slot
- [ ] Mass Fabricator does NOT produce UU-Matter without scrap
- [ ] With scrap: production rate feels balanced (not too fast/slow)
- [ ] Recycler → Scrap → Mass Fab pipeline works smoothly

> Notes (rate observations):

### Uranium Processing
- [ ] Uranium Ore can be mined
- [ ] Uranium processing chain works (macerator → thermal centrifuge)
- [ ] Enriched uranium crafting requires expected materials
- [ ] Nuclear reactor can be built and operated
- [ ] Progression to nuclear feels appropriately late-game

> Notes:

### General IC2
- [ ] Macerator ore doubling works
- [ ] Electric Furnace works
- [ ] Compressor works
- [ ] Extractor (rubber) works
- [ ] Canning Machine works
- [ ] All transformer tiers work (LV/MV/HV/EV)
- [ ] Cable EU limits respected (machines explode on overvoltage)
- [ ] BatBox/MFE/MFSU store energy correctly

> Notes:

---

## 4. Energy Converters

### Recipe Verification
- [ ] Energy Bridge craftable
- [ ] All EU Consumer tiers craftable (LV/MV/HV/EV/IV)
- [ ] All EU Producer tiers craftable
- [ ] RF/FE Consumers/Producers craftable
- [ ] MJ Consumers/Producers craftable

### Functionality
- [ ] EU → RF conversion works
- [ ] RF → EU conversion works
- [ ] EU → MJ conversion works
- [ ] MJ → EU conversion works
- [ ] Conversion ratios feel balanced

> Notes (conversion observations):

---

## 5. Cross-Mod Integration

### BuildCraft + IC2
- [ ] BuildCraft engines can power BC machines
- [ ] Quarry works with BC power
- [ ] IC2 power and BC power feel distinct (not redundant)

### Forestry
- [ ] Bees can be found/bred
- [ ] Forestry machines work
- [ ] Forestry + IC2 power integration (if any)

### Project Red
- [ ] Redstone wiring works
- [ ] Logic gates function correctly
- [ ] Bundled cables work

### Railcraft
- [ ] Rails craftable and functional
- [ ] Steam power works
- [ ] Coke oven works

> Notes:

---

## 6. ProjectE Balance

### Transmutation
- [ ] Transmutation table functions
- [ ] EMC values for vanilla items seem reasonable
- [ ] EMC values for modded items seem reasonable
- [ ] No obvious EMC exploits found

### Progression Feel
- [ ] Early game: EMC feels scarce (good)
- [ ] Mid game: EMC accumulates at reasonable rate
- [ ] Late game: EMC supports end-game goals without trivializing

> Notes (balance observations):

---

## 7. Quality of Life

### JEI
- [ ] All recipes searchable
- [ ] Recipe lookup (R) works
- [ ] Usage lookup (U) works
- [ ] Bookmarks work

### Inventory/Storage
- [ ] Inventory Tweaks sorting works
- [ ] Iron Chests upgrades work
- [ ] Storage Drawers work
- [ ] Ender Storage cross-dimensional works

### Navigation
- [ ] Minimap displays correctly
- [ ] World map works
- [ ] Waypoints can be set

### Other QoL
- [ ] Hwyla tooltips show block info
- [ ] AppleSkin food values display
- [ ] Fast Leaf Decay works

> Notes:

---

## 8. World Generation

### Ores
- [ ] IC2 ores generate (copper, tin, uranium)
- [ ] Project Red gems generate
- [ ] Forestry resources generate
- [ ] Draconium generates in The End
- [ ] Nether ores generate (if Basic Nether Ores enabled)

### Structures
- [ ] Rubber trees generate
- [ ] Villages spawn (with trades if enabled)
- [ ] End portal works
- [ ] Chaos Islands generate in The End (DE)

> Notes:

---

## 9. Performance

### Client Performance
- [ ] Stable FPS in overworld (note average):
- [ ] Stable FPS in Nether:
- [ ] Stable FPS in The End:
- [ ] No significant lag spikes during normal play
- [ ] Chunk loading feels smooth

### Memory
- [ ] No out-of-memory crashes
- [ ] Memory usage stable over time (no major leaks)

> Notes:

---

## 10. Progression Flow

### Early Game (Era I-II: Stone/Bronze Age)
- [ ] Starting resources obtainable
- [ ] First tools craftable
- [ ] Path to bronze clear
- [ ] First IC2 machines achievable

> Notes:

### Mid Game (Era III-IV: Machine/Electric Age)
- [ ] Ore processing established
- [ ] Power generation sufficient
- [ ] Automation possible
- [ ] Clear goals to work toward

> Notes:

### Late Game (Era V+: Nuclear/Fusion/Draconic)
- [ ] Nuclear power achievable with effort
- [ ] Draconic Evolution accessible but challenging
- [ ] End-game goals feel rewarding
- [ ] Power sinks exist (reasons to build more power)

> Notes:

---

## Issues Found

### Critical (Game-Breaking)
| Issue | Steps to Reproduce | Status |
|-------|-------------------|--------|
| | | |

### Major (Significantly Impacts Play)
| Issue | Steps to Reproduce | Status |
|-------|-------------------|--------|
| | | |

### Minor (Annoying but Playable)
| Issue | Steps to Reproduce | Status |
|-------|-------------------|--------|
| | | |

### Suggestions (Not Bugs)
| Suggestion | Rationale |
|------------|-----------|
| | |

---

## Balance Feedback

### Too Easy
| Item/Mechanic | Why It Feels Too Easy | Suggested Fix |
|---------------|----------------------|---------------|
| | | |

### Too Hard
| Item/Mechanic | Why It Feels Too Hard | Suggested Fix |
|---------------|----------------------|---------------|
| | | |

### Just Right ✓
| Item/Mechanic | Notes |
|---------------|-------|
| | |

---

## Next Session Priorities

1. 
2. 
3. 

---

*Remember to commit this file after each play session!*
