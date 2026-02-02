# Environmental Tech Evaluation

> **Type:** Curator Mod Evaluation  
> **Date:** February 2, 2026  
> **Mod Version:** 2.0.20.1 (1.12.2)  
> **Purpose:** Evaluate Environmental Tech as a potential power sink and resource generation mod for EnergyCraft

---

## Summary

| Category | Rating | Notes |
|----------|--------|-------|
| **1.12.2 Compatibility** | ✅ Excellent | Active maintenance, stable releases |
| **Power Sink Potential** | ✅ Excellent | Void miners consume massive RF |
| **Progression Fit** | ⚠️ Good | Needs gating to prevent early-game skip |
| **Complexity** | ⚠️ Medium | Multiblock structures, modifier system |
| **Pack Balance Risk** | ⚠️ Medium | Can trivialize resource gathering |

**Recommendation:** ✅ **ADD** with careful configuration and recipe gating

---

## Mod Overview

### What is Environmental Tech?

Environmental Tech is a tech mod focused on **large multiblock machines** that interact with the environment in powerful ways:

- **Void Ore Miners** - Extract ores from "the void" (infinite resource generation)
- **Void Resource Miners** - Extract non-ore resources (mob drops, plants, etc.)
- **Solar Arrays** - Generate massive amounts of RF from sunlight
- **Lightning Rods** - Generate RF from lightning strikes
- **Nanobot Beacons** - Provide player buffs at RF cost

### Key Characteristics

| Aspect | Description |
|--------|-------------|
| **Energy System** | RF/Forge Energy (compatible with our converters) |
| **Structure Type** | Multiblock (requires specific block arrangement) |
| **Tier System** | 6 tiers with increasing power/cost |
| **Modifier System** | Upgradeable with "modifiers" for efficiency |

---

## 1.12.2 Compatibility

### Version Information

| Component | Version | Status |
|-----------|---------|--------|
| Environmental Tech | 2.0.20.1 | ✅ Stable (March 2019) |
| ValkyrieLib (Required) | 1.12.2-3.x | ✅ Required dependency |
| ValkyrieCompat (Optional) | Latest | ⚠️ For cross-mod compatibility |

### Dependencies

```
Required:
└── ValkyrieLib (library mod)

Optional:
└── ValkyrieCompat (integration with other mods)
```

### Pack Permission

From CurseForge page:
> "CurseForge and FTB modpacks: Go Ahead :)"

✅ **Clear permission for modpack use**

---

## Feature Analysis

### Void Ore Miner (Primary Interest)

The Void Ore Miner is the main feature relevant to EnergyCraft as a **power sink**.

#### Tier Structure

| Tier | Size | Approx. RF/tick | Ore Variety | Build Cost |
|------|------|-----------------|-------------|------------|
| 1 | 5x4x5 | ~2,000 | Low | Moderate |
| 2 | 7x5x7 | ~8,000 | Medium | High |
| 3 | 9x6x9 | ~20,000 | Good | Very High |
| 4 | 11x7x11 | ~50,000 | High | Expensive |
| 5 | 13x8x13 | ~100,000 | Very High | Very Expensive |
| 6 | 15x9x15 | ~200,000+ | Maximum | Extreme |

*Note: Exact values depend on configuration and modifiers*

#### How It Works

1. Build multiblock structure with controller at center
2. Power the structure with RF
3. Miner extracts ores based on:
   - Tier level (higher = more variety)
   - Installed modifiers (lenses/crystals)
   - Configured ore weights
4. Ores appear in internal inventory

#### Power Sink Analysis

| Tier | RF/tick | Daily Consumption (20 min day) |
|------|---------|--------------------------------|
| T1 | 2,000 | 2.4M RF |
| T3 | 20,000 | 24M RF |
| T6 | 200,000 | 240M RF |

**Verdict:** Higher tiers are legitimate power sinks, especially T4+.

### Solar Arrays

| Tier | RF/tick (Day) | Structure Size |
|------|---------------|----------------|
| T1 | ~500 | 5x4x5 |
| T6 | ~100,000+ | 15x9x15 |

**Concern:** T6 solar could trivialize power generation.  
**Solution:** Gate behind Draconic Evolution materials or extreme costs.

### Lightning Rods

Generate massive RF bursts from lightning strikes. Unreliable but high-reward.

**Assessment:** Fun addition, doesn't break balance due to weather dependency.

### Nanobot Beacons

Provide player buffs (speed, haste, etc.) at RF cost.

**Assessment:** Quality of life feature, doesn't impact progression balance.

---

## EnergyCraft Integration Analysis

### Potential Benefits

| Benefit | Description |
|---------|-------------|
| **Power Sink** | Higher tier void miners consume 50K-200K+ RF/t |
| **Ore Generation** | Provides late-game infinite resources |
| **Goal Content** | Building T6 structures is a major project |
| **RF Focus** | Works well with Draconic Evolution power systems |

### Potential Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| **Trivializes Mining** | High | Gate behind late-game content |
| **Overlaps with Quarries** | Medium | Position as "post-quarry" tech |
| **Power Gen (Solar)** | High | Disable or gate heavily |
| **Ore Duplication** | Medium | Already have macerators |

### Progression Placement

```
Era VI: Transmutation     Era VII: Logistics      Era VIII: Draconic
        │                         │                       │
        └────────────────────────►├──────────────────────►│
                                  │                       │
                           Environmental Tech      DE Integration
                           Void Miners (T1-T3)     Void Miners (T4-T6)
```

**Recommended Placement:** Era VII-VIII (Late game)

---

## Configuration Recommendations

### Recipe Gating Strategy

#### Tier 1-2: Post-IC2 HV
```
Gate with:
- IC2 HV components
- BuildCraft Diamond Gear
- Significant diamonds/emeralds
```

#### Tier 3-4: Draconic Era
```
Gate with:
- Draconium components
- DE Energy Cores
- IC2 EV-tier items (if available)
```

#### Tier 5-6: End-Game
```
Gate with:
- Awakened Draconium
- Draconic Core components
- Chaos Shards (optional)
```

### Feature Toggles (if configurable)

| Feature | Recommendation | Rationale |
|---------|----------------|-----------|
| Void Ore Miner | ✅ Enable | Core power sink feature |
| Void Resource Miner | ⚠️ Review | May be too powerful |
| Solar Arrays | ⚠️ Disable or gate heavily | Competes with IC2/DE power |
| Lightning Rods | ✅ Enable | Fun, not OP |
| Nanobot Beacons | ✅ Enable | QoL feature |

### EMC Values (ProjectE Integration)

| Item | Recommended EMC | Rationale |
|------|-----------------|-----------|
| Litherite Crystal | 4,096 | Base material |
| Erodium Crystal | 8,192 | Tier 2 |
| Kyronite Crystal | 16,384 | Tier 3 |
| Pladium Crystal | 32,768 | Tier 4 |
| Ionite Crystal | 65,536 | Tier 5 |
| Aethium Crystal | NO EMC | End-game, prevent exploits |
| Structure Frames | Based on materials | Standard calculation |
| Modifiers | NO EMC | Encourage crafting |

---

## Comparison with Alternatives

### vs. BuildCraft Quarry

| Aspect | BC Quarry | ET Void Miner |
|--------|-----------|---------------|
| Power Type | MJ | RF |
| Resource Source | World (destructive) | Void (infinite) |
| Ore Variety | What's underground | Configurable |
| Infrastructure | Minimal | Large multiblock |
| Era | Mid-game | Late-game |

**Verdict:** Complementary, not redundant. Quarry → Void Miner is natural progression.

### vs. Draconic Evolution

| Aspect | Draconic Evolution | Environmental Tech |
|--------|-------------------|-------------------|
| Focus | Power storage, combat | Resource generation |
| Power Sink | Energy Cores | Void Miners |
| Boss Content | Chaos Guardian | None |
| Complexity | High | Medium |

**Verdict:** Complementary. ET provides resources, DE provides goals.

---

## Implementation Plan

### Phase 1: Add Mod (If Approved)

1. Download Environmental Tech 2.0.20.1
2. Download ValkyrieLib (dependency)
3. Test for conflicts with existing mods
4. Generate default configs

### Phase 2: Configuration

1. Review generated configs for balance options
2. Set power consumption values
3. Configure ore generation tables
4. Disable/gate solar arrays if needed

### Phase 3: Recipe Integration (CraftTweaker)

```zs
// Example gating for Tier 1 Void Miner Controller
// (Actual implementation needs item ID research)

recipes.remove(<environmentaltech:void_ore_miner_cont_1>);
recipes.addShaped("et_void_miner_t1", <environmentaltech:void_ore_miner_cont_1>, [
    [<ore:circuitAdvanced>, <buildcraftsilicon:assembly_table>, <ore:circuitAdvanced>],
    [<ic2:te:hv_transformer>, <ore:blockDiamond>, <ic2:te:hv_transformer>],
    [<ore:circuitAdvanced>, <buildcraftcore:engine:2>, <ore:circuitAdvanced>]
]);
```

### Phase 4: Quest Integration

Add quests to Era VII-VIII:
- "The Void Awaits" - Build first void miner
- "Industrial Extraction" - Reach T3 void miner
- "Unlimited Resources" - Reach T6 void miner (optional/achievement)

---

## Final Recommendation

### Verdict: ✅ RECOMMENDED FOR PHASE 2

Environmental Tech fills a valuable niche in EnergyCraft:

1. **Power Sink:** Higher tier void miners are legitimate RF sinks
2. **Late-Game Goal:** Building T6 multiblocks is a major achievement  
3. **Resource Solution:** Provides infinite ores without world destruction
4. **RF Ecosystem:** Works perfectly with Draconic Evolution power storage

### Conditions for Addition

1. **Gate recipes** behind IC2/DE progression
2. **Disable or heavily gate solar arrays** to protect IC2/DE power relevance
3. **Set appropriate EMC values** (or no EMC for high-tier items)
4. **Position in Era VII-VIII** quest progression
5. **Playtest thoroughly** for balance

### Required Mods

| Mod | Download |
|-----|----------|
| Environmental Tech 2.0.20.1 | [CurseForge](https://www.curseforge.com/minecraft/mc-mods/environmental-tech/files?version=1.12.2) |
| ValkyrieLib | [CurseForge](https://www.curseforge.com/minecraft/mc-mods/valkyrielib) |

---

## Appendix: Research Sources

- CurseForge mod page
- FTB Wiki (partial)
- Community modpack configurations (FTB Revelation, E2:E)
- Reddit r/feedthebeast discussions

---

*Research completed by Curator Agent*  
*Recommend proceeding to Phase 2 prep if team approves*
