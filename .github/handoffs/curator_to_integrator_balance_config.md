# Integrator Handoff: Balance Configuration Phase

> **From:** Curator
> **To:** Integrator
> **Date:** February 2, 2026
> **Priority:** HIGH (before Phase 4 playtest)
> **Source:** Gemini Deep Research Report

---

## Overview

The Gemini research report identified critical balance configurations needed for Draconic Evolution and Environmental Tech. These changes should be implemented BEFORE the Phase 4 comprehensive playtest.

---

## Task 1: Draconic Evolution Armor Nerf

### The Problem

DE armor uses a "Shield Buffer" mechanic that absorbs 100% of damage into RF storage. With sufficient RF (via Flux Networks wireless charging), players become **mathematically invincible**.

- **Wyvern Armor:** 4M+ RF capacity
- **Draconic Armor:** 16M+ RF, includes "Last Stand" (10M RF prevents death)

### Required Configuration Changes

**File:** `config/brandon3055/DraconicEvolution.cfg`

| Parameter | Default | EnergyCraft Value | Rationale |
|-----------|---------|-------------------|-----------|
| `I:draconicBaseShieldCapacity` | 512 | **128** | Lower = shield breaks with burst damage |
| `I:wyvernBaseShieldCapacity` | ~256 | **32** | Keep Wyvern comparable to other tech armor |
| `I:draconicBaseRFCapacity` | 16,000,000 | **1,600,000** | 10x reduction to "infinite health" buffer |
| `I:draconicShieldRechargeCost` | ~1000 | **10,000** | Makes sustaining shield expensive |
| `D:flightSpeedModifier` | ~2.0 | **1.5** | Prevents chunk gen lag from speed |
| `I:flightSpeedLimit` | ~300 | **200** | Hard cap regardless of upgrades |

### Implementation

```cfg
# In DraconicEvolution.cfg, locate "Stat Tweaks" section

# Shield Balance (prevents invincibility)
I:draconicBaseShieldCapacity=128
I:wyvernBaseShieldCapacity=32

# Energy Buffer (reduces "infinite health" pool)
I:draconicBaseRFCapacity=1600000

# Recharge Cost (makes combat drain resources)
I:draconicShieldRechargeCost=10000

# Flight Speed (prevents server lag)
D:flightSpeedModifier=1.5
I:flightSpeedLimit=200
```

### Effect on Gameplay

- Players can still use DE armor for utility (flight, night vision, speed)
- Combat now requires strategy, not just face-tanking
- Shield will break under sustained fire
- "Last Stand" still works but draws from smaller pool

---

## Task 2: Environmental Tech Power Scaling

### The Problem

ET solar arrays and void miners can trivialize resource/power economy if accessible too early.

- Tier 6 Solar: Millions of RF/t with zero maintenance
- Void Miners: Infinite resources for moderate RF investment

### Required Configuration Changes

**File:** `config/environmentaltech/common.cfg`

| Parameter | Default | EnergyCraft Value | Rationale |
|-----------|---------|-------------------|-----------|
| `void_ore_miner_power_modifier` | 1.0 | **4.0** | 4x power cost forces robust infrastructure |
| `solar_panel_output_modifier` | 1.0 | **0.5** | 50% solar output to keep other power relevant |

### Implementation

```cfg
# In common.cfg

# Void Miner Power Multiplier
# Makes void mining expensive, requiring Draconic/reactor power
D:void_ore_miner_power_modifier=4.0

# Solar Output Nerf (optional - test during playtest)
# Keeps coal/geothermal/nuclear relevant longer
D:solar_panel_output_modifier=0.5
```

### Power Cost Reference (with 4x modifier)

| Tier | Default RF/t | With 4x Modifier |
|------|--------------|------------------|
| Tier 1 | ~660 | **2,640 RF/t** |
| Tier 2 | ~1,500 | **6,000 RF/t** |
| Tier 3 | ~3,500 | **14,000 RF/t** |
| Tier 4 | ~8,000 | **32,000 RF/t** |
| Tier 5 | ~18,000 | **72,000 RF/t** |
| Tier 6 | ~40,000 | **160,000 RF/t** |

---

## Task 3: Verify IC2 Classic Item IDs

### The Problem

Our CraftTweaker scripts may be using IC2 Experimental registry names instead of IC2 Classic's `ic2:te` namespace.

### Action Required

1. Launch game in Creative mode
2. Use `/ct hand` on each IC2 machine
3. Verify against `research/IC2_CLASSIC_QUICK_REFERENCE.md`
4. Update any scripts using wrong IDs

### Scripts to Check

| Script | IC2 Items Used | Status |
|--------|----------------|--------|
| `scripts/projecte_integration.zs` | Circuits, machines | ⚠️ Verify |
| `scripts/draconic_evolution.zs` | DE items (should be fine) | ⚠️ Verify |
| `scripts/environmental_tech.zs` | ET items (should be fine) | ⚠️ Verify |

### Expected ID Corrections

| Script Uses | Should Be |
|-------------|-----------|
| `<ic2:blockmacerator>` | `<ic2:te:4>` |
| `<ic2:blockelectricfurnace>` | `<ic2:te:2>` |
| `<ic2:blockgenerator>` | `<ic2:te:3>` |
| `<ic2:blockbatbox>` | `<ic2:te:72>` |
| `<ic2:blockmfe>` | `<ic2:te:73>` |
| `<ic2:blockmfsu>` | `<ic2:te:74>` |
| `<ic2:itempartcircuit>` | `<ic2:itemcrafting:1>` |
| `<ic2:itempartcircuitadv>` | `<ic2:itemcrafting:2>` |

---

## Task 4: Optional - Void Miner Draconium

### Enhancement (Low Priority)

Add Draconium Ore to Tier 5-6 void miners as an alternate acquisition path.

**File:** `config/environmentaltech/multiblocks/void_miner/ore/tier_5.json` (or tier_6.json)

```json
{
  "item": {
    "id": "draconicevolution:draconium_ore",
    "damage": 0,
    "count": 1
  },
  "weight": 15,
  "laser": "purple"
}
```

### Considerations

- **Pro:** Gives players alternative to Chaos Island for Draconium
- **Con:** May trivialize early DE progression
- **Recommendation:** Add to Tier 6 only with very low weight (10-20)

---

## Implementation Checklist

### Priority 1 (Must Do)
- [ ] Apply DE armor shield nerfs
- [ ] Apply DE flight speed caps
- [ ] Verify IC2 Classic IDs in all scripts
- [ ] Fix any broken item references

### Priority 2 (Should Do)
- [ ] Apply ET void miner power multiplier (4x)
- [ ] Test ET solar output modifier (start at 0.75, adjust)

### Priority 3 (Optional)
- [ ] Add Draconium to Tier 6 void miner
- [ ] Adjust Erodium drop weight in Tier 1 miner (QoL)

---

## Testing After Changes

1. **DE Armor Test:**
   - Spawn Wyvern armor, charge to full
   - Fight Wither boss
   - Shield should deplete under sustained damage
   - "Last Stand" should still save from one-shot

2. **ET Power Test:**
   - Build Tier 1 void miner
   - Confirm ~2,640 RF/t draw (with 4x modifier)
   - Verify solar arrays don't trivially power it

3. **IC2 Script Test:**
   - Run `/ct reload` after ID fixes
   - Check `crafttweaker.log` for null references
   - Test affected recipes in JEI

---

## Source Documentation

- Full research report: `research/Modpack Technical Reference Request.md`
- IC2 Quick Reference: `research/IC2_CLASSIC_QUICK_REFERENCE.md`
- DE GitHub Issues: #616 (Last Stand), #1140 (Flight Speed)
- ET Config Guide: allthemods.github.io/alltheguides/atm6/envtech/

---

## Questions for Curator

If any issues arise:
1. IC2 IDs not matching reference → Dump with `/ct hand`, update quick reference
2. DE config parameters not found → Check exact parameter names in cfg file
3. ET multiplier not working → Verify config file location and syntax

---

*Handoff Version: 1.0*
*Expected Implementation Time: 30-45 minutes*
