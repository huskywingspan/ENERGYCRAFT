# 🔧 Integrator Handoff: Draconic Evolution Integration

## Project Onboarding

You are the **Integrator** for **EnergyCraft**, a Minecraft 1.12.2 modpack. Before starting, read these files to understand the project:

1. **`VISION_ENERGYCRAFT.md`** - Core goals and design pillars
2. **`DESIGN_DOCUMENT.md`** - Technical specifications and energy ratios
3. **`PROJECT_PLAN.md`** - Current phase and task list
4. **`.github/copilot-instructions.md`** - Project conventions
5. **`research/draconic_evolution_evaluation.md`** - Curator research on this mod

Your agent definition is at `.github/agents/integrator.md`.

---

## Task: Integrate Draconic Evolution

**Curator Research Complete.** Implement Draconic Evolution as our end-game power sink and boss content.

### Step 1: Download Mods

Download to `mods/` folder:
- **Draconic Evolution** - 1.12.2 version from CurseForge
- **Brandon's Core** - Required dependency

### Step 2: Generate & Configure

Launch game once to generate configs, then modify `config/draconicevolution.cfg`:

```cfg
# DISABLE these features (too OP for our progression):
B:mobGrinder=false
B:dislocatorPedestal=false          # If available
I:dragonHealthMultiplier=3          # Make Chaos Guardian harder

# Armor tweaks (prevent mining speed exploit):
B:armorMiningSpeedIncrease=false    # If available, otherwise note for CraftTweaker
```

### Step 3: CraftTweaker Recipes

Create `scripts/draconic_evolution.zs`:

**Tier 1 Energy Core** - Gate behind IC2 progression:
```zs
// Requires: Advanced Machine Casings (IC2 Classic) + Diamonds + Redstone Blocks
recipes.remove(<draconicevolution:energy_storage_core>);
recipes.addShaped("energy_core_t1", <draconicevolution:energy_storage_core>, [
    [<ore:blockRedstone>, <ic2:blockmachine:12>, <ore:blockRedstone>],
    [<ic2:blockmachine:12>, <ore:gemDiamond>, <ic2:blockmachine:12>],
    [<ore:blockRedstone>, <ic2:blockmachine:12>, <ore:blockRedstone>]
]);
```

**Tier 2+ Energy Cores** - Gate behind BuildCraft:
```zs
// Requires Combustion Engines (BuildCraft) for higher tiers
// Research the exact recipes for tiers 2-7 and implement similar gating
```

**Fusion Crafting Injectors** - Mixed tech requirement:
```zs
// Require: MV Transformer (IC2) + Gold + Lapis
recipes.remove(<draconicevolution:crafting_injector>);
recipes.addShaped("fusion_injector", <draconicevolution:crafting_injector>, [
    [<ore:ingotGold>, <minecraft:diamond>, <ore:ingotGold>],
    [<ore:blockLapis>, <ic2:blockmachine:5>, <ore:blockLapis>],
    [<ore:ingotGold>, <ore:blockRedstone>, <ore:ingotGold>]
]);
```

### Step 4: EMC Values

Add to `config/ProjectE/custom_emc.json`:

```json
{
  "draconicevolution:draconium_ore": 8192,
  "draconicevolution:draconium_ingot": 8192,
  "draconicevolution:draconium_block": 73728,
  "draconicevolution:dragon_heart": 1000000,
  "draconicevolution:chaos_shard": null,
  "draconicevolution:awakened_draconium_ingot": null,
  "draconicevolution:draconic_ingot": null
}
```

**Rationale:** Dragon Hearts have EMC (boss reward), but Chaos Shards and awakened materials have NO EMC to prevent exploits.

### Step 5: Feature Status

| Feature | Status | Notes |
|---------|--------|-------|
| Energy Core (all tiers) | ✅ ENABLE | Primary power sink - this is why we're adding DE |
| Fusion Crafting | ✅ ENABLE | "Forge of Creation" - our end-game crafting |
| Draconic Reactor | ✅ ENABLE | Risk/reward power gen |
| Chaos Guardian | ✅ ENABLE | End-game boss, increase health |
| Dislocators | ✅ ENABLE | Quality of life teleportation |
| Mob Grinder | ❌ DISABLE | Breaks mob farm progression |
| Draconic Armor | ⚠️ GATE | Consider recipe changes or disable |
| Awakened Tier | ⚠️ GATE | Require Chaos Guardian kill |

### Step 6: Update Documentation

1. Update `CHANGELOG.md` with:
   - Draconic Evolution added
   - Config changes made
   - Recipe modifications
   - EMC assignments

2. Commit changes:
```
git add .
git commit -m "feat: Integrate Draconic Evolution

- Added Draconic Evolution + Brandon's Core
- Disabled mob grinder (balance)
- Gated Energy Cores behind IC2/BC progression
- Custom fusion injector recipe
- EMC values: Dragon Heart=1M, Chaos Shard=NO EMC
- Increased Chaos Guardian health 3x"
```

---

## Success Criteria

- [ ] Game launches with DE installed
- [ ] Mob Grinder disabled in config
- [ ] Energy Core recipe requires IC2 components
- [ ] Fusion Injector recipe requires IC2 transformer
- [ ] EMC values set correctly
- [ ] CHANGELOG updated
- [ ] Changes committed to git

---

**Reference:** Full research at `research/draconic_evolution_evaluation.md`
