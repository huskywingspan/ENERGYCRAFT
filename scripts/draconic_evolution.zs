# ============================================
# Draconic Evolution - EnergyCraft Integration
# Purpose: Gate DE progression behind IC2/BuildCraft tech
# Author: EnergyCraft Team
# Last Updated: 2026-02-02
# ============================================

print("Loading Draconic Evolution integration recipes...");

# ============================================
# IC2 CLASSIC MACHINE BLOCK REFERENCE
# ic2:blockmachine:0  = Machine (Basic)
# ic2:blockmachine:1  = Macerator
# ic2:blockmachine:2  = Extractor
# ic2:blockmachine:3  = Compressor
# ic2:blockmachine:4  = Electric Furnace
# ic2:blockmachine:5  = MV Transformer
# ic2:blockmachine:6  = HV Transformer
# ic2:blockmachine:7  = EV Transformer
# ic2:blockmachine:12 = Advanced Machine Casing
# ============================================

# ============================================
# SECTION 1: ENERGY STORAGE CORE (Tier 1)
# Gate behind IC2 Classic progression
# Requires: Advanced Machine Casings + Diamonds
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:energy_storage_core>);

# New recipe: Requires IC2 Classic Advanced Machine Casings
recipes.addShaped("energy_core_t1_gated", <draconicevolution:energy_storage_core>, [
    [<ore:blockRedstone>, <ic2:blockmachine:12>, <ore:blockRedstone>],
    [<ic2:blockmachine:12>, <ore:gemDiamond>, <ic2:blockmachine:12>],
    [<ore:blockRedstone>, <ic2:blockmachine:12>, <ore:blockRedstone>]
]);

# ============================================
# SECTION 2: FUSION CRAFTING INJECTOR
# Gate behind IC2 transformers for cross-mod synergy
# Requires: MV Transformer + Lapis + Gold
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:crafting_injector>);

# New recipe: Requires IC2 MV Transformer (mid-tier gating)
recipes.addShaped("fusion_injector_gated", <draconicevolution:crafting_injector>, [
    [<ore:ingotGold>, <minecraft:diamond>, <ore:ingotGold>],
    [<ore:blockLapis>, <ic2:blockmachine:5>, <ore:blockLapis>],
    [<ore:ingotGold>, <ore:blockRedstone>, <ore:ingotGold>]
]);

# ============================================
# SECTION 3: FUSION CRAFTING CORE
# The central block for fusion crafting multiblock
# Gate behind HV infrastructure
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:fusion_crafting_core>);

# New recipe: Requires HV Transformer for end-game gating
recipes.addShaped("fusion_core_gated", <draconicevolution:fusion_crafting_core>, [
    [<ore:blockDiamond>, <draconicevolution:draconic_core>, <ore:blockDiamond>],
    [<draconicevolution:draconic_core>, <ic2:blockmachine:6>, <draconicevolution:draconic_core>],
    [<ore:blockDiamond>, <draconicevolution:draconic_core>, <ore:blockDiamond>]
]);

# ============================================
# SECTION 4: DRACONIC CORE
# The basic crafting component - add tech requirement
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:draconic_core>);

# New recipe: Requires Electronic Circuit (IC2 Classic)
recipes.addShaped("draconic_core_gated", <draconicevolution:draconic_core>, [
    [<ore:ingotDraconium>, <ore:ingotGold>, <ore:ingotDraconium>],
    [<ore:ingotGold>, <ore:circuitBasic>, <ore:ingotGold>],
    [<ore:ingotDraconium>, <ore:ingotGold>, <ore:ingotDraconium>]
]);

# ============================================
# SECTION 5: WYVERN CORE
# Mid-tier crafting component - Advanced Circuit required
# ============================================

# Remove default recipe  
recipes.remove(<draconicevolution:wyvern_core>);

# New recipe: Requires Advanced Circuit (IC2 Classic)
recipes.addShaped("wyvern_core_gated", <draconicevolution:wyvern_core>, [
    [<ore:ingotDraconium>, <minecraft:nether_star>, <ore:ingotDraconium>],
    [<draconicevolution:draconic_core>, <ore:circuitAdvanced>, <draconicevolution:draconic_core>],
    [<ore:ingotDraconium>, <draconicevolution:draconic_core>, <ore:ingotDraconium>]
]);

# ============================================
# SECTION 6: ENERGY PYLON
# Power input/output for multiblock structures
# Gate behind BuildCraft for cross-mod integration
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:energy_pylon>);

# New recipe: Requires BuildCraft Diamond Gear
recipes.addShaped("energy_pylon_gated", <draconicevolution:energy_pylon>, [
    [<minecraft:ender_eye>, <draconicevolution:draconic_core>, <minecraft:ender_eye>],
    [<ore:ingotDraconium>, <buildcraftcore:gear_diamond>, <ore:ingotDraconium>],
    [<ore:blockRedstone>, <draconicevolution:draconic_core>, <ore:blockRedstone>]
]);

# ============================================
# SECTION 7: PARTICLE GENERATOR
# Power source component for energy core
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:particle_generator>);

# New recipe: Requires IC2 Machine Casing
recipes.addShaped("particle_gen_gated", <draconicevolution:particle_generator>, [
    [<ore:blockRedstone>, <ore:blockDiamond>, <ore:blockRedstone>],
    [<ore:ingotDraconium>, <ic2:blockmachine:0>, <ore:ingotDraconium>],
    [<ore:blockRedstone>, <draconicevolution:draconic_core>, <ore:blockRedstone>]
]);

# ============================================
# SECTION 8: DISLOCATOR (Teleportation)
# Keep accessible but require basic tech
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:dislocator>);

# New recipe: Basic tech gate
recipes.addShaped("dislocator_gated", <draconicevolution:dislocator>, [
    [<ore:dustBlaze>, <minecraft:ender_pearl>, <ore:dustBlaze>],
    [<minecraft:ender_pearl>, <ore:circuitBasic>, <minecraft:ender_pearl>],
    [<ore:dustBlaze>, <minecraft:ender_pearl>, <ore:dustBlaze>]
]);

# ============================================
# SECTION 9: REACTOR COMPONENTS
# Draconic Reactor - Dangerous end-game power
# Heavy gating behind EV-tier tech
# ============================================

# Reactor Core - Requires EV Transformer
recipes.remove(<draconicevolution:reactor_core>);
recipes.addShaped("reactor_core_gated", <draconicevolution:reactor_core>, [
    [<draconicevolution:awakened_core>, <draconicevolution:chaos_shard>, <draconicevolution:awakened_core>],
    [<draconicevolution:chaos_shard>, <ic2:blockmachine:7>, <draconicevolution:chaos_shard>],
    [<draconicevolution:awakened_core>, <draconicevolution:chaos_shard>, <draconicevolution:awakened_core>]
]);

# Reactor Stabilizer - Requires Glass Fibre Cable
recipes.remove(<draconicevolution:reactor_part>);
recipes.addShaped("reactor_stabilizer_gated", <draconicevolution:reactor_part>, [
    [<ore:ingotDraconium>, <ic2:itemcable:9>, <ore:ingotDraconium>],
    [<ic2:itemcable:9>, <draconicevolution:awakened_core>, <ic2:itemcable:9>],
    [<ore:ingotDraconium>, <ic2:itemcable:9>, <ore:ingotDraconium>]
]);

# ============================================
# NOTES FOR BALANCER AGENT:
# - Test all recipes with JEI
# - Verify ore dictionary entries exist for draconium
# - Check IC2 machine block metadata is correct
# - Confirm reactor recipes match available materials
# - Energy Core higher tiers use fusion crafting (no changes needed)
# ============================================

print("Draconic Evolution integration recipes loaded successfully!");
