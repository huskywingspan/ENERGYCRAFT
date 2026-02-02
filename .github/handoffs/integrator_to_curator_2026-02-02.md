# 🔬 Integrator → Curator Handoff: Implementation Session Summary

**Date:** February 2, 2026  
**Integrator Session:** Draconic Evolution, IC2 Classic Balance, Environmental Tech  
**Status:** Implementation Complete, Awaiting Playtesting

---

## Executive Summary

Successfully integrated three major systems into EnergyCraft. All CraftTweaker scripts are written, configs applied, and EMC values set. However, **critical discovery**: IC2 Classic uses completely different item IDs than IC2 Experimental, requiring significant recipe rewrites.

---

## 1. Draconic Evolution Integration

### What Was Implemented

| Component | Gate Requirement | Status |
|-----------|------------------|--------|
| Energy Storage Core | Advanced Circuits + Diamond Block | ✅ |
| Fusion Crafting Injector | BuildCraft Gold Gear | ✅ |
| Fusion Crafting Core | BuildCraft Diamond Gear + Glass Fibre | ✅ |
| Draconic Core | Electronic Circuit | ✅ |
| Wyvern Core | Advanced Circuit + Nether Star | ✅ |
| Energy Pylon | BuildCraft Diamond Gear | ✅ |
| Particle Generator | BuildCraft Iron Gear | ✅ |
| Dislocator | Electronic Circuit | ✅ |
| Reactor Core | Glass Fibre Cable + Awakened materials | ✅ |
| Reactor Stabilizer | Glass Fibre Cable | ✅ |

### Config Changes Applied
- `config/brandon3055/DraconicEvolution.cfg`:
  - `B:grinder=false` (Mob Grinder disabled)
  - `I:chaosGuardianHealth=6000` (3x default, was 2000)

### EMC Values Set
- Dragon Heart: 1,000,000 EMC
- Draconium Ore/Ingot: 8,192 EMC
- Chaos Shard: **NO EMC**
- Awakened materials: **NO EMC**

### Critical Issue Encountered & Resolved

**Problem:** The handoff specified `<ic2:blockmachine:X>` for IC2 machines (transformers, advanced casings). This syntax is for **IC2 Experimental**, not IC2 Classic.

**Error observed:**
```
ERROR: draconic_evolution.zs:35: Could not resolve <ic2:blockmachine:12>
ERROR: draconic_evolution.zs:51: Could not resolve <ic2:blockmachine:5>
```

**Resolution:** Replaced all IC2 machine block references with working alternatives:
- BuildCraft gears (`gear_iron`, `gear_gold`, `gear_diamond`)
- IC2 circuits via ore dictionary (`<ore:circuitBasic>`, `<ore:circuitAdvanced>`)
- IC2 cables (`<ic2:itemcable:9>` for Glass Fibre)

### Curator Action Needed

📋 **Research Request:** We need a complete IC2 Classic item ID reference document. The current assumption that IC2 Classic uses `ic2:blockmachine:X` is incorrect. Key questions:

1. What are the actual registry names for IC2 Classic machines?
2. Are transformers separate blocks or metadata variants?
3. What's the correct syntax for Advanced Machine Casing?
4. Can we use CraftTweaker to query/dump IC2 Classic item IDs?

**Workaround used:** Gating via circuits and BuildCraft gears achieves similar progression feel without needing IC2 machine blocks directly.

---

## 2. IC2 Classic Balance Changes

### What Was Implemented

| Setting | Before | After | Rationale |
|---------|--------|-------|-----------|
| `UUNeedsScrap` | `false` | `true` | Requires scrap amplifier for UU-Matter |
| `enableHardEnrichedUran` | `false` | `true` | Harder uranium enrichment process |

### Playtesting Needed

- [ ] Verify Mass Fabricator shows scrap slot
- [ ] Confirm UU-Matter production rate with scrap feels balanced
- [ ] Test uranium enrichment chain (macerator → thermal centrifuge)
- [ ] Ensure nuclear progression feels appropriately late-game

---

## 3. Environmental Tech Integration

### What Was Implemented

**Void Ore Miners (6 tiers):**
| Tier | Gate |
|------|------|
| T1 | Advanced Circuit + BuildCraft Diamond Gear + Litherite |
| T2 | T1 + Erodium Crystal + Diamond Block |
| T3 | T2 + Draconium Ingots + Draconic Core |
| T4 | T3 + Draconic Cores + Draconium Block |
| T5 | T4 + Wyvern Cores + Awakened Draconium |
| T6 | T5 + Awakened Core + Chaos Shards |

**Void Resource Miners:** Same gating structure as Ore Miners

**Solar Arrays:**
- T1-T2: **DISABLED** (recipes removed entirely)
- T3-T6: Gated behind Draconic Evolution components

**Other Features:**
- Lightning Rod: Light gating (Advanced Circuit + Iron Gear)
- Nanobot Beacon: Light gating (Beacon + Litherite)

**Crystal Progression:**
Each tier requires previous tier crystals + escalating tech components (circuits → draconium → draconic cores → awakened cores)

### EMC Values Set
- Litherite Crystal: 4,096 EMC
- Erodium Crystal: 8,192 EMC
- Kyronite Crystal: 16,384 EMC
- Pladium Crystal: 32,768 EMC
- Ionite Crystal: 65,536 EMC
- Aethium Crystal: **NO EMC**
- All Controllers (Void Miners, Solar): **NO EMC**

### Potential Issues (Untested)

⚠️ **Item ID Uncertainty:** The script uses assumed item IDs like:
- `<environmentaltech:void_ore_miner_cont_1>`
- `<environmentaltech:litherite_crystal>`
- `<environmentaltech:litherite>`

These need verification once the mod is installed. If IDs differ, we'll see similar errors to the IC2 Classic situation.

### Curator Action Needed

📋 **Research Request:** After Environmental Tech is installed:
1. Verify actual item registry names
2. Check if there are config options for power consumption
3. Document ore generation tables (what ores spawn at each tier)
4. Identify if there's a way to disable features via config vs CraftTweaker

---

## 4. Documentation Created

### Playtesting Checklist
Created comprehensive `docs/PLAYTESTING_CHECKLIST.md` covering:
- 11 testing categories
- Specific checkbox items for each integration
- Notes sections for observations
- Issue tracking tables
- Balance feedback tables

### Files Modified
| File | Changes |
|------|---------|
| `scripts/draconic_evolution.zs` | Created, then fixed IC2 item IDs |
| `scripts/environmental_tech.zs` | Created |
| `config/brandon3055/DraconicEvolution.cfg` | Mob Grinder disabled, Guardian health 3x |
| `config/ic2/ic2.cfg` | UUNeedsScrap, enableHardEnrichedUran |
| `config/ProjectE/custom_emc.json` | DE + ET EMC values |
| `CHANGELOG.md` | Updated with all changes |
| `docs/PLAYTESTING_CHECKLIST.md` | Created |

---

## 5. Commits Made

```
fe56dd6 feat: Integrate Draconic Evolution (scripts + EMC)
a1c5089 fix: Correct DE script for IC2 Classic compatibility
cc15841 feat: Implement IC2 Classic balance recommendations
7df8e71 docs: Add comprehensive playtesting checklist
aab2ee3 feat: Integrate Environmental Tech as late-game power sink
```

---

## 6. Open Questions for Curator

### High Priority

1. **IC2 Classic Item Registry:**
   - Need definitive list of block/item registry names
   - Current workaround uses circuits/cables which DO work
   - If we want direct machine gating (e.g., "requires MV Transformer"), we need correct IDs

2. **Environmental Tech Verification:**
   - Mod not yet installed at time of script writing
   - Item IDs assumed based on standard conventions
   - May need fixes similar to DE script

### Medium Priority

3. **Solar Array Balance:**
   - Currently T1-T2 disabled, T3+ gated behind DE
   - Is this too aggressive? Should T1-2 just be expensive instead of disabled?
   - Alternative: Gate behind IC2 solar panels progression?

4. **Void Miner Ore Tables:**
   - Default ore tables may include modded ores we don't have
   - May need config research to customize what ores spawn

### Low Priority

5. **Nanobot Beacon Effects:**
   - What buffs does it provide?
   - Are any effects overpowered that should be disabled?

6. **DE Armor:**
   - Currently not touched (only recipe gating on cores)
   - Should armor be disabled entirely or just expensive?
   - Research indicated armor trivializes combat

---

## 7. Recommended Next Steps

### For Curator

1. **Document IC2 Classic item IDs** - Critical for future recipe work
2. **Verify ET item IDs** after mod installation
3. **Research ET config options** for power consumption tuning
4. **Evaluate DE armor balance** - disable vs extreme gating

### For Balancer/Playtester

1. Launch game, verify no CraftTweaker errors
2. Check JEI for all gated recipes
3. Test Mass Fabricator scrap requirement
4. Build a T1 Void Miner, check power consumption
5. Document any balance concerns in PLAYTESTING_CHECKLIST.md

### For Integrator (Next Session)

1. Fix any item ID issues discovered during playtesting
2. Implement ET config changes if research identifies needs
3. Consider DE armor gating if Curator provides recommendations
4. Add quest integration for Environmental Tech (Era VII-VIII)

---

## 8. Key Learnings

### IC2 Classic vs IC2 Experimental

**This is critical for all future work:**

| Feature | IC2 Experimental | IC2 Classic |
|---------|------------------|-------------|
| Machine IDs | `ic2:blockmachine:X` | Different (TBD) |
| Cable IDs | `ic2:cable` | `ic2:itemcable:X` ✅ |
| Circuits | Separate items | Ore dictionary works ✅ |
| Overall | Metadata-based | Possibly separate blocks |

**Working IC2 Classic references:**
```zs
<ic2:itemcable:9>      // Glass Fibre Cable ✅
<ore:circuitBasic>     // Electronic Circuit ✅
<ore:circuitAdvanced>  // Advanced Circuit ✅
```

**NOT working:**
```zs
<ic2:blockmachine:X>   // ❌ Does not exist
<ic2:te:X>             // ❌ Experimental syntax
```

### Recipe Gating Philosophy

When direct machine gating isn't possible, equivalent tech gating can be achieved through:
1. **Circuits** - Represent tech tier (basic = LV, advanced = MV+)
2. **Cables** - Glass Fibre = HV+ infrastructure
3. **BuildCraft Gears** - Represent manufacturing capability
4. **Draconic Components** - Represent end-game progression

This maintains the FEEL of tech progression even without exact machine requirements.

---

*Handoff complete. Awaiting Curator research on IC2 Classic item IDs and ET verification.*

**Files to Review:**
- `scripts/draconic_evolution.zs`
- `scripts/environmental_tech.zs`
- `docs/PLAYTESTING_CHECKLIST.md`
- `CHANGELOG.md`
