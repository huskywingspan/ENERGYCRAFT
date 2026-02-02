# 🔧 Curator → Integrator Handoff: Phase 3 ProjectE Integration

**Date:** February 2, 2026  
**Phase:** 3 - ProjectE Integration  
**Curator Status:** Research Complete  
**Integrator Action Required:** Implementation

---

## Executive Summary

ProjectE is already partially configured with EMC values for Energy Converters, Draconic Evolution, and Environmental Tech. This phase focuses on:
1. **Tech-gating transmutation items** (Dark Matter, Red Matter)
2. **Closing common EMC exploits**
3. **Balancing EMC generation** to prevent trivial progression bypass

---

## 1. Current ProjectE Configuration State

### Files Already Configured
| File | Status | Contents |
|------|--------|----------|
| `config/ProjectE/ProjectE.cfg` | ✅ Good defaults | Tome=uncraftable, covalenceLoss=1.0 |
| `config/ProjectE/custom_emc.json` | ✅ Partial | Energy Converters, DE, ET values set |
| `config/ProjectE/mapping.cfg` | ✅ Good | logEMCExploits=true |

### Key Settings in ProjectE.cfg
```
craftableTome=false          ✅ Tome of Knowledge uncraftable (good)
covalenceLoss=1.0            ⚠️ Full EMC return on burn (consider 0.9?)
enableTimeWatch=true         ⚠️ Watch of Flowing Time enabled (powerful)
```

### Current custom_emc.json Coverage
- ✅ Energy Converters (all tiers)
- ✅ Draconic Evolution (draconium, cores, chaos shards=0)
- ✅ Environmental Tech (crystals, controllers=0)
- ❌ **NOT YET:** IC2 Classic items
- ❌ **NOT YET:** BuildCraft items
- ❌ **NOT YET:** Project Red items
- ❌ **NOT YET:** Forestry items
- ❌ **NOT YET:** ProjectE tech gates (Dark Matter, Red Matter)

---

## 2. Common EMC Exploits to Close

### High Priority Exploits

#### A. Mob Farm → EMC Loop
**Problem:** Killing mobs drops items → Transmute to EMC → Infinite EMC
**Items to set EMC=0:**
- Mob drops that are easily farmable (bones, string, rotten flesh, etc.)
- Already handled by default vanilla EMC, but verify

#### B. Forestry Bee Products
**Problem:** Bees produce infinite resources passively
**Items to set EMC=0 or LOW:**
- All bee combs
- Royal jelly
- Propolis
- Pollen

#### C. BuildCraft Quarry + Transmutation
**Problem:** Quarry generates infinite cobble/dirt → EMC
**Mitigation:** Keep cobble/dirt EMC low (default is 1), acceptable

#### D. IC2 Recycler/Scrap Loop
**Problem:** Recycler produces scrap from low-value items → Scrap has EMC
**Items to set EMC=0:**
- `ic2:itemscrap` (Scrap)
- `ic2:itemscrapbox` (Scrapbox)

#### E. UU-Matter Transmutation
**Problem:** UU-Matter is expensive to make but has default high EMC
**Decision:** Set `ic2:itemuumatter` EMC=0 (force crafting, not transmutation)

#### F. Environmental Tech Void Miner Output
**Problem:** Void miners generate ores from nothing → EMC
**Already Handled:** ✅ All void miner controllers have EMC=0

#### G. Fuel/Mobius/Aeternalis Loop
**Problem:** ProjectE fuels can be burned and transmuted back
**Mitigation:** covalenceLoss=1.0 means no loss, consider 0.9 for slight loss

### Medium Priority Exploits

#### H. Watch of Flowing Time + Passive Generation
**Problem:** Time Watch accelerates EMC generators massively
**Options:**
1. Disable Time Watch entirely (`enableTimeWatch=false`)
2. Gate Time Watch behind tech (CraftTweaker recipe)
3. Accept as end-game capability (current setting)

#### I. Tome of Knowledge
**Status:** ✅ Already uncraftable (`craftableTome=false`)

#### J. Collector + Relay Stacking
**Problem:** EMC collection scales infinitely
**Mitigation:** Limit through recipe gating (require advanced components)

---

## 3. Tech-Gating Strategy

### Philosophy
ProjectE should **complement** tech progression, not bypass it:
- Early game: Small EMC gains from mining/farming
- Mid game: Transmutation unlocked, Dark Matter achievable
- Late game: Red Matter requires tech infrastructure
- End game: Klein Stars as ultimate storage, gated behind Draconic

### Proposed Recipe Gates

#### Dark Matter (Tier 1 Gate)
**Current:** 8x Aeternalis Fuel
**New Recipe:** Require IC2 Advanced Circuit
```zenscript
// Gate Dark Matter behind IC2 tech
recipes.remove(<projecte:item.pe_matter>);
recipes.addShaped("dark_matter_gated", <projecte:item.pe_matter>, [
    [<projecte:item.pe_fuel:2>, <ore:circuitAdvanced>, <projecte:item.pe_fuel:2>],
    [<ore:circuitAdvanced>, <projecte:item.pe_covalence_dust:2>, <ore:circuitAdvanced>],
    [<projecte:item.pe_fuel:2>, <ore:circuitAdvanced>, <projecte:item.pe_fuel:2>]
]);
```

#### Red Matter (Tier 2 Gate)
**Current:** 8x Dark Matter + Aeternalis
**New Recipe:** Require Draconic Core
```zenscript
// Gate Red Matter behind Draconic Evolution
recipes.remove(<projecte:item.pe_matter:1>);
recipes.addShaped("red_matter_gated", <projecte:item.pe_matter:1>, [
    [<projecte:item.pe_matter>, <draconicevolution:draconic_core>, <projecte:item.pe_matter>],
    [<draconicevolution:draconic_core>, <projecte:item.pe_fuel:2>, <draconicevolution:draconic_core>],
    [<projecte:item.pe_matter>, <draconicevolution:draconic_core>, <projecte:item.pe_matter>]
]);
```

#### Klein Star Omega (Ultimate Gate)
**Current:** Normal progression
**New Recipe:** Require Wyvern Core (late-game)
```zenscript
// Gate Klein Star Omega behind late Draconic
recipes.remove(<projecte:item.pe_klein_star:5>);
recipes.addShaped("klein_omega_gated", <projecte:item.pe_klein_star:5>, [
    [<projecte:item.pe_klein_star:4>, <draconicevolution:wyvern_core>, <projecte:item.pe_klein_star:4>],
    [<draconicevolution:wyvern_core>, <projecte:item.pe_matter:1>, <draconicevolution:wyvern_core>],
    [<projecte:item.pe_klein_star:4>, <draconicevolution:wyvern_core>, <projecte:item.pe_klein_star:4>]
]);
```

#### Watch of Flowing Time (Optional Gate)
```zenscript
// Gate Time Watch behind BuildCraft + IC2
recipes.remove(<projecte:item.pe_time_watch>);
recipes.addShaped("time_watch_gated", <projecte:item.pe_time_watch>, [
    [<ore:ingotGold>, <minecraft:clock>, <ore:ingotGold>],
    [<ore:circuitAdvanced>, <projecte:item.pe_matter>, <ore:circuitAdvanced>],
    [<ore:ingotGold>, <buildcraftcore:gear_diamond>, <ore:ingotGold>]
]);
```

---

## 4. EMC Value Recommendations

### Items to Set EMC=0 (Prevent Exploits)

```json
// Add to custom_emc.json
{"item": "ic2:itemscrap", "emc": 0},
{"item": "ic2:itemscrapbox", "emc": 0},
{"item": "ic2:itemuumatter", "emc": 0},
{"item": "forestry:beeswax", "emc": 0},
{"item": "forestry:honey_drop", "emc": 0},
{"item": "forestry:honeydew", "emc": 0},
{"item": "forestry:royal_jelly", "emc": 0},
{"item": "forestry:pollen", "emc": 0},
{"item": "forestry:propolis", "emc": 0}
```

### Items to Increase EMC (Reward Tech Investment)

| Item | Default | Recommended | Rationale |
|------|---------|-------------|-----------|
| IC2 Electronic Circuit | ~256 | 1024 | Reward tech crafting |
| IC2 Advanced Circuit | ~512 | 4096 | Reward complex crafting |
| BuildCraft Iron Gear | ~64 | 256 | Reward manufacturing |
| BuildCraft Diamond Gear | ~512 | 2048 | Reward late manufacturing |
| Project Red Silicon Chip | ~32 | 512 | Reward electronics |
| Project Red Red Alloy Wire | ~16 | 128 | Reward wiring |

### Items to Decrease EMC (Prevent Easy Gains)

| Item | Default | Recommended | Rationale |
|------|---------|-------------|-----------|
| Blaze Rod | ~1536 | 512 | Too easy to farm |
| Ender Pearl | ~1024 | 256 | Enderman farms trivial |
| Ghast Tear | ~4096 | 1024 | Farm-able with effort |

---

## 5. Config Changes Needed

### ProjectE.cfg Recommendations
```properties
# Consider changing:
covalenceLoss=0.9          # 10% loss on transmutation (optional)
enableTimeWatch=true       # Keep enabled but gate recipe
```

### custom_emc.json Additions
See Section 4 for full list of items to add.

---

## 6. Implementation Checklist for Integrator

### CraftTweaker Script (`scripts/projecte_integration.zs`)
- [ ] Gate Dark Matter recipe (require Advanced Circuit)
- [ ] Gate Red Matter recipe (require Draconic Core)
- [ ] Gate Klein Star Omega (require Wyvern Core) - OPTIONAL
- [ ] Gate Watch of Flowing Time (require Diamond Gear + Advanced Circuit) - OPTIONAL

### custom_emc.json Updates
- [ ] Add IC2 scrap/UU-Matter = 0
- [ ] Add Forestry bee products = 0
- [ ] Add IC2 circuits = increased values
- [ ] Add BuildCraft gears = increased values
- [ ] Add Project Red items = increased values
- [ ] Reduce mob farm outputs (Blaze Rod, Ender Pearl, etc.)

### ProjectE.cfg Updates
- [ ] Consider `covalenceLoss=0.9` (10% loss)
- [ ] Or leave at 1.0 if tech gating is sufficient

### Testing (Deferred to Phase 4)
- [ ] Verify Dark Matter requires Advanced Circuit
- [ ] Verify Red Matter requires Draconic Core
- [ ] Verify no easy EMC loops exist
- [ ] Verify tech investment feels rewarded

---

## 7. Item Registry Reference

### ProjectE Items
```
<projecte:item.pe_matter>          // Dark Matter
<projecte:item.pe_matter:1>        // Red Matter
<projecte:item.pe_fuel>            // Alchemical Coal
<projecte:item.pe_fuel:1>          // Mobius Fuel
<projecte:item.pe_fuel:2>          // Aeternalis Fuel
<projecte:item.pe_covalence_dust>  // Low Covalence Dust
<projecte:item.pe_covalence_dust:1> // Medium Covalence Dust
<projecte:item.pe_covalence_dust:2> // High Covalence Dust
<projecte:item.pe_klein_star>      // Klein Star Ein
<projecte:item.pe_klein_star:1>    // Klein Star Zwei
<projecte:item.pe_klein_star:2>    // Klein Star Drei
<projecte:item.pe_klein_star:3>    // Klein Star Vier
<projecte:item.pe_klein_star:4>    // Klein Star Sphere
<projecte:item.pe_klein_star:5>    // Klein Star Omega
<projecte:item.pe_time_watch>      // Watch of Flowing Time
<projecte:item.pe_philosophers_stone> // Philosopher's Stone
<projecte:transmutation_table>     // Transmutation Table
<projecte:condenser_mk1>           // Energy Condenser MK1
<projecte:condenser_mk2>           // Energy Condenser MK2
<projecte:collector_mk1>           // Energy Collector MK1
<projecte:collector_mk2>           // Energy Collector MK2
<projecte:collector_mk3>           // Energy Collector MK3
<projecte:relay_mk1>               // Anti-Matter Relay MK1
<projecte:relay_mk2>               // Anti-Matter Relay MK2
<projecte:relay_mk3>               // Anti-Matter Relay MK3
```

### IC2 Classic Items (Verified Working)
```
<ore:circuitBasic>                 // Electronic Circuit
<ore:circuitAdvanced>              // Advanced Circuit
<ic2:itemcable:9>                  // Glass Fibre Cable
```

### BuildCraft Items (Verified Working)
```
<buildcraftcore:gear_iron>
<buildcraftcore:gear_gold>
<buildcraftcore:gear_diamond>
```

---

## 8. Priority Order

1. **HIGH:** Create `scripts/projecte_integration.zs` with Dark Matter + Red Matter gates
2. **HIGH:** Update `custom_emc.json` with IC2 scrap/UU-Matter = 0
3. **MEDIUM:** Add Forestry bee products = 0
4. **MEDIUM:** Add increased EMC for tech items (circuits, gears)
5. **LOW:** Gate Watch of Flowing Time
6. **LOW:** Gate Klein Star Omega
7. **OPTIONAL:** Adjust covalenceLoss to 0.9

---

## 9. Open Questions for Integrator Judgment

1. **Covalence Loss:** Keep 1.0 (full return) or set 0.9 (10% loss)?
   - 1.0 = More generous, tech gates are enough
   - 0.9 = Slight loss discourages excessive transmutation

2. **Time Watch:** Gate it or leave it?
   - Gate = Prevents early-game acceleration abuse
   - Leave = It's a fun item, let players use it

3. **Condenser/Collector Gates:** Should these require tech components?
   - Current: No gates
   - Could require: Basic circuits for MK1, Advanced for MK2/MK3

---

*Handoff complete. All research documented. Ready for Integrator implementation.*

**Files to reference:**
- `config/ProjectE/ProjectE.cfg`
- `config/ProjectE/custom_emc.json`
- `config/ProjectE/mapping.cfg`
- `research/MOD_COMPATIBILITY_MATRIX.md`
