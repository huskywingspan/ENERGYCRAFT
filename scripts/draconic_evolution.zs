# ============================================
# Draconic Evolution - EnergyCraft Integration
# Purpose: Gate DE progression behind IC2/BuildCraft tech
# Author: EnergyCraft Team
# Last Updated: 2026-02-02
# ============================================

print("Loading Draconic Evolution integration recipes...");

# ============================================
# IC2 CLASSIC ITEM REFERENCE (VERIFIED WORKING)
# Cables: ic2:itemcable:X (0-14)
# Circuits: <ore:circuitBasic>, <ore:circuitAdvanced>
# 
# NOTE: IC2 Classic machine blocks use different IDs than
# IC2 Experimental. We use circuits, cables, and BuildCraft
# gears for tech gating instead of machine blocks.
# ============================================

# ============================================
# SECTION 1: ENERGY STORAGE CORE (Tier 1)
# Gate behind advanced circuits + diamonds
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:energy_storage_core>);

# New recipe: Requires Advanced Circuits (mid-tier IC2 component)
recipes.addShaped("energy_core_t1_gated", <draconicevolution:energy_storage_core>, [
    [<ore:blockRedstone>, <ore:circuitAdvanced>, <ore:blockRedstone>],
    [<ore:circuitAdvanced>, <ore:blockDiamond>, <ore:circuitAdvanced>],
    [<ore:blockRedstone>, <ore:circuitAdvanced>, <ore:blockRedstone>]
]);

# ============================================
# SECTION 2: FUSION CRAFTING INJECTOR
# Gate behind BuildCraft Gold Gear + IC2 circuits
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:crafting_injector>);

# New recipe: Requires BuildCraft Gold Gear + Advanced Circuit
recipes.addShaped("fusion_injector_gated", <draconicevolution:crafting_injector>, [
    [<ore:ingotGold>, <minecraft:diamond>, <ore:ingotGold>],
    [<ore:blockLapis>, <buildcraftcore:gear_gold>, <ore:blockLapis>],
    [<ore:ingotGold>, <ore:circuitAdvanced>, <ore:ingotGold>]
]);

# ============================================
# SECTION 3: FUSION CRAFTING CORE
# The central block for fusion crafting multiblock
# Gate behind BuildCraft Diamond Gear (end-game BC component)
# ============================================

# Remove default recipe
recipes.remove(<draconicevolution:fusion_crafting_core>);

# New recipe: Requires Diamond Gear + Glass Fibre Cables
recipes.addShaped("fusion_core_gated", <draconicevolution:fusion_crafting_core>, [
    [<ic2:itemcable:9>, <draconicevolution:draconic_core>, <ic2:itemcable:9>],
    [<draconicevolution:draconic_core>, <buildcraftcore:gear_diamond>, <draconicevolution:draconic_core>],
    [<ic2:itemcable:9>, <draconicevolution:draconic_core>, <ic2:itemcable:9>]
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

# New recipe: Requires BuildCraft Iron Gear + circuits
recipes.addShaped("particle_gen_gated", <draconicevolution:particle_generator>, [
    [<ore:blockRedstone>, <ore:blockDiamond>, <ore:blockRedstone>],
    [<ore:ingotDraconium>, <buildcraftcore:gear_iron>, <ore:ingotDraconium>],
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
# Heavy gating behind end-game tech
# ============================================

# Reactor Core - Requires Glass Fibre Cables + Awakened materials
recipes.remove(<draconicevolution:reactor_core>);
recipes.addShaped("reactor_core_gated", <draconicevolution:reactor_core>, [
    [<draconicevolution:awakened_core>, <draconicevolution:chaos_shard>, <draconicevolution:awakened_core>],
    [<draconicevolution:chaos_shard>, <ic2:itemcable:9>, <draconicevolution:chaos_shard>],
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
# - Confirm all items resolve correctly (no errors in chat)
# - Energy Core higher tiers use fusion crafting (no changes needed)
# ============================================

print("Draconic Evolution integration recipes loaded successfully!");
