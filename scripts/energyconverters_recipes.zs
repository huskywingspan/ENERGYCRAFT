# Energy Converters - Custom Recipes for IC2 Classic Compatibility
# This script adds crafting recipes for Energy Converters blocks
# IC2 Classic uses ic2:itemcable with metadata for different cable types

print("Loading Energy Converters custom recipes for IC2 Classic...");

# ============================================
# IC2 Classic uses a single item with metadata:
# ic2:itemcable:0  = Copper Cable (uninsulated)
# ic2:itemcable:1  = Insulated Copper Cable
# ic2:itemcable:2  = Gold Cable (uninsulated)
# ic2:itemcable:3  = Insulated Gold Cable
# ic2:itemcable:4  = 2x Ins Gold Cable
# ic2:itemcable:5  = Iron/HV Cable (uninsulated)
# ic2:itemcable:6  = Insulated HV Cable
# ic2:itemcable:7  = 2x Ins HV Cable  
# ic2:itemcable:8  = 3x Ins HV Cable
# ic2:itemcable:9  = Glass Fibre Cable
# ic2:itemcable:10 = Tin Cable
# ic2:itemcable:13 = Detector Cable
# ic2:itemcable:14 = Splitter Cable
#
# IC2 Classic Circuits (using ore dictionary for safety)
# Electronic Circuit = ic2:itempartcircuit
# Advanced Circuit = ic2:itempartcircuitadv
# ============================================

# ============================================
# ENERGY BRIDGE RECIPE
# The central block that all converters connect to
# ============================================

recipes.addShaped("energyconverters_bridge", <energyconverters:energy_bridge>,
    [[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>],
     [<minecraft:redstone>, <minecraft:ender_pearl>, <minecraft:redstone>],
     [<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

# ============================================
# EU CONSUMER RECIPES (Takes EU, puts into bridge)
# 5 Tiers: LV, MV, HV, EV, IV
# ============================================

# LV EU Consumer (Tier 1) - 32 EU/t max - Uses Insulated Copper Cable
recipes.addShaped("energyconverters_consumer_eu_lv", <energyconverters:energy_consumer_eu:0>,
    [[<ic2:itemcable:1>, <ic2:itemcable:1>, <ic2:itemcable:1>],
     [<ic2:itemcable:1>, <ore:circuitBasic>, <ic2:itemcable:1>],
     [<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

# MV EU Consumer (Tier 2) - 128 EU/t max - Uses Insulated Gold Cable
recipes.addShaped("energyconverters_consumer_eu_mv", <energyconverters:energy_consumer_eu:1>,
    [[<ic2:itemcable:1>, <ic2:itemcable:3>, <ic2:itemcable:1>],
     [<ic2:itemcable:3>, <ore:circuitBasic>, <ic2:itemcable:3>],
     [<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

# HV EU Consumer (Tier 3) - 512 EU/t max - Uses 2x Ins HV Cable
recipes.addShaped("energyconverters_consumer_eu_hv", <energyconverters:energy_consumer_eu:2>,
    [[<ic2:itemcable:3>, <ic2:itemcable:7>, <ic2:itemcable:3>],
     [<ic2:itemcable:7>, <ore:circuitAdvanced>, <ic2:itemcable:7>],
     [<minecraft:gold_ingot>, <minecraft:redstone>, <minecraft:gold_ingot>]]);

# EV EU Consumer (Tier 4) - 2048 EU/t max - Uses Glass Fibre Cable
recipes.addShaped("energyconverters_consumer_eu_ev", <energyconverters:energy_consumer_eu:3>,
    [[<ic2:itemcable:7>, <ic2:itemcable:9>, <ic2:itemcable:7>],
     [<ic2:itemcable:9>, <ore:circuitAdvanced>, <ic2:itemcable:9>],
     [<minecraft:gold_ingot>, <minecraft:diamond>, <minecraft:gold_ingot>]]);

# IV EU Consumer (Tier 5) - 8192 EU/t max - Uses Glass Fibre Cable
recipes.addShaped("energyconverters_consumer_eu_iv", <energyconverters:energy_consumer_eu:4>,
    [[<ic2:itemcable:9>, <ic2:itemcable:9>, <ic2:itemcable:9>],
     [<ic2:itemcable:9>, <ore:circuitAdvanced>, <ic2:itemcable:9>],
     [<minecraft:diamond>, <minecraft:diamond>, <minecraft:diamond>]]);

# ============================================
# EU PRODUCER RECIPES (Takes from bridge, outputs EU)
# 5 Tiers: LV, MV, HV, EV, IV
# ============================================

# LV EU Producer (Tier 1) - 32 EU/t max
recipes.addShaped("energyconverters_producer_eu_lv", <energyconverters:energy_producer_eu:0>,
    [[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>],
     [<ic2:itemcable:1>, <ore:circuitBasic>, <ic2:itemcable:1>],
     [<ic2:itemcable:1>, <ic2:itemcable:1>, <ic2:itemcable:1>]]);

# MV EU Producer (Tier 2) - 128 EU/t max
recipes.addShaped("energyconverters_producer_eu_mv", <energyconverters:energy_producer_eu:1>,
    [[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>],
     [<ic2:itemcable:3>, <ore:circuitBasic>, <ic2:itemcable:3>],
     [<ic2:itemcable:1>, <ic2:itemcable:3>, <ic2:itemcable:1>]]);

# HV EU Producer (Tier 3) - 512 EU/t max
recipes.addShaped("energyconverters_producer_eu_hv", <energyconverters:energy_producer_eu:2>,
    [[<minecraft:gold_ingot>, <minecraft:redstone>, <minecraft:gold_ingot>],
     [<ic2:itemcable:7>, <ore:circuitAdvanced>, <ic2:itemcable:7>],
     [<ic2:itemcable:3>, <ic2:itemcable:7>, <ic2:itemcable:3>]]);

# EV EU Producer (Tier 4) - 2048 EU/t max
recipes.addShaped("energyconverters_producer_eu_ev", <energyconverters:energy_producer_eu:3>,
    [[<minecraft:gold_ingot>, <minecraft:diamond>, <minecraft:gold_ingot>],
     [<ic2:itemcable:9>, <ore:circuitAdvanced>, <ic2:itemcable:9>],
     [<ic2:itemcable:7>, <ic2:itemcable:9>, <ic2:itemcable:7>]]);

# IV EU Producer (Tier 5) - 8192 EU/t max
recipes.addShaped("energyconverters_producer_eu_iv", <energyconverters:energy_producer_eu:4>,
    [[<minecraft:diamond>, <minecraft:diamond>, <minecraft:diamond>],
     [<ic2:itemcable:9>, <ore:circuitAdvanced>, <ic2:itemcable:9>],
     [<ic2:itemcable:9>, <ic2:itemcable:9>, <ic2:itemcable:9>]]);

# ============================================
# FE (FORGE ENERGY) CONVERTER RECIPES
# ============================================

# FE Consumer (Takes FE, puts into bridge)
recipes.addShaped("energyconverters_consumer_fe", <energyconverters:energy_consumer_fe>,
    [[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>],
     [<minecraft:redstone>, <ore:circuitBasic>, <minecraft:redstone>],
     [<minecraft:iron_ingot>, <minecraft:glowstone_dust>, <minecraft:iron_ingot>]]);

# FE Producer (Takes from bridge, outputs FE)
recipes.addShaped("energyconverters_producer_fe", <energyconverters:energy_producer_fe>,
    [[<minecraft:iron_ingot>, <minecraft:glowstone_dust>, <minecraft:iron_ingot>],
     [<minecraft:redstone>, <ore:circuitBasic>, <minecraft:redstone>],
     [<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

# ============================================
# RF (REDSTONE FLUX) CONVERTER RECIPES
# ============================================

# RF Consumer (Takes RF, puts into bridge)
recipes.addShaped("energyconverters_consumer_rf", <energyconverters:energy_consumer_rf>,
    [[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>],
     [<minecraft:redstone>, <ore:circuitBasic>, <minecraft:redstone>],
     [<minecraft:gold_ingot>, <minecraft:glowstone_dust>, <minecraft:gold_ingot>]]);

# RF Producer (Takes from bridge, outputs RF)
recipes.addShaped("energyconverters_producer_rf", <energyconverters:energy_producer_rf>,
    [[<minecraft:gold_ingot>, <minecraft:glowstone_dust>, <minecraft:gold_ingot>],
     [<minecraft:redstone>, <ore:circuitBasic>, <minecraft:redstone>],
     [<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

# ============================================
# MJ (BUILDCRAFT) CONVERTER RECIPES
# ============================================

# MJ Consumer (Takes MJ, puts into bridge)
recipes.addShaped("energyconverters_consumer_mj", <energyconverters:energy_consumer_mj>,
    [[<minecraft:iron_ingot>, <buildcraftcore:gear_stone>, <minecraft:iron_ingot>],
     [<buildcraftcore:gear_iron>, <ore:circuitBasic>, <buildcraftcore:gear_iron>],
     [<minecraft:iron_ingot>, <buildcraftcore:gear_gold>, <minecraft:iron_ingot>]]);

# MJ Producer (Takes from bridge, outputs MJ)
recipes.addShaped("energyconverters_producer_mj", <energyconverters:energy_producer_mj>,
    [[<minecraft:iron_ingot>, <buildcraftcore:gear_gold>, <minecraft:iron_ingot>],
     [<buildcraftcore:gear_iron>, <ore:circuitBasic>, <buildcraftcore:gear_iron>],
     [<minecraft:iron_ingot>, <buildcraftcore:gear_stone>, <minecraft:iron_ingot>]]);

print("Energy Converters recipes loaded successfully!");
