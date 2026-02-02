# ============================================
# ProjectE Integration - Tech-Gated Progression
# Purpose: Gate transmutation items behind tech progression
# Author: EnergyCraft Team
# Last Updated: 2026-02-02
# ============================================

print("Loading ProjectE integration...");

# --- DESIGN PHILOSOPHY ---
# ProjectE should COMPLEMENT tech, not bypass it:
# - Dark Matter = Mid-game (requires IC2 Advanced Circuits)
# - Red Matter = Late-game (requires Draconic Evolution)
# - Klein Star Omega = End-game (requires Wyvern Cores)
# - Watch of Flowing Time = Gated (prevents early acceleration abuse)

# ============================================
# TIER 1: Dark Matter - Requires IC2 Tech
# ============================================

# Gate Dark Matter behind Advanced Circuits
# Original: 8x Aeternalis Fuel in a ring
# New: Requires Advanced Circuits + High Covalence Dust center
recipes.remove(<projecte:item.pe_matter>);
recipes.addShaped("dark_matter_gated", <projecte:item.pe_matter>, [
    [<projecte:item.pe_fuel:2>, <ore:circuitAdvanced>, <projecte:item.pe_fuel:2>],
    [<ore:circuitAdvanced>, <projecte:item.pe_covalence_dust:2>, <ore:circuitAdvanced>],
    [<projecte:item.pe_fuel:2>, <ore:circuitAdvanced>, <projecte:item.pe_fuel:2>]
]);

print("  - Dark Matter gated behind Advanced Circuits");

# ============================================
# TIER 2: Red Matter - Requires Draconic Evolution
# ============================================

# Gate Red Matter behind Draconic Cores
# Original: 8x Dark Matter + Aeternalis Fuel
# New: Requires Draconic Cores for late-game gating
recipes.remove(<projecte:item.pe_matter:1>);
recipes.addShaped("red_matter_gated", <projecte:item.pe_matter:1>, [
    [<projecte:item.pe_matter>, <draconicevolution:draconic_core>, <projecte:item.pe_matter>],
    [<draconicevolution:draconic_core>, <projecte:item.pe_fuel:2>, <draconicevolution:draconic_core>],
    [<projecte:item.pe_matter>, <draconicevolution:draconic_core>, <projecte:item.pe_matter>]
]);

print("  - Red Matter gated behind Draconic Cores");

# ============================================
# TIER 3: Klein Star Omega - Requires Wyvern Tech
# ============================================

# Gate Klein Star Omega (largest EMC storage) behind Wyvern Cores
# This is the ultimate EMC storage - should require significant tech investment
recipes.remove(<projecte:item.pe_klein_star:5>);
recipes.addShaped("klein_omega_gated", <projecte:item.pe_klein_star:5>, [
    [<projecte:item.pe_klein_star:4>, <draconicevolution:wyvern_core>, <projecte:item.pe_klein_star:4>],
    [<draconicevolution:wyvern_core>, <projecte:item.pe_matter:1>, <draconicevolution:wyvern_core>],
    [<projecte:item.pe_klein_star:4>, <draconicevolution:wyvern_core>, <projecte:item.pe_klein_star:4>]
]);

print("  - Klein Star Omega gated behind Wyvern Cores");

# ============================================
# UTILITY: Watch of Flowing Time - Prevent Early Abuse
# ============================================

# Gate Time Watch to prevent early-game acceleration exploits
# Powerful item that speeds up tile entities - should require tech
recipes.remove(<projecte:item.pe_time_watch>);
recipes.addShaped("time_watch_gated", <projecte:item.pe_time_watch>, [
    [<ore:ingotGold>, <minecraft:clock>, <ore:ingotGold>],
    [<ore:circuitAdvanced>, <projecte:item.pe_matter>, <ore:circuitAdvanced>],
    [<ore:ingotGold>, <buildcraftcore:gear_diamond>, <ore:ingotGold>]
]);

print("  - Watch of Flowing Time gated behind Advanced Circuits + Diamond Gear");

# ============================================
# EMC GENERATION: Gate Higher-Tier Collectors/Relays
# ============================================

# Energy Collector MK2 - Requires Basic Circuit
recipes.remove(<projecte:collector_mk2>);
recipes.addShaped("collector_mk2_gated", <projecte:collector_mk2>, [
    [<minecraft:glass>, <projecte:item.pe_matter>, <minecraft:glass>],
    [<projecte:item.pe_matter>, <projecte:collector_mk1>, <projecte:item.pe_matter>],
    [<ore:circuitBasic>, <projecte:item.pe_matter>, <ore:circuitBasic>]
]);

# Energy Collector MK3 - Requires Advanced Circuit
recipes.remove(<projecte:collector_mk3>);
recipes.addShaped("collector_mk3_gated", <projecte:collector_mk3>, [
    [<minecraft:glass>, <projecte:item.pe_matter:1>, <minecraft:glass>],
    [<projecte:item.pe_matter:1>, <projecte:collector_mk2>, <projecte:item.pe_matter:1>],
    [<ore:circuitAdvanced>, <projecte:item.pe_matter:1>, <ore:circuitAdvanced>]
]);

print("  - Collectors MK2/MK3 gated behind circuits");

# Anti-Matter Relay MK2 - Requires Basic Circuit
recipes.remove(<projecte:relay_mk2>);
recipes.addShaped("relay_mk2_gated", <projecte:relay_mk2>, [
    [<projecte:item.pe_matter>, <projecte:item.pe_matter>, <projecte:item.pe_matter>],
    [<projecte:item.pe_matter>, <projecte:relay_mk1>, <projecte:item.pe_matter>],
    [<ore:circuitBasic>, <projecte:item.pe_matter>, <ore:circuitBasic>]
]);

# Anti-Matter Relay MK3 - Requires Advanced Circuit
recipes.remove(<projecte:relay_mk3>);
recipes.addShaped("relay_mk3_gated", <projecte:relay_mk3>, [
    [<projecte:item.pe_matter:1>, <projecte:item.pe_matter:1>, <projecte:item.pe_matter:1>],
    [<projecte:item.pe_matter:1>, <projecte:relay_mk2>, <projecte:item.pe_matter:1>],
    [<ore:circuitAdvanced>, <projecte:item.pe_matter:1>, <ore:circuitAdvanced>]
]);

print("  - Relays MK2/MK3 gated behind circuits");

# Energy Condenser MK2 - Requires Advanced Circuit + Glass Fibre
# This is a powerful automation tool - gate it significantly
recipes.remove(<projecte:condenser_mk2>);
recipes.addShaped("condenser_mk2_gated", <projecte:condenser_mk2>, [
    [<projecte:item.pe_matter:1>, <ic2:itemcable:9>, <projecte:item.pe_matter:1>],
    [<projecte:item.pe_matter:1>, <projecte:condenser_mk1>, <projecte:item.pe_matter:1>],
    [<ore:circuitAdvanced>, <projecte:item.pe_matter:1>, <ore:circuitAdvanced>]
]);

print("  - Condenser MK2 gated behind Advanced Circuits + Glass Fibre");

# ============================================
# Summary
# ============================================

print("ProjectE integration loaded successfully!");
print("  Tech gates applied:");
print("    - Dark Matter: Advanced Circuit");
print("    - Red Matter: Draconic Core");
print("    - Klein Star Omega: Wyvern Core");
print("    - Time Watch: Advanced Circuit + Diamond Gear");
print("    - Collectors/Relays MK2+: Circuits");
print("    - Condenser MK2: Advanced Circuit + Glass Fibre");
