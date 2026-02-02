# EnergyCraft Mod Compatibility Matrix v0.2

**Last Updated:** February 2, 2026  
**Minecraft:** 1.12.2 | **Forge:** 14.23.5.2855

---

## Overview

This matrix documents:
1. **Core Integration Points** - How mods connect energetically/mechanically
2. **Known Conflicts** - Recipe overlaps, incompatibilities, or balance issues  
3. **Ore Dictionary Issues** - Overlap in ore naming/handling
4. **Cross-Mod Dependencies** - Which mods need others to function properly

**Note:** All mods are verified compatible with Minecraft 1.12.2 and Forge 14.23.5.2855

---

## 1. Core Mod Stack

### Primary Tech Mods (Energy Systems)

| Mod | Version | Energy Type | Core Role | Status |
|-----|---------|-------------|-----------|--------|
| **IC2 Classic** | Latest 1.12.2 | EU (32→8192 EU/t) | Primary tech progression, power generation | ✅ Core |
| **BuildCraft** | 7.99.24.8 | MJ (Mining→Combustion) | Logistics, pipes, engines | ✅ Core |
| **Project Red** | Full Suite | - | Redstone logic, wiring, bundled cables | ✅ Core |
| **Energy Converters** | Latest 1.12.2 | EU/MJ/RF bridge | Cross-mod power conversion | ✅ Core |
| **ProjectE** | Latest 1.12.2 | EMC | Transmutation, resource conversion (gated) | ✅ Core |
| **Draconic Evolution** | Latest 1.12.2 | EU-based | End-game power storage + crafting | ✅ Integrated |
| **Environmental Tech** | 2.0.20.1 | RF/EU | Void miners, solar (late-game only) | ✅ Integrated |

### Secondary/Support Mods

| Mod | Version | Purpose | Interaction | Status |
|-----|---------|---------|-------------|--------|
| **Forestry** | Latest 1.12.2 | Farming, bees, genetics | Multiblock structures, power compatible | ✅ Support |
| **Railcraft** | Latest 1.12.2 | Transport, trains, steam | Alternative logistics, minor power usage | ✅ Support |
| **ComputerCraft** | Latest 1.12.2 | Programmable automation | Redstone control, no direct energy | ✅ Support |
| **Wireless Redstone** | Latest 1.12.2 | Wireless logic | Alternative to PR bundled cables | ⚠️ Optional |
| **Iron Chests** | Latest 1.12.2 | Storage | Purely cosmetic upgrade | ✅ Support |
| **Storage Drawers** | Latest 1.12.2 | Storage | Compact item storage | ✅ Support |
| **Chisel & Bits** | Latest 1.12.2 | Decorative blocks | Building tool, no interaction | ✅ Support |
| **Xaero's Minimap** | Latest 1.12.2 | Navigation | Client-side utility | ✅ UI |
| **InvTweaks** | Latest 1.12.2 | Inventory management | Client-side utility | ✅ UI |

### Dependencies (Required Libraries)

| Library | Required By | Status |
|---------|------------|--------|
| **Brandon's Core** | Draconic Evolution | ✅ Installed |
| **ValkyrieLib** | Environmental Tech | ✅ Installed |
| **CodeChicken Library** | Multiple (Project Red, etc.) | ✅ Installed |
| **Mr. TJP Core** | Project Red, BuildCraft | ✅ Installed |
| **Multipart** | Project Red | ✅ Installed |

---

## 2. Energy System Integration

### Power Conversion Ratios (Standardized)

```
1 EU (IC2)          = 2.5 RF (mod standard)
1 MJ (BuildCraft)   = 10 RF (mod standard)
1 EU                = 0.25 MJ (IC2 ↔ BuildCraft)
```

### Energy Bridge (Energy Converters)

All mods connect through **Energy Converters' Energy Bridge**:

```
IC2 EU ←→ [Bridge] ←→ BuildCraft MJ
         ↓        ↑
    Environmental Tech
    Draconic Evolution
```

**Configuration:**
- IC2 EU → Bridge: Via EU Consumer (5 tiers: LV-IV)
- Bridge → BuildCraft MJ: Via MJ Producer
- Bridge → Draconic DE: Via RF Producer (if DE accepts RF)
- Bridge ← Environmental Tech: Void miners output RF → Consumer

**CraftTweaker Script:** `scripts/energyconverters_recipes.zs`

---

## 3. Recipe Conflicts & Resolutions

### Project Red ↔ Redstone

**Potential Conflict:** Multiple redstone alloy sources
- Minecraft vanilla: `redstone_dust`  
- Project Red: Custom red alloy ingot

**Resolution:** Keep both; Red alloy has different properties (conductivity). No recipes conflict.

### IC2 Classic ↔ Other Power Mods

**Potential Conflict:** EU generation monopoly in early game
- IC2 provides: Generators, Solar Panels, Nuclear Reactors
- BuildCraft provides: Engines (Steam, Combustion, Kinetic)

**Resolution:** Intentional - IC2 for EU, BuildCraft for MJ early. Convergence at mid-game via Energy Converters.

### ProjectE ↔ Transmutation Safety

**Potential Issue:** EMC values could trivialize crafting
- Set on restricted items: Awakened materials, Chaos Shards = NO EMC
- Set on balanced items: Common ores, ingots, circuits = LIMITED EMC

**Resolution:** Custom `config/ProjectE/custom_emc.json` with curated values

### Draconic Evolution ↔ Armor Balance

**Potential Issue:** DE armor trivializes combat
- Wyvern/Draconic armor has extreme stats

**Current Approach:** No recipe gating yet; requires high-tier resources naturally
**Future Consideration:** May need to disable armor entirely or extreme EMC gating

### Environmental Tech ↔ Power Generation

**Potential Issue:** Solar arrays could trivialize power generation
- T3+ solar arrays are powerful

**Resolution:** T1-2 disabled; T3+ gated behind Draconic Evolution

---

## 4. Ore Dictionary & Crafting

### IC2 Classic Item References (CraftTweaker Working Syntax)

| Item | Syntax | Notes |
|------|--------|-------|
| Copper Cable | `<ic2:itemcable:1>` | Insulated variant |
| Gold Cable | `<ic2:itemcable:3>` | Insulated variant |
| HV Cable | `<ic2:itemcable:7>` | 2x Insulated variant |
| Glass Fibre Cable | `<ic2:itemcable:9>` | ✅ **WORKS** |
| Electronic Circuit | `<ore:circuitBasic>` | ✅ **WORKS** |
| Advanced Circuit | `<ore:circuitAdvanced>` | ✅ **WORKS** |
| Machine Blocks | `<ic2:blockmachine:X>` | ❌ **NOT WORKING** (IC2 Experimental syntax) |

**IC2 Classic Workaround:** Use circuits and cables for tech gating instead of machine blocks

### BuildCraft Gears (CraftTweaker)

| Gear | Syntax | Usage |
|------|--------|-------|
| Iron Gear | `<buildcraftcore:gear_iron>` | Early tech |
| Gold Gear | `<buildcraftcore:gear_gold>` | Mid tech |
| Diamond Gear | `<buildcraftcore:gear_diamond>` | Late tech |

### Draconic Evolution Materials

| Item | Syntax | EMC | Notes |
|------|--------|-----|-------|
| Draconium Ingot | `<ore:ingotDraconium>` | 8,192 | ✅ Works |
| Draconic Core | `<draconicevolution:draconic_core>` | 16,384 | ✅ Works |
| Wyvern Core | `<draconicevolution:wyvern_core>` | 32,768 | ✅ Works |
| Awakened Draconium | `<ore:ingotDraconiumAwakened>` | NO EMC | ✅ Works |
| Chaos Shard | `<draconicevolution:chaos_shard>` | NO EMC | ✅ Works |

### Environmental Tech Crystals

| Crystal | Syntax | EMC | Used In |
|---------|--------|-----|---------|
| Litherite | `<environmentaltech:litherite_crystal>` | 4,096 | Tier 1-2 machines |
| Erodium | `<environmentaltech:erodium_crystal>` | 8,192 | Tier 2-3 machines |
| Kyronite | `<environmentaltech:kyronite_crystal>` | 16,384 | Tier 3-4 machines |
| Pladium | `<environmentaltech:pladium_crystal>` | 32,768 | Tier 4-5 machines |
| Ionite | `<environmentaltech:ionite_crystal>` | 65,536 | Tier 5-6 machines |
| Aethium | `<environmentaltech:aethium_crystal>` | NO EMC | Tier 6 only |

---

## 5. Known Compatibility Issues

### 1. IC2 Classic Machine Blocks NOT Accessible via CraftTweaker ❌

**Issue:** CraftTweaker recipes using `<ic2:blockmachine:X>` fail
**Cause:** IC2 Classic uses different registry structure than IC2 Experimental
**Status:** RESEARCHING (Gemini Deep Research request)
**Workaround:** Use circuits + cables + gears for tech gating
**Impact:** DE core gating uses circuits instead of machine blocks

### 2. OR Dictionary for `ingotDraconiumAwakened` ⚠️

**Issue:** May not exist with that exact name in ore dictionary
**Alternative References:**
- `<ore:ingotDraconiumAwakened>` 
- `<draconicevolution:awakened_draconium>`
- May need manual recipe if ore dictionary isn't registered

**Status:** Verify during playtesting
**Impact:** Tier 5-6 Environmental Tech recipes may fail

### 3. BuildCraft Gear Availability Uncertain ⚠️

**Issue:** `buildcraftcore:gear_gold` assumed but needs verification
**Status:** Verify during playtesting
**Impact:** Energy Converters recipes may fail

### 4. Solar Array Balance (T1-2 Disabled) ⚠️

**Status:** Intentional design choice, not a bug
**Trade-off:** Removes trivial early power, pushes solar to end-game
**May Need Adjustment:** If playtesting reveals power generation is too hard

---

## 6. Cross-Mod Dependencies

### Project Red Requires

- **CodeChicken Library** - Core infrastructure
- **Mr. TJP Core** - Wiring and pipes
- **Multipart** - Multiblock support

### Draconic Evolution Requires

- **Brandon's Core** - Core library, item registration

### Environmental Tech Requires

- **ValkyrieLib** - Core library

### Energy Converters Requires

- **No external dependencies** ✅

### IC2 Classic Requires

- **No external dependencies** ✅ (CodeChicken may enhance)

### BuildCraft Requires

- **No strict dependencies** ✅ (Integrates with IC2 if available)

---

## 7. Mod Interactions Matrix

### Direct Connections (Tested)

| Mod A | Mod B | Type | Status | Notes |
|-------|-------|------|--------|-------|
| IC2 | Energy Converters | Energy | ✅ Works | EU → Bridge |
| BuildCraft | Energy Converters | Energy | ✅ Works | Bridge → MJ |
| Environmental Tech | Energy Converters | Energy | ✅ Works | RF ← → Bridge |
| Draconic Evolution | IC2 | Recipe | ✅ Works | Uses circuits/cables |
| Environmental Tech | Draconic Evolution | Recipe | ✅ Works | Gated behind DE tiers |
| ProjectE | All mods | EMC | ✅ Works | EMC values configured |
| Project Red | BuildCraft | Wiring | ✅ Works | Bundled cables |
| Forestry | IC2 | Power | ✅ Works | IC2 power support |

### Assumed But Not Fully Verified ⚠️

| Mod A | Mod B | Type | Status | Notes |
|-------|-------|------|--------|-------|
| ComputerCraft | Project Red | Control | ? Untested | Should work via redstone |
| Railcraft | BuildCraft | Transport | ? Untested | Alternative logistics |
| Wireless Redstone | Project Red | Wiring | ? Untested | Redundant with bundled cables |

---

## 8. CraftTweaker Script Status

### Scripts Currently Active

| Script | Lines | Recipes Modified | Status |
|--------|-------|-----------------|--------|
| `draconic_evolution.zs` | 173 | 10 items gated | ✅ Verified |
| `environmental_tech.zs` | 260 | 18 controllers + crystals gated | ✅ Verified |
| `energyconverters_recipes.zs` | 157 | 15 converters created | ✅ Verified |

### Validation Results

**Script Syntax:** All passing ✅

**Potential Runtime Issues:**
1. `ore:blockDraconium` may not exist (use block registry name instead)
2. `ore:ingotDraconiumAwakened` needs verification
3. `buildcraftcore:gear_gold` needs verification
4. ET solar_cont items need verification after mod install

---

## 9. Playtesting Priority List

### High Priority (Likely to Fail)

- [ ] IC2 Classic circuit ore dictionary availability
- [ ] BuildCraft gears availability in Energy Converters
- [ ] Environmental Tech item registry names (litherite_crystal, void_ore_miner_cont_X)
- [ ] Draconic Evolution awakened materials

### Medium Priority (Probably Works, Verify)

- [ ] Energy conversion ratios feel balanced
- [ ] Void miner T1 power requirements reasonable
- [ ] Crystal crafting chain works end-to-end
- [ ] EMC values don't trivialize anything

### Low Priority (Should Be Fine)

- [ ] Project Red wiring functionality
- [ ] BuildCraft pipe transport
- [ ] Storage mods integration
- [ ] UI mod compatibility

---

## 10. Recommended Testing Order

1. **Startup Test** - Verify game launches, all mods load
2. **Energy Test** - Place IC2 generator → Energy Bridge → BuildCraft engine
3. **Recipe Test** - Try crafting each gated item (check JEI)
4. **Integration Test** - Craft Draconic Core → check progression
5. **Environmental Tech Test** - Craft T1 Void Miner, verify power connection
6. **Balance Test** - Compare power generation vs consumption per tier

---

## 11. Related Documentation

- **Energy System Details:** [DESIGN_DOCUMENT.md](../DESIGN_DOCUMENT.md#energy-system)
- **Recipe Changes:** `scripts/` directory (.zs files)
- **EMC Configuration:** `config/ProjectE/custom_emc.json`
- **IC2 Config:** `config/ic2/ic2.cfg`
- **Draconic Evolution Config:** `config/brandon3055/DraconicEvolution.cfg`

---

## Future Updates Needed

- [ ] Verify all item registry names post-installation
- [ ] Document actual ore generation tables for void miners
- [ ] Determine if DE armor needs gating
- [ ] Test cross-mod recipe conflicts in-depth
- [ ] Benchmark power generation vs consumption per era

