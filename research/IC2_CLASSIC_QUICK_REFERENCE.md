# IC2 Classic Quick Reference
## Registry IDs for Minecraft 1.12.2

> **Source:** Gemini Deep Research Report (February 2026)
> **Critical:** IC2 Classic uses `ic2:te` (Tile Entity) namespace, NOT `ic2:blockmachine`!

---

## ⚠️ IMPORTANT: Verify Before Use

```
/ct hand          - Get exact ID of held item
/ct inventory     - Dump all inventory item IDs to log
/ct oredict       - Dump ore dictionary tags
```

**Log Location:** `logs/crafttweaker.log`

---

## Machine Registry IDs

### Processing Machines

| Machine | Registry ID | Metadata | Function |
|---------|-------------|----------|----------|
| **Macerator** | `<ic2:te:4>` | 4 | Ore → 2x Dust |
| **Compressor** | `<ic2:te:5>` | 5 | Plates, Carbon |
| **Extractor** | `<ic2:te:6>` | 6 | 3x Rubber from Resin |
| **Electric Furnace** | `<ic2:te:2>` | 2 | EU-powered smelting |
| **Recycler** | `<ic2:te:48>` | 48 | Items → Scrap |
| **Canning Machine** | `<ic2:te:34>` | 34 | Fluid canning |
| **Induction Furnace** | `<ic2:te:46>` | 46 | Fast dual-smelting |
| **Mass Fabricator** | `<ic2:te:62>` | 62 | UU-Matter production |
| **Teleporter** | `<ic2:te:55>` | 55 | Entity transport |

### Generators

| Generator | Registry ID | Output | Notes |
|-----------|-------------|--------|-------|
| **Generator** | `<ic2:te:3>` | 10 EU/t | Coal/Charcoal |
| **Geothermal** | `<ic2:te:8>` | 20 EU/t | Lava |
| **Solar Panel** | `<ic2:te:8>` | 1 EU/t | ⚠️ May share ID - VERIFY |
| **Water Mill** | `<ic2:te:9>` | Variable | Water-dependent |
| **Wind Mill** | `<ic2:te:10>` | Variable | Height-dependent |
| **Nuclear Reactor** | `<ic2:te:22>` | Variable | Multiblock core |

### Energy Storage

| Storage | Registry ID | Capacity | Max EU/t | Tier |
|---------|-------------|----------|----------|------|
| **BatBox** | `<ic2:te:72>` | 40,000 EU | 32 | LV |
| **MFE** | `<ic2:te:73>` | 600,000 EU | 128 | MV |
| **MFSU** | `<ic2:te:74>` | 10,000,000 EU | 512 | HV |

### Transformers

| Transformer | Registry ID | Conversion |
|-------------|-------------|------------|
| **LV Transformer** | `<ic2:te:77>` | 32 ↔ 128 EU |
| **MV Transformer** | `<ic2:te:78>` | 128 ↔ 512 EU |
| **HV Transformer** | `<ic2:te:79>` | 512 ↔ 2048 EU |

---

## Crafting Components

### Machine Blocks

| Component | Registry ID | Usage |
|-----------|-------------|-------|
| **Machine Casing** | `<ic2:resource:1>` | Basic machines |
| **Advanced Machine Casing** | `<ic2:resource:13>` | Advanced machines |
| **Reactor Chamber** | `<ic2:resource:12>` | Nuclear multiblock |

### Circuits & Electronics

| Component | Registry ID | Tier |
|-----------|-------------|------|
| **Electronic Circuit** | `<ic2:itemcrafting:1>` | Basic |
| **Advanced Circuit** | `<ic2:itemcrafting:2>` | Advanced |

### Materials

| Material | Registry ID | Notes |
|----------|-------------|-------|
| **Copper Ingot** | `<ic2:itemingot:0>` | Meta 0 |
| **Tin Ingot** | `<ic2:itemingot:1>` | Meta 1 |
| **Bronze Ingot** | `<ic2:itemingot:2>` | Meta 2 |
| **Refined Iron** | `<ic2:itemingot:3>` | Meta 3 |
| **Sticky Resin** | `<ic2:itemharz>` | From rubber trees |
| **Rubber** | `<ic2:itemrubber>` | Smelted resin |
| **RE-Battery** | `<ic2:itemrebattery>` | Basic battery |

### Cables

| Cable | Registry ID | Max EU/t |
|-------|-------------|----------|
| **Copper Cable (Uninsulated)** | `<ic2:itemcable:0>` | 32 |
| **Copper Cable (Insulated)** | `<ic2:itemcable:1>` | 32 |
| **Gold Cable** | `<ic2:itemcable:2>` | 128 |
| **HV Cable** | `<ic2:itemcable:4>` | 512 |
| **Glass Fibre Cable** | `<ic2:itemcable:9>` | 8192 |

---

## CraftTweaker Examples

### Removing/Adding Crafting Recipes

```zs
// FILE: scripts/ic2_recipes.zs
import crafttweaker.item.IItemStack;

// Define using CORRECT Classic IDs
val macerator = <ic2:te:4>;
val circuit = <ic2:itemcrafting:1>;
val machineBlock = <ic2:resource:1>;

// Remove default recipe
recipes.remove(macerator);

// Add new recipe
recipes.addShaped("expert_macerator", macerator, [
    [<minecraft:flint>, <minecraft:diamond>, <minecraft:flint>],
    [<minecraft:cobblestone>, machineBlock, <minecraft:cobblestone>],
    [<minecraft:iron_ingot>, circuit, <minecraft:iron_ingot>]
]);
```

### Machine Processing Recipes

> ⚠️ **WARNING:** CraftTweaker machine recipe handlers may not work with IC2 Classic!
> Use JSON config files instead: `config/ic2/ic2machineRecipes.json`

If using IC2ClassicTweaker (verify it's installed):
```zs
import mods.ic2.Macerator;

// Syntax: Output, Input
Macerator.addRecipe(<minecraft:blaze_powder> * 5, <minecraft:blaze_rod>);
```

---

## Common Mistakes

| ❌ Wrong (Experimental) | ✅ Correct (Classic) |
|------------------------|---------------------|
| `<ic2:blockmacerator>` | `<ic2:te:4>` |
| `<ic2:blockmachine:1>` | `<ic2:te:X>` (check metadata) |
| `<ic2:blockgenerator>` | `<ic2:te:3>` |
| `<ic2:te_mfsu>` | `<ic2:te:74>` |

---

## Voltage Tiers Reference

| Tier | Name | Max EU/t | Storage | Cable |
|------|------|----------|---------|-------|
| LV | Low Voltage | 32 | BatBox | Copper |
| MV | Medium Voltage | 128 | MFE | Gold |
| HV | High Voltage | 512 | MFSU | HV Cable |
| EV | Extreme Voltage | 2048 | - | Glass Fibre |

**⚠️ Sending too much EU/t into a machine = EXPLOSION!**

---

## Quick Dump Workflow

When implementing quests or scripts:

1. Launch game in Creative mode
2. Get items from JEI/Creative menu
3. Hold each item and run `/ct hand`
4. Copy IDs from `crafttweaker.log`
5. Update scripts with verified IDs

---

*Reference Version: 1.0 - February 2026*
*Based on IC2 Classic (Speiger fork) for Minecraft 1.12.2*
