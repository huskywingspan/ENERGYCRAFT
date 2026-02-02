# IC2 Classic Balance Research

> **Type:** Curator Research Document  
> **Date:** February 2, 2026  
> **Purpose:** Deep dive into IC2 Classic configuration for EnergyCraft balance tuning

---

## Executive Summary

IC2 Classic offers extensive configuration options that directly impact game difficulty, progression speed, and power balance. This document analyzes all balance-relevant settings in `ic2.cfg` and provides recommendations for EnergyCraft.

**Key Finding:** The default IC2 Classic settings are well-balanced for a tech-focused pack. Only minor tweaks are recommended to integrate better with our progression system.

---

## Configuration File Analysis

### File Location
```
config/ic2/ic2.cfg
```

### Balance Section (`balance {}`)

| Setting | Default | Range | Purpose |
|---------|---------|-------|---------|
| `EUPerUU` | 1.0 | 0.01-1900 | Multiplier for UU-Matter EU cost |
| `RFPerEU` | 8 | Integer | RF to EU conversion ratio |
| `UUNeedsScrap` | false | Boolean | Require scrap amplifier for UU production |
| `cropDifficulty` | 2 | 0-3 | Crop breeding difficulty |
| `electricSuitAbsorbtionScale` | 1.0 | Float | Electric armor damage absorption |
| `electricSuitEnergyCostModifier` | 1.0 | Float | Energy cost per damage absorbed |

#### Energy Generator Base Values

| Generator | Default | Notes |
|-----------|---------|-------|
| `energyGeneratorBase` | 10 | Standard generator output |
| `energyGeneratorGeo` | 20 | Geothermal generator |
| `energyGeneratorLiquid` | 100 | Liquid fuel generators |
| `energyGeneratorNuclear` | 5 | Nuclear (multiplied by reactor design) |
| `energyGeneratorSolar` | 100 | Solar panel base |
| `energyGeneratorWind` | 100 | Windmill base |
| `energyGeneratorThermal` | 25 | Thermal generator |
| `energyGeneratorWater` | 100 | Water mill base |
| `energyGeneratorScrap` | 12.5 | Scrap burning in generator |

### Features Section (`features {}`)

| Setting | Default | Impact | Recommendation |
|---------|---------|--------|----------------|
| `enableEnergyBurn` | 0.0 | Fire from cable burns | Keep at 0 (QoL) |
| `enableHardEnrichedUran` | false | Harder uranium processing | **Consider true** |
| `enableIC2EasyMode` | false | Disable explosions/melting | Keep false |
| `enableInfiniteNetherLava` | false | Infinite nether lava pumping | Keep false |
| `enableMinerLapotron` | true | Lapotron in miners | Keep true |
| `enableQuantumSpeedOnSprint` | true | Quantum legs sprint boost | Keep true |
| `enableTeleporterInventory` | true | Teleporter weight calc | Keep true |

### Crafting Section (`crafting {}`)

| Setting | Default | Purpose |
|---------|---------|---------|
| `disableBronzeTools` | false | Remove bronze tool recipes |
| `enableCraftingBucket` | true | Tin bucket recipe |
| `enableCraftingGunpowder` | true | Dust → gunpowder |
| `enableCraftingITnt` | true | Industrial TNT |
| `enableCraftingNuke` | true | Nuclear bomb |
| `enableSteelRecipes` | false | Replace refined iron with steel |
| `enableSecretRecipeHiding` | true | Hide secret recipes from JEI |

### World Section (`world {}`)

| Setting | Default | Notes |
|---------|---------|-------|
| `explosionPowerNuke` | 35.0 | Nuke power (TNT = 4) |
| `explosionPowerReactorMax` | 45.0 | Max reactor explosion |
| `useRealisticWind` | false | Wind simulation affects windmills |

### World Generation (`worldgen {}`)

| Setting | Default | Impact |
|---------|---------|--------|
| `enableWorldGenOreCopper` | true | Copper ore spawning |
| `enableWorldGenOreSilver` | true | Silver ore spawning |
| `enableWorldGenOreTin` | true | Tin ore spawning |
| `enableWorldGenOreUranium` | true | Uranium ore spawning |
| `enableWorldGenTreeRubber` | true | Rubber tree generation |
| `oreDensityFactor` | 1.0 | Multiplier for ore frequency |

---

## Balance Recommendations for EnergyCraft

### Category: Power Balance

#### 1. RF/EU Conversion Ratio
```properties
# Current
I:RFPerEU=8

# Recommendation: KEEP AS-IS
# 8 RF per EU is standard. Our design doc says 1 EU = 2.5 RF
# This is handled by Energy Converters mod, not IC2 internal
```

**Rationale:** The IC2 internal RF conversion is separate from our Energy Converters setup. Leave at default.

#### 2. UU-Matter Production
```properties
# Current
D:EUPerUU=1.0
B:UUNeedsScrap=false

# Recommendation: Consider enabling scrap requirement
B:UUNeedsScrap=true

# Alternative: Increase EU cost
D:EUPerUU=1.5
```

**Rationale:** UU-Matter is extremely powerful. Requiring scrap adds meaningful resource management. The 1.5x EU cost is a gentler nerf if we want to keep it scrap-free.

### Category: Progression Gating

#### 3. Hard Enriched Uranium
```properties
# Current
B:enableHardEnrichedUran=false

# Recommendation: Enable for harder nuclear progression
B:enableHardEnrichedUran=true
```

**Rationale:** Nuclear power should be late-game. Harder uranium processing gates it behind more infrastructure. This aligns with Era V (Nuclear Era) being mid-late game.

#### 4. Bronze Tools
```properties
# Current
B:disableBronzeTools=false

# Recommendation: KEEP AS-IS
```

**Rationale:** Bronze tools are a valid early-game option before iron. They support our Bronze Age (Era II) progression.

### Category: Difficulty Tuning

#### 5. Crop Difficulty
```properties
# Current (0=Very Easy, 1=Easy, 2=Normal, 3=Hard)
I:cropDifficulty=2

# Recommendation: KEEP AS-IS
```

**Rationale:** Normal difficulty is appropriate. Crops aren't a core progression mechanic but shouldn't be trivial.

#### 6. Electric Armor Balance
```properties
# Current
D:electricSuitAbsorbtionScale=1.0
D:electricSuitEnergyCostModifier=1.0

# Recommendation: KEEP AS-IS
```

**Rationale:** Quantum suit is powerful but requires significant infrastructure. Default balance is fine.

### Category: World Generation

#### 7. Ore Density
```properties
# Current
D:oreDensityFactor=1.0

# Recommendation: KEEP AS-IS
```

**Rationale:** 1.0 density works well. We have ore doubling through macerators as progression reward.

#### 8. Rubber Tree Generation
```properties
# Current
B:enableWorldGenTreeRubber=true

# Recommendation: KEEP AS-IS
```

**Rationale:** Rubber is essential for IC2 progression. Trees must generate naturally.

### Category: Safety/QoL

#### 9. Energy Burn (Fire from cables)
```properties
# Current
D:enableEnergyBurn=0.0

# Recommendation: KEEP AT 0
```

**Rationale:** Random fires from cable overload are frustrating, not fun. Keep disabled.

#### 10. Easy Mode
```properties
# Current
B:enableIC2EasyMode=false

# Recommendation: KEEP FALSE
```

**Rationale:** Machine explosions and cable melting are part of the IC2 learning experience. They're avoidable with proper design.

---

## Machine Recipe Configuration

### File: `ic2machineRecipes.json`

This file controls which recipes are enabled for IC2 machines. Current state shows integration with:
- **Draconic Evolution:** Draconium dust in macerator
- **Railcraft:** Sulfur and saltpeter dust
- **Project Red:** Electrotine dust

**No changes recommended** - integration looks good.

### File: `ic2craftingRecipes.json`

Controls crafting recipe enablement. Review needed if we add CraftTweaker overrides.

---

## Integration Points

### Current Plugin Status (`plugins {}`)
```properties
B:buildcraft=true   # ✓ Essential
B:forestry=true     # ✓ Essential  
B:jei=true          # ✓ Essential
B:telecompat=true   # ✓ Useful
```

All integrations enabled - good!

---

## Recommended Configuration Changes

### High Priority (Implement Now)

| Setting | Current | Recommended | File |
|---------|---------|-------------|------|
| `UUNeedsScrap` | false | **true** | ic2.cfg |

### Medium Priority (Playtest First)

| Setting | Current | Recommended | Rationale |
|---------|---------|-------------|-----------|
| `enableHardEnrichedUran` | false | true | Gates nuclear to late-game |
| `EUPerUU` | 1.0 | 1.25-1.5 | If UU feels too easy |

### Low Priority (Keep Defaults)

All other settings are well-balanced for EnergyCraft's vision.

---

## Handoff to Integrator

### Immediate Actions
1. **Edit `config/ic2/ic2.cfg`:**
   ```properties
   B:UUNeedsScrap=true
   ```

2. **Optional (discuss with team):**
   ```properties
   B:enableHardEnrichedUran=true
   ```

### Testing Checklist
- [ ] Verify Mass Fabricator requires scrap after change
- [ ] Test UU-Matter production rate feels balanced
- [ ] If enabling hard uranium, test enrichment process
- [ ] Confirm all IC2 machines still craftable
- [ ] Check JEI shows correct recipes

### Future Considerations
- Monitor if players skip IC2 for other power sources
- Consider generator output tweaks if power feels too easy
- Evaluate if reactor explosions should be buffed/nerfed

---

## Appendix: Full ic2.cfg Structure

```
ic2.cfg
├── balance {}
│   ├── EUPerUU (float)
│   ├── RFPerEU (int)
│   ├── UUNeedsScrap (bool)
│   ├── cropDifficulty (0-3)
│   ├── electricSuitAbsorbtionScale (float)
│   ├── electricSuitEnergyCostModifier (float)
│   └── energyGenerator* (various)
├── client {}
│   ├── cropRenderMode
│   └── enableKeysInGuis
├── crafting {}
│   ├── disableBronzeTools
│   ├── enableCrafting* (various)
│   ├── enableSteelRecipes
│   └── recyclerBlacklist
├── features {}
│   ├── enableEnergyBurn
│   ├── enableHardEnrichedUran
│   ├── enableIC2EasyMode
│   ├── enableInfiniteNetherLava
│   └── ... (many more)
├── plugins {}
│   ├── buildcraft, forestry, jei, telecompat
├── sounds {}
│   └── volume settings
├── world {}
│   ├── explosionPower*
│   └── wind settings
└── worldgen {}
    ├── enableWorldGenOre*
    ├── enableWorldGenTreeRubber
    └── oreDensityFactor
```

---

*Research completed by Curator Agent*  
*Ready for Integrator implementation*
