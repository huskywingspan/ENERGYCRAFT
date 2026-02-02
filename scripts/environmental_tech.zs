# ============================================
# Environmental Tech - EnergyCraft Integration
# Purpose: Gate void miners behind late-game tech progression
# Author: EnergyCraft Team
# Last Updated: 2026-02-02
# ============================================

print("Loading Environmental Tech integration recipes...");

# ============================================
# ENVIRONMENTAL TECH PROGRESSION STRATEGY
# 
# Tier 1-2: Post-IC2 HV (Era V-VI)
#   - Requires IC2 Advanced Circuits
#   - Requires BuildCraft components
#   - Accessible after establishing nuclear power
#
# Tier 3-4: Draconic Era (Era VII)
#   - Requires Draconium components
#   - Requires Draconic Cores
#   - Major infrastructure investment
#
# Tier 5-6: End-Game (Era VIII)
#   - Requires Awakened Draconium
#   - Requires Chaos Shards (T6)
#   - Ultimate power sink goals
# ============================================

# ============================================
# SECTION 1: VOID ORE MINER CONTROLLERS
# The main power sink - extract ores from the void
# ============================================

# --- Tier 1: Entry level void mining ---
# Gate behind IC2 HV infrastructure
recipes.remove(<environmentaltech:void_ore_miner_cont_1>);
recipes.addShaped("et_void_miner_t1", <environmentaltech:void_ore_miner_cont_1>, [
    [<ore:circuitAdvanced>, <environmentaltech:litherite_crystal>, <ore:circuitAdvanced>],
    [<environmentaltech:litherite_crystal>, <buildcraftcore:gear_diamond>, <environmentaltech:litherite_crystal>],
    [<ore:circuitAdvanced>, <ic2:itemcable:9>, <ore:circuitAdvanced>]
]);

# --- Tier 2: Improved void mining ---
recipes.remove(<environmentaltech:void_ore_miner_cont_2>);
recipes.addShaped("et_void_miner_t2", <environmentaltech:void_ore_miner_cont_2>, [
    [<environmentaltech:erodium_crystal>, <ore:circuitAdvanced>, <environmentaltech:erodium_crystal>],
    [<ore:circuitAdvanced>, <environmentaltech:void_ore_miner_cont_1>, <ore:circuitAdvanced>],
    [<environmentaltech:erodium_crystal>, <ore:blockDiamond>, <environmentaltech:erodium_crystal>]
]);

# --- Tier 3: Draconium-gated ---
recipes.remove(<environmentaltech:void_ore_miner_cont_3>);
recipes.addShaped("et_void_miner_t3", <environmentaltech:void_ore_miner_cont_3>, [
    [<environmentaltech:kyronite_crystal>, <ore:ingotDraconium>, <environmentaltech:kyronite_crystal>],
    [<ore:ingotDraconium>, <environmentaltech:void_ore_miner_cont_2>, <ore:ingotDraconium>],
    [<environmentaltech:kyronite_crystal>, <draconicevolution:draconic_core>, <environmentaltech:kyronite_crystal>]
]);

# --- Tier 4: Requires Draconic infrastructure ---
recipes.remove(<environmentaltech:void_ore_miner_cont_4>);
recipes.addShaped("et_void_miner_t4", <environmentaltech:void_ore_miner_cont_4>, [
    [<environmentaltech:pladium_crystal>, <draconicevolution:draconic_core>, <environmentaltech:pladium_crystal>],
    [<draconicevolution:draconic_core>, <environmentaltech:void_ore_miner_cont_3>, <draconicevolution:draconic_core>],
    [<environmentaltech:pladium_crystal>, <ore:blockDraconium>, <environmentaltech:pladium_crystal>]
]);

# --- Tier 5: Awakened Draconium required ---
recipes.remove(<environmentaltech:void_ore_miner_cont_5>);
recipes.addShaped("et_void_miner_t5", <environmentaltech:void_ore_miner_cont_5>, [
    [<environmentaltech:ionite_crystal>, <draconicevolution:wyvern_core>, <environmentaltech:ionite_crystal>],
    [<draconicevolution:wyvern_core>, <environmentaltech:void_ore_miner_cont_4>, <draconicevolution:wyvern_core>],
    [<environmentaltech:ionite_crystal>, <ore:ingotDraconiumAwakened>, <environmentaltech:ionite_crystal>]
]);

# --- Tier 6: Ultimate end-game (Chaos Shard gated) ---
recipes.remove(<environmentaltech:void_ore_miner_cont_6>);
recipes.addShaped("et_void_miner_t6", <environmentaltech:void_ore_miner_cont_6>, [
    [<environmentaltech:aethium_crystal>, <draconicevolution:awakened_core>, <environmentaltech:aethium_crystal>],
    [<draconicevolution:chaos_shard>, <environmentaltech:void_ore_miner_cont_5>, <draconicevolution:chaos_shard>],
    [<environmentaltech:aethium_crystal>, <ore:blockDraconiumAwakened>, <environmentaltech:aethium_crystal>]
]);

# ============================================
# SECTION 2: VOID RESOURCE MINER CONTROLLERS
# Extract mob drops and resources from the void
# Same gating structure as ore miners
# ============================================

recipes.remove(<environmentaltech:void_res_miner_cont_1>);
recipes.addShaped("et_void_res_t1", <environmentaltech:void_res_miner_cont_1>, [
    [<ore:circuitAdvanced>, <environmentaltech:litherite_crystal>, <ore:circuitAdvanced>],
    [<environmentaltech:litherite_crystal>, <buildcraftcore:gear_gold>, <environmentaltech:litherite_crystal>],
    [<ore:circuitAdvanced>, <minecraft:ender_pearl>, <ore:circuitAdvanced>]
]);

recipes.remove(<environmentaltech:void_res_miner_cont_2>);
recipes.addShaped("et_void_res_t2", <environmentaltech:void_res_miner_cont_2>, [
    [<environmentaltech:erodium_crystal>, <ore:circuitAdvanced>, <environmentaltech:erodium_crystal>],
    [<ore:circuitAdvanced>, <environmentaltech:void_res_miner_cont_1>, <ore:circuitAdvanced>],
    [<environmentaltech:erodium_crystal>, <minecraft:nether_star>, <environmentaltech:erodium_crystal>]
]);

recipes.remove(<environmentaltech:void_res_miner_cont_3>);
recipes.addShaped("et_void_res_t3", <environmentaltech:void_res_miner_cont_3>, [
    [<environmentaltech:kyronite_crystal>, <ore:ingotDraconium>, <environmentaltech:kyronite_crystal>],
    [<ore:ingotDraconium>, <environmentaltech:void_res_miner_cont_2>, <ore:ingotDraconium>],
    [<environmentaltech:kyronite_crystal>, <draconicevolution:draconic_core>, <environmentaltech:kyronite_crystal>]
]);

recipes.remove(<environmentaltech:void_res_miner_cont_4>);
recipes.addShaped("et_void_res_t4", <environmentaltech:void_res_miner_cont_4>, [
    [<environmentaltech:pladium_crystal>, <draconicevolution:draconic_core>, <environmentaltech:pladium_crystal>],
    [<draconicevolution:draconic_core>, <environmentaltech:void_res_miner_cont_3>, <draconicevolution:draconic_core>],
    [<environmentaltech:pladium_crystal>, <ore:blockDraconium>, <environmentaltech:pladium_crystal>]
]);

recipes.remove(<environmentaltech:void_res_miner_cont_5>);
recipes.addShaped("et_void_res_t5", <environmentaltech:void_res_miner_cont_5>, [
    [<environmentaltech:ionite_crystal>, <draconicevolution:wyvern_core>, <environmentaltech:ionite_crystal>],
    [<draconicevolution:wyvern_core>, <environmentaltech:void_res_miner_cont_4>, <draconicevolution:wyvern_core>],
    [<environmentaltech:ionite_crystal>, <ore:ingotDraconiumAwakened>, <environmentaltech:ionite_crystal>]
]);

recipes.remove(<environmentaltech:void_res_miner_cont_6>);
recipes.addShaped("et_void_res_t6", <environmentaltech:void_res_miner_cont_6>, [
    [<environmentaltech:aethium_crystal>, <draconicevolution:awakened_core>, <environmentaltech:aethium_crystal>],
    [<draconicevolution:chaos_shard>, <environmentaltech:void_res_miner_cont_5>, <draconicevolution:chaos_shard>],
    [<environmentaltech:aethium_crystal>, <ore:blockDraconiumAwakened>, <environmentaltech:aethium_crystal>]
]);

# ============================================
# SECTION 3: SOLAR ARRAY CONTROLLERS
# HEAVILY GATED - Could trivialize power generation
# Push to end-game alongside Draconic Reactor
# ============================================

# --- Tier 1-2: Disable by making uncraftable ---
# (Or gate behind draconium if we want to keep them)
recipes.remove(<environmentaltech:solar_cont_1>);
recipes.remove(<environmentaltech:solar_cont_2>);

# --- Tier 3+: Gate behind Draconic Evolution ---
# Only available after establishing DE power infrastructure
recipes.remove(<environmentaltech:solar_cont_3>);
recipes.addShaped("et_solar_t3", <environmentaltech:solar_cont_3>, [
    [<environmentaltech:kyronite_crystal>, <draconicevolution:draconic_core>, <environmentaltech:kyronite_crystal>],
    [<ore:blockDraconium>, <draconicevolution:energy_storage_core>, <ore:blockDraconium>],
    [<environmentaltech:kyronite_crystal>, <draconicevolution:draconic_core>, <environmentaltech:kyronite_crystal>]
]);

recipes.remove(<environmentaltech:solar_cont_4>);
recipes.addShaped("et_solar_t4", <environmentaltech:solar_cont_4>, [
    [<environmentaltech:pladium_crystal>, <draconicevolution:wyvern_core>, <environmentaltech:pladium_crystal>],
    [<draconicevolution:wyvern_core>, <environmentaltech:solar_cont_3>, <draconicevolution:wyvern_core>],
    [<environmentaltech:pladium_crystal>, <ore:blockDraconium>, <environmentaltech:pladium_crystal>]
]);

recipes.remove(<environmentaltech:solar_cont_5>);
recipes.addShaped("et_solar_t5", <environmentaltech:solar_cont_5>, [
    [<environmentaltech:ionite_crystal>, <draconicevolution:awakened_core>, <environmentaltech:ionite_crystal>],
    [<ore:ingotDraconiumAwakened>, <environmentaltech:solar_cont_4>, <ore:ingotDraconiumAwakened>],
    [<environmentaltech:ionite_crystal>, <draconicevolution:awakened_core>, <environmentaltech:ionite_crystal>]
]);

recipes.remove(<environmentaltech:solar_cont_6>);
recipes.addShaped("et_solar_t6", <environmentaltech:solar_cont_6>, [
    [<environmentaltech:aethium_crystal>, <draconicevolution:chaos_shard>, <environmentaltech:aethium_crystal>],
    [<draconicevolution:chaos_shard>, <environmentaltech:solar_cont_5>, <draconicevolution:chaos_shard>],
    [<environmentaltech:aethium_crystal>, <ore:blockDraconiumAwakened>, <environmentaltech:aethium_crystal>]
]);

# ============================================
# SECTION 4: LIGHTNING ROD
# Keep accessible - Fun, weather-dependent, not OP
# Light gating for thematic consistency
# ============================================

recipes.remove(<environmentaltech:lightning_cont>);
recipes.addShaped("et_lightning_rod", <environmentaltech:lightning_cont>, [
    [<minecraft:iron_bars>, <environmentaltech:litherite_crystal>, <minecraft:iron_bars>],
    [<ore:circuitAdvanced>, <buildcraftcore:gear_iron>, <ore:circuitAdvanced>],
    [<ore:blockIron>, <ore:blockRedstone>, <ore:blockIron>]
]);

# ============================================
# SECTION 5: NANOBOT BEACON
# QoL feature - Light gating only
# ============================================

recipes.remove(<environmentaltech:nano_cont_personal>);
recipes.addShaped("et_nano_personal", <environmentaltech:nano_cont_personal>, [
    [<ore:circuitBasic>, <environmentaltech:litherite_crystal>, <ore:circuitBasic>],
    [<environmentaltech:litherite_crystal>, <minecraft:beacon>, <environmentaltech:litherite_crystal>],
    [<ore:circuitBasic>, <environmentaltech:litherite_crystal>, <ore:circuitBasic>]
]);

# ============================================
# SECTION 6: CRYSTAL CRAFTING
# Ensure crystal progression requires tech investment
# ============================================

# Litherite Crystal - Base tier, require basic circuits
recipes.remove(<environmentaltech:litherite_crystal>);
recipes.addShaped("et_litherite", <environmentaltech:litherite_crystal>, [
    [<environmentaltech:litherite>, <ore:circuitBasic>, <environmentaltech:litherite>],
    [<ore:circuitBasic>, <ore:gemDiamond>, <ore:circuitBasic>],
    [<environmentaltech:litherite>, <ore:circuitBasic>, <environmentaltech:litherite>]
]);

# Erodium Crystal - Tier 2
recipes.remove(<environmentaltech:erodium_crystal>);
recipes.addShaped("et_erodium", <environmentaltech:erodium_crystal>, [
    [<environmentaltech:erodium>, <environmentaltech:litherite_crystal>, <environmentaltech:erodium>],
    [<environmentaltech:litherite_crystal>, <ore:circuitAdvanced>, <environmentaltech:litherite_crystal>],
    [<environmentaltech:erodium>, <environmentaltech:litherite_crystal>, <environmentaltech:erodium>]
]);

# Kyronite Crystal - Tier 3, requires draconium
recipes.remove(<environmentaltech:kyronite_crystal>);
recipes.addShaped("et_kyronite", <environmentaltech:kyronite_crystal>, [
    [<environmentaltech:kyronite>, <environmentaltech:erodium_crystal>, <environmentaltech:kyronite>],
    [<environmentaltech:erodium_crystal>, <ore:ingotDraconium>, <environmentaltech:erodium_crystal>],
    [<environmentaltech:kyronite>, <environmentaltech:erodium_crystal>, <environmentaltech:kyronite>]
]);

# Pladium Crystal - Tier 4
recipes.remove(<environmentaltech:pladium_crystal>);
recipes.addShaped("et_pladium", <environmentaltech:pladium_crystal>, [
    [<environmentaltech:pladium>, <environmentaltech:kyronite_crystal>, <environmentaltech:pladium>],
    [<environmentaltech:kyronite_crystal>, <draconicevolution:draconic_core>, <environmentaltech:kyronite_crystal>],
    [<environmentaltech:pladium>, <environmentaltech:kyronite_crystal>, <environmentaltech:pladium>]
]);

# Ionite Crystal - Tier 5, requires wyvern core
recipes.remove(<environmentaltech:ionite_crystal>);
recipes.addShaped("et_ionite", <environmentaltech:ionite_crystal>, [
    [<environmentaltech:ionite>, <environmentaltech:pladium_crystal>, <environmentaltech:ionite>],
    [<environmentaltech:pladium_crystal>, <draconicevolution:wyvern_core>, <environmentaltech:pladium_crystal>],
    [<environmentaltech:ionite>, <environmentaltech:pladium_crystal>, <environmentaltech:ionite>]
]);

# Aethium Crystal - Tier 6, requires awakened core
recipes.remove(<environmentaltech:aethium_crystal>);
recipes.addShaped("et_aethium", <environmentaltech:aethium_crystal>, [
    [<environmentaltech:aethium>, <environmentaltech:ionite_crystal>, <environmentaltech:aethium>],
    [<environmentaltech:ionite_crystal>, <draconicevolution:awakened_core>, <environmentaltech:ionite_crystal>],
    [<environmentaltech:aethium>, <environmentaltech:ionite_crystal>, <environmentaltech:aethium>]
]);

# ============================================
# NOTES FOR BALANCER AGENT:
# - Test void miner power consumption at each tier
# - Verify ore output rates feel balanced
# - Check that T1-2 solar controllers are truly disabled
# - Test crystal crafting chain works
# - Confirm DE items resolve correctly
# ============================================

print("Environmental Tech integration recipes loaded successfully!");
