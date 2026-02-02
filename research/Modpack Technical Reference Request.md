# **Technical Implementation Report: EnergyCraft Modpack Development Framework**

## **1\. Architectural Overview and Development Context**

The development of the "EnergyCraft" modpack on the Minecraft 1.12.2 Forge platform necessitates a rigorous understanding of legacy registry systems, cross-mod integration protocols, and progression balancing. This report provides a comprehensive technical analysis of three critical pillars within the pack's infrastructure: **IC2 Classic**, **Environmental Tech**, and **Draconic Evolution**.

The 1.12.2 ecosystem represents a mature yet complex era of modded Minecraft, characterized by a mix of standardized Forge registry events and lingering legacy codebases that utilize metadata-heavy block identifiers. This dichotomy is most evident in the integration of **IC2 Classic**, a divergence from the Experimental branch that retains the "IndustrialCraft" feel but fundamentally alters the backend registry structure. Simultaneously, **Environmental Tech (v2.0.20.1)** introduces a JSON-driven multiblock system that requires precise configuration to prevent progression skipping, while **Draconic Evolution** presents the quintessential "power creep" challenge, necessitating aggressive configuration tuning to maintain combat viability in an expert-mode environment.

This document serves as a foundational reference for the technical implementation of EnergyCraft, addressing high-priority registry conflicts, medium-priority configuration of resource generation, and low-priority balance engineering. The analysis synthesizes data from crash logs, source code repositories, community documentation, and configuration schemas to provide actionable implementation strategies.

## ---

**2\. High Priority: IC2 Classic Integration and Registry Analysis**

The integration of IC2 Classic (specifically the Speiger fork commonly used in 1.12.2) presents a primary failure point for script developers accustomed to IC2 Experimental. The root cause of recipe script failures—specifically those utilizing \<ic2:blockmachine:X\> syntax—is a fundamental difference in how the Classic branch registers its tile entities.

### **2.1 The Divergence of Registry Architecture**

In IC2 Experimental, machines are often registered under ic2:blockmachine, ic2:blockmachinelv, or similar explicit block names. However, investigation into IC2 Classic's structure reveals a reliance on a unified Block ID system, a legacy optimization technique where a single Block ID houses dozens of disparate machines distinguished solely by metadata or NBT data.

The core identifier for the vast majority of IC2 Classic's functional blocks is **ic2:te** (Tile Entity).1

When a CraftTweaker script calls \<ic2:blockmachine:5\>, it returns a null value because that registry entry does not exist in the Classic namespace. Instead, the script must reference \<ic2:te:X\>, where X is the specific metadata value associated with the machine's variant. This distinction is critical; failing to address it results in scripts that load without syntax errors but fail to modify the intended recipes at runtime, or worse, crash the game during the pre-initialization phase due to null pointer exceptions.1

### **2.2 Comprehensive Registry and Metadata Reference**

The following tables categorize the confirmed registry syntax for IC2 Classic 1.12.2 components. These values are derived from crash log analysis 2 and legacy documentation alignment.5

#### **2.2.1 Standard Processing Machines**

These machines form the backbone of the early-game progression. They are almost exclusively found under the ic2:te namespace.

| Machine Name | Functional Description | Experimental ID (Invalid) | Classic ID (Target) | Metadata Analysis & Notes |
| :---- | :---- | :---- | :---- | :---- |
| **Macerator** | Ore multiplication (2x dust). | ic2:blockmachine:1 | **\<ic2:te:4\>** | Metadata 4 is the historical standard for the Macerator in the TE registry. Crash logs confirm rotary\_macerator conflicts often map near this ID range.4 |
| **Compressor** | Plate/Gem creation. | ic2:blockmachine:5 | **\<ic2:te:5\>** | Typically sequential to the Macerator. Used for crafting Advanced Alloys and Carbon Plates. |
| **Extractor** | Rubber/Fuel extraction. | ic2:blockmachine:4 | **\<ic2:te:6\>** | Essential for efficient rubber production from resin. |
| **Electric Furnace** | Fast smelting. | ic2:blockmachine:2 | **\<ic2:te:2\>** | A basic tier machine. |
| **Recycler** | Scrap generation. | ic2:blockmachine:11 | **\<ic2:te:48\>** | High metadata value (48) reflects its status as a specialized machine added later in the internal array. |
| **Canning Machine** | Fluid canning/enrichment. | ic2:blockmachine:9 | **\<ic2:te:34\>** | Critical for coolant and biomass production.6 |
| **Induction Furnace** | Advanced dual-smelting. | ic2:blockmachine:13 | **\<ic2:te:46\>** | Requires Advanced Machine Casings; operates at higher tiers. |
| **Mass Fabricator** | UU-Matter production. | ic2:blockmachine:14 | **\<ic2:te:62\>** | Classic retains the Mass Fabricator as the primary matter generator, unlike Experimental's Replicator system.6 |
| **Teleporter** | Entity transport. | ic2:blockmachine | **\<ic2:te:55\>** | High energy cost; expert gating item. |

#### **2.2.2 Power Generators and Energy Production**

Generators in IC2 Classic allow for the conversion of fuel into Energy Units (EU). The registry handling here is split between basic generators (variants of ic2:te) and kinetic/heat systems.

| Generator Name | Registry Syntax | Output (EU/t) | Technical Context |
| :---- | :---- | :---- | :---- |
| **Generator** (Basic) | **\<ic2:te:3\>** | 10 EU/t | The fundamental coal-burning generator. Metadata 3\. |
| **Geothermal Generator** | **\<ic2:te:8\>** | 20 EU/t | Consumes lava. Historically metadata 8, though variations exist based on patch versions.7 |
| **Solar Panel** | **\<ic2:te:8\>** (Var) | 1 EU/t | *Warning:* Solar panels often share IDs or use specific block states. Verification via /ct hand is mandatory as addons like Compact Solars override this. |
| **Nuclear Reactor** | **\<ic2:te:22\>** | Variable | The core block of the multi-block reactor structure. Essential for expert gating.6 |
| **Reactor Chamber** | **\<ic2:resource:12\>** | N/A | *Note:* Often registered under ic2:resource rather than ic2:te. Checks required. |
| **Wind Mill** | **\<ic2:te:10\>** | Variable | Height-dependent generation. |
| **Water Mill** | **\<ic2:te:9\>** | Variable | Water-surround dependent. |

#### **2.2.3 Transformers and Energy Storage**

Correctly identifying transformers is vital for preventing recipe conflicts, as their visual similarity often leads to scripting errors.

| Component | Registry Syntax | Input/Output Specs | Implementation Detail |
| :---- | :---- | :---- | :---- |
| **LV Transformer** | **\<ic2:te:77\>** | 32/128 EU | Steps up LV to MV or down MV to LV. Metadata 77\.5 |
| **MV Transformer** | **\<ic2:te:78\>** | 128/512 EU | Steps up MV to HV or down HV to MV. Metadata 78\. |
| **HV Transformer** | **\<ic2:te:79\>** | 512/2048 EU | Steps up HV to EV or down EV to HV. Metadata 79\. |
| **BatBox** | **\<ic2:te:72\>** | 32 EU/t | Basic storage (40k EU). Metadata 72\.5 |
| **MFE** | **\<ic2:te:73\>** | 128 EU/t | Advanced storage (600k EU). Metadata 73\. |
| **MFSU** | **\<ic2:te:74\>** | 512 EU/t | Elite storage (10M EU). Metadata 74\.5 |

#### **2.2.4 Miscellaneous Resource Items**

Items used as crafting components often reside in the ic2:itemmisc or ic2:resource registries.

* **Machine Casing (Basic):** \<ic2:resource:1\> (Often Basic Machine Casing)  
* **Advanced Machine Casing:** \<ic2:resource:13\>.8  
* **Electronic Circuit:** \<ic2:itemcrafting:1\>  
* **Advanced Circuit:** \<ic2:itemcrafting:2\>

### **2.3 CraftTweaker Implementation Strategy**

Modifying recipes in IC2 Classic 1.12.2 requires a distinct approach compared to Experimental. While the mods.ic2 package exists, its functionality is often limited to specific machine handlers that were ported over.

#### **2.3.1 Valid CraftTweaker Syntax**

To remove a recipe for the Macerator (Item ID \<ic2:te:4\>) and replace it with a harder version, use the standard recipe removal syntax, as the machine block itself is a standard crafting table output.

ZenScript

// FILE: scripts/ic2\_machines.zs  
import crafttweaker.item.IItemStack;

// Define the Macerator item using the verified Classic ID  
val macerator \= \<ic2:te:4\>;

// Remove the default recipe  
recipes.remove(macerator);

// Add a new Expert Mode recipe requiring Diamonds and heavy plating  
recipes.addShaped("expert\_macerator", macerator, \[\<minecraft:flint\>, \<minecraft:diamond\>, \<minecraft:flint\>\],  
    \[\<minecraft:cobblestone\>, \<ic2:resource:1\>, \<minecraft:cobblestone\>\], // resource:1 \= Machine Case  
    \[\<minecraft:iron\_ingot\>, \<ic2:itemcrafting:1\>, \<minecraft:iron\_ingot\>\] // itemcrafting:1 \= Circuit  
\]);

#### **2.3.2 Modifying Machine Processing Recipes**

A critical limitation in IC2 Classic is that standard CraftTweaker mods.ic2.Macerator.addRecipe commands may fail if the specific bridge mod (IC2ClassicTweaker) is not installed or if the internal API differs from the Experimental expectation.9

**Preferred Method: Config-Based Modification**

IC2 Classic uniquely exposes its machine recipes via JSON configuration files, which is often more reliable than ZenScript for this specific mod.

* **Location:** config/ic2/ic2machineRecipes.json (or similar naming convention in config/ic2/).  
* **Action:** Edit this file to remove default processing recipes or add new ones. This ensures the recipes are registered at the correct engine stage, preventing the "Recipe not found" errors common with CraftTweaker's post-init loading.10

**Secondary Method: ZenScript (If Supported)**

If utilizing IC2ClassicTweaker or a compatible ModTweaker version:

ZenScript

import mods.ic2.Macerator;

// Syntax: Output, Input  
// Macerating Blazefire Rods (from a hypothetical mod) into Blaze Powder  
Macerator.addRecipe(\<minecraft:blaze\_powder\> \* 5, \<mod:blazefire\_rod\>);

*Note: Always verify recipe addition via the JEI interface after reloading.*

### **2.4 Methodology for Accurate ID Dumping**

Given that metadata values can shift based on the installation of other mods (conflicting IDs) or specific sub-versions of IC2 Classic, a static list is never 100% strictly guaranteed. The development workflow must include a "Dumping Phase."

**Recommended Command Sequence:**

1. **Hand Dump:** Hold the target item (e.g., the Macerator) and execute /ct hand. This prints the exact \<modid:item:meta\> string to the chat and the crafttweaker.log file.11  
2. **Inventory Dump:** Fill your inventory with every machine, transformer, and generator from the Creative menu. Execute /ct inventory. This dumps the entire list to the log file, allowing for rapid copy-pasting of all registry names in a single batch.11  
3. **Ore Dictionary Dump:** Execute /ct oredict to generate a list of all ore tags. This is crucial for cross-mod compatibility (e.g., ensuring ore:circuitBasic works for both IC2 and Mekanism circuits).12

## ---

**3\. Medium Priority: Environmental Tech 2.0.20.1 Technical Reference**

Environmental Tech (ET) creates a distinct progression tier in 1.12.2 modpacks, focusing on multiblock structures that generate resources from "the void" in exchange for massive RF (Redstone Flux) investment. In version 2.0.20.1, the mod underwent a significant architectural shift, moving strictly to JSON-based configuration for ore generation and abandoning hardcoded drop tables.

### **3.1 Component Registry Reference**

Scripts for EnergyCraft will likely need to gate ET controllers behind other tech mods (e.g., requiring Draconic Evolution cores for high-tier controllers). The following registry names are the precise identifiers for ET 2.0.20.1.

#### **3.1.1 Void Miner Controllers**

These blocks are the "brain" of the multiblock and the primary target for recipe modification.13

| Component | Registry Name | Progression Note |
| :---- | :---- | :---- |
| **Ore Miner Controller Tier 1** | environmentaltech:void\_ore\_miner\_cont\_1 | Requires Litherite. |
| **Ore Miner Controller Tier 2** | environmentaltech:void\_ore\_miner\_cont\_2 | Requires Erodium. |
| **Ore Miner Controller Tier 3** | environmentaltech:void\_ore\_miner\_cont\_3 | Requires Kyronite. |
| **Ore Miner Controller Tier 4** | environmentaltech:void\_ore\_miner\_cont\_4 | Requires Pladium. |
| **Ore Miner Controller Tier 5** | environmentaltech:void\_ore\_miner\_cont\_5 | Requires Ionite. |
| **Ore Miner Controller Tier 6** | environmentaltech:void\_ore\_miner\_cont\_6 | Requires Aethium. |
| **Resource Miner Cont. T1-6** | environmentaltech:void\_res\_miner\_cont\_\[1-6\] | Follows same pattern. |

#### **3.1.2 Crystals and Structure Components**

Progression in ET is gated by crystals that can *only* be obtained by the Void Miner itself.

| Item/Block | Registry Name | Usage |
| :---- | :---- | :---- |
| **Litherite Crystal** | environmentaltech:litherite\_crystal | Tier 1 Crafting.14 |
| **Erodium Crystal** | environmentaltech:erodium\_crystal | Tier 2 Crafting. |
| **Kyronite Crystal** | environmentaltech:kyronite\_crystal | Tier 3 Crafting. |
| **Pladium Crystal** | environmentaltech:pladium\_crystal | Tier 4 Crafting. |
| **Ionite Crystal** | environmentaltech:ionite\_crystal | Tier 5 Crafting. |
| **Aethium Crystal** | environmentaltech:aethium\_crystal | Tier 6 Crafting. |
| **Structure Frame** | environmentaltech:structure\_frame\_\[1-6\] | Multiblock frame. |
| **Structure Panel** | environmentaltech:structure\_panel | Universal casing. |
| **Laser Core** | environmentaltech:laser\_core | Beam logic. |
| **Laser Lens** | environmentaltech:laser\_lens | Output modifier (colored). |

### **3.2 Configuration and Power Consumption**

ET 2.0.20.1 handles power consumption and generation speeds through the main configuration file, typically located at config/environmentaltech/common.cfg.

**Power Scaling Logic:**

The power consumption is not a static number but a base value modified by the tier and any installed speed upgrades.

* **Base Tier 1 Cost:** Approximately **660 RF/t**.15  
* **Scaling:** Each tier increases the base requirement significantly.  
* **Expert Mode Recommendation:** In expert packs, it is standard practice to increase the void\_ore\_miner\_power\_modifier in the config file. Increasing this by a factor of 4x or 10x forces players to develop robust power infrastructure (e.g., Extreme Reactors or Draconic Fusion) before they can indefinitely generate resources, preventing the miners from trivializing the resource economy too early.16

**Solar Array Configuration:** Solar arrays in ET are potent. Controllers range from environmentaltech:solar\_cont\_1 to 6\.17 In expert modes, these are often nerfed or gated heavily because a Tier 6 solar array can output millions of RF/t with zero maintenance, rendering other power generation mods obsolete.

### **3.3 Void Miner Ore Tables: The JSON System**

The most powerful feature of ET 2.0.20.1 for modpack developers is the JSON-based loot table system. This allows for the injection of modded ores (Uranium, Draconium, Yellorium) into the miner's output.

#### **3.3.1 JSON File Structure**

The drop tables are located in: config/environmentaltech/multiblocks/void\_miner/ore/.

Files are typically named tier\_1.json, tier\_2.json, etc.

**Critical Implementation Detail:** If these files do not exist, the mod generates them on the first launch. If you need to reset them to defaults (e.g., after a mod update), you must delete the folder and restart the game.18

#### **3.3.2 Customizing Drops (Example)**

To add **Draconium Ore** to the Tier 6 miner with a low probability, requiring a purple lens:

JSON

{  
  "item": {  
    "id": "draconicevolution:draconium\_ore",  
    "damage": 0,  
    "count": 1  
  },  
  "weight": 20,  
  "laser": "purple"  
}

* **id**: Registry name of the target ore.  
* **damage**: Metadata value (0 for standard ores).  
* **weight**: The probability weight relative to other items in the table. Standard ores are often 100-500; rare ores should be 10-50.  
* **laser**: The specific lens color required to maximize the drop chance. Setting this allows for "Focus Mining" logic, rewarding players who swap lenses for specific resource needs.

**Insight on Erodium Generation:** A common bottleneck in ET progression is the acquisition of Erodium (Tier 2 crystal) to upgrade from Tier 1\. The default weight is extremely low. Increasing the weight of environmentaltech:erodium\_crystal in tier\_1.json is a recommended quality-of-life change for expert packs to smooth the transition curve.19

## ---

**4\. Low Priority: Draconic Evolution Armor Balance**

Draconic Evolution (DE) introduces end-game equipment that operates on a "Shield Buffer" mechanic rather than standard damage reduction. This presents a unique balancing challenge: as long as the armor has RF, the player is effectively invincible. In an expert pack, this trivializes PvE content (bosses, dungeons) and disrupts PvP balance.

### **4.1 The Balance Problem: Effective HP vs. Power Storage**

Standard Minecraft armor reduces damage by a percentage (e.g., 80% for Diamond). Draconic Armor absorbs **100%** of damage into its internal RF buffer.

* **Wyvern Armor**: High capacity (4M+ RF), moderate recharge.  
* **Draconic Armor**: Massive capacity (16M+ RF), prevents death via "Last Stand" (consuming 10M RF to stop a fatal blow).20  
* **Integration Risk**: With mods like *Flux Networks* allowing wireless inventory charging, a player can connect their armor to a massive battery bank (e.g., 100 Billion RF), making them mathematically unkillable.

### **4.2 Configuration Options for Nerfing**

The primary tool for balancing is the DraconicEvolution.cfg file, specifically the "Stat Tweaks" section.21

#### **4.2.1 Critical Config Parameters & Recommendations**

| Parameter | Function | Expert Mode Recommendation | Rationale |
| :---- | :---- | :---- | :---- |
| I:draconicBaseShieldCapacity | Sets base shield points (Default: 512). | **Reduce to 64 or 128\.** | Lower capacity ensures the shield can be broken by burst damage, forcing players to use cover/strategy rather than face-tanking. |
| I:wyvernBaseShieldCapacity | Sets Wyvern base shield. | **Reduce to 32\.** | Keeps Wyvern armor comparable to top-tier Thermal Expansion armor, preventing it from obsolescing other tech trees too early. |
| I:draconicBaseRFCapacity | Total energy buffer size. | **Reduce by 10x (1.6M).** | Reduces the "infinite health" buffer. Players must rely on recharge rates, which can be capped. |
| I:draconicShieldRechargeCost | RF cost to regen 1 shield point. | **Increase to 10,000+ RF.** | Makes sustaining the shield under fire extremely expensive, draining reserves quickly during combat. |
| D:flightSpeedModifier | Flight speed multiplier. | **Cap at 1.5.** | Prevents server lag caused by players generating chunks too quickly.22 |
| I:flightSpeedLimit | Hard cap on movement. | **Set to 200%.** | Enforces the speed cap regardless of upgrades. |

### **4.3 Gating Strategies and Community Consensus**

Expert packs like *Enigmatica 2 Expert* (E2E) and *Project Ozone 3* do not rely solely on config nerfs. They employ **Recipe Gating** to delay the acquisition of DE gear until the very end of the game.23

**Strategy 1: The Fusion Gate**

Modify recipes to require **Extended Crafting** tables (7x7 or 9x9).

* *Implementation:* The Wyvern Chestplate should require components from other completed tech trees, such as IC2 Iridium Plates, Environmental Tech Tier 6 Crystals, and Empress of Light drops (DivineRPG) or similar boss loot.  
* *Effect:* This ensures that by the time a player obtains Draconic Armor, they have effectively "beaten" the content that the armor would otherwise trivialize.

**Strategy 2: The "Glass Cannon" Approach**

Nerf the shield capacity to near-zero via config, but leave the utility perks (Flight, Night Vision, Speed) intact.

* *Effect:* Players use the armor for travel and building but must rely on other mods (e.g., Astral Sorcery Mantles or constructable shields) for actual combat defense.

**Strategy 3: The "Disable" Approach** For packs focusing on combat difficulty, disabling the armor recipes entirely (via CraftTweaker recipes.remove) while leaving the tools/weapons enabled is a valid option. This removes the "Last Stand" mechanic, forcing players to manage health and potions.20

### **4.4 Implementing the Nerf (Script Logic)**

To enforce the "Fusion Gate" strategy:

ZenScript

// Remove default Wyvern Chestplate recipe  
recipes.remove(\<draconicevolution:wyvern\_chest\>);

// Note: Add new recipe via Extended Crafting scripts or Fusion Crafting JSONs  
// Example Logic: Require IC2 Iridium and ET Aethium  
// This binds DE progression to the mastery of IC2 and ET.

## **5\. Conclusion**

The stability and balance of EnergyCraft rely on the precise handling of these three mods. **IC2 Classic** demands a departure from standard Experimental registry habits, utilizing ic2:te and metadata dumps. **Environmental Tech** offers powerful JSON-driven customization that should be leveraged to integrate modded ores into the void mining loop. Finally, **Draconic Evolution** requires a two-pronged approach: rigorous config nerfs to shield capacity to maintain combat tension, and recipe gating to position it as the ultimate reward for mastering the pack's other tech trees. Adhering to these technical specifications will result in a cohesive, challenging, and stable player experience.

#### **Works cited**

1. \[Заявка\] Краш \+ Ошибка java | Hitech 1.12.2 \#2 \- Тех. Поддержка \- McSkill, accessed February 2, 2026, [https://mcskill.net/mcforum/index.php?/topic/134728-%D0%B7%D0%B0%D1%8F%D0%B2%D0%BA%D0%B0-%D0%BA%D1%80%D0%B0%D1%88-%D0%BE%D1%88%D0%B8%D0%B1%D0%BA%D0%B0-java-hitech-1122-2/](https://mcskill.net/mcforum/index.php?/topic/134728-%D0%B7%D0%B0%D1%8F%D0%B2%D0%BA%D0%B0-%D0%BA%D1%80%D0%B0%D1%88-%D0%BE%D1%88%D0%B8%D0%B1%D0%BA%D0%B0-java-hitech-1122-2/)  
2. Help\! Custom modpack server crash \- Support & Bug Reports \- Forge Forums, accessed February 2, 2026, [https://forums.minecraftforge.net/topic/78028-help-custom-modpack-server-crash/](https://forums.minecraftforge.net/topic/78028-help-custom-modpack-server-crash/)  
3. \[Заявка\] Краш на спавне | HiTech 1.12.2 \- Тех. Поддержка \- McSkill \- MineCraft Форум, accessed February 2, 2026, [https://mcskill.net/mcforum/index.php?/topic/133405-%D0%B7%D0%B0%D1%8F%D0%B2%D0%BA%D0%B0-%D0%BA%D1%80%D0%B0%D1%88-%D0%BD%D0%B0-%D1%81%D0%BF%D0%B0%D0%B2%D0%BD%D0%B5-hitech-1122/](https://mcskill.net/mcforum/index.php?/topic/133405-%D0%B7%D0%B0%D1%8F%D0%B2%D0%BA%D0%B0-%D0%BA%D1%80%D0%B0%D1%88-%D0%BD%D0%B0-%D1%81%D0%BF%D0%B0%D0%B2%D0%BD%D0%B5-hitech-1122/)  
4. minecraft 1.12.2 mod server plz help \- Support & Bug Reports \- Forge Forums, accessed February 2, 2026, [https://forums.minecraftforge.net/topic/85846-minecraft-1122-mod-server-plz-help/](https://forums.minecraftforge.net/topic/85846-minecraft-1122-mod-server-plz-help/)  
5. Recipes and Resources (classic) \- Industrial-Craft-Wiki, accessed February 2, 2026, [https://wiki.industrial-craft.net/index.php?title=Recipes\_and\_Resources\_(classic)](https://wiki.industrial-craft.net/index.php?title=Recipes_and_Resources_\(classic\))  
6. Recipes and Resources (experimental) \- Industrial-Craft-Wiki, accessed February 2, 2026, [https://wiki.industrial-craft.net/index.php?title=Recipes\_and\_Resources\_%28experimental%29](https://wiki.industrial-craft.net/index.php?title=Recipes_and_Resources_\(experimental\))  
7. Geothermal Generator | The Tekkit Classic Wiki \- Fandom, accessed February 2, 2026, [https://tekkitclassic.fandom.com/wiki/Geothermal\_Generator](https://tekkitclassic.fandom.com/wiki/Geothermal_Generator)  
8. Advanced Machine Casing \- Industrial-Craft-Wiki, accessed February 2, 2026, [https://wiki.industrial-craft.net/index.php?title=Advanced\_Machine\_Casing](https://wiki.industrial-craft.net/index.php?title=Advanced_Machine_Casing)  
9. Items \- CraftTweaker Documentation, accessed February 2, 2026, [https://docs.blamejared.com/1.12/en/Mods/CompatSkills/Requirements/Requirement\_Types/Items/](https://docs.blamejared.com/1.12/en/Mods/CompatSkills/Requirements/Requirement_Types/Items/)  
10. Macerator \- CraftTweaker Documentation, accessed February 2, 2026, [https://docs.blamejared.com/1.12/en/Mods/IC2Tweaker/Macerator/](https://docs.blamejared.com/1.12/en/Mods/IC2Tweaker/Macerator/)  
11. Pack authors, how do you work on CraftTweaker scripts without the /reload feature? \- Reddit, accessed February 2, 2026, [https://www.reddit.com/r/feedthebeast/comments/e9syxo/pack\_authors\_how\_do\_you\_work\_on\_crafttweaker/](https://www.reddit.com/r/feedthebeast/comments/e9syxo/pack_authors_how_do_you_work_on_crafttweaker/)  
12. Commands \- CraftTweaker Documentation, accessed February 2, 2026, [https://docs.blamejared.com/1.12/en/Vanilla/Commands/](https://docs.blamejared.com/1.12/en/Vanilla/Commands/)  
13. E2E-E items for craft tree \- GitHub Gist, accessed February 2, 2026, [https://gist.github.com/Krutoy242/0876b9b252f84aa1670d1024ac033664](https://gist.github.com/Krutoy242/0876b9b252f84aa1670d1024ac033664)  
14. Environmental Tech \- Blocks Required List \- Feed the Beast forums, accessed February 2, 2026, [https://forum.feed-the-beast.com/threads/environmental-tech-blocks-required-list.263949/](https://forum.feed-the-beast.com/threads/environmental-tech-blocks-required-list.263949/)  
15. Environmental tech 1.12 numbers : r/feedthebeast \- Reddit, accessed February 2, 2026, [https://www.reddit.com/r/feedthebeast/comments/7hqcjx/environmental\_tech\_112\_numbers/](https://www.reddit.com/r/feedthebeast/comments/7hqcjx/environmental_tech_112_numbers/)  
16. Environmental Tech \- All The Guides, accessed February 2, 2026, [https://allthemods.github.io/alltheguides/atm6/envtech/](https://allthemods.github.io/alltheguides/atm6/envtech/)  
17. Enigmatica 2 Expert: Environmental Tech Solar Array values : r/feedthebeast \- Reddit, accessed February 2, 2026, [https://www.reddit.com/r/feedthebeast/comments/emw1i7/enigmatica\_2\_expert\_environmental\_tech\_solar/](https://www.reddit.com/r/feedthebeast/comments/emw1i7/enigmatica_2_expert_environmental_tech_solar/)  
18. Void ore miner tier 1 setup, accessed February 2, 2026, [https://assets-global.website-files.com/6869058c194ed8c27e80d18f/68747f76dd7dd8df434c5706\_64396784180.pdf](https://assets-global.website-files.com/6869058c194ed8c27e80d18f/68747f76dd7dd8df434c5706_64396784180.pdf)  
19. \[Ragnamod VI \- Environmental Tech\] How to get Erodium crystals? : r/feedthebeast \- Reddit, accessed February 2, 2026, [https://www.reddit.com/r/feedthebeast/comments/xvg90m/ragnamod\_vi\_environmental\_tech\_how\_to\_get\_erodium/](https://www.reddit.com/r/feedthebeast/comments/xvg90m/ragnamod_vi_environmental_tech_how_to_get_erodium/)  
20. Draconic Energy Shield Last Stand Ability · Issue \#616 \- GitHub, accessed February 2, 2026, [https://github.com/brandon3055/Draconic-Evolution/issues/616](https://github.com/brandon3055/Draconic-Evolution/issues/616)  
21. stoneBlock/config/brandon3055/DraconicEvolution.cfg at master \- GitHub, accessed February 2, 2026, [https://github.com/Sunekaer/stoneBlock/blob/master/config/brandon3055/DraconicEvolution.cfg](https://github.com/Sunekaer/stoneBlock/blob/master/config/brandon3055/DraconicEvolution.cfg)  
22. Draconic Flight Speed · Issue \#1140 \- GitHub, accessed February 2, 2026, [https://github.com/brandon3055/Draconic-Evolution/issues/1140](https://github.com/brandon3055/Draconic-Evolution/issues/1140)  
23. Starting Draconic Evolution\! | Minecraft: E2E ep.39 \- YouTube, accessed February 2, 2026, [https://www.youtube.com/watch?v=J2xA-zH65cw](https://www.youtube.com/watch?v=J2xA-zH65cw)  
24. Enigmatica 2: Expert \- Draconic Evolution Armor Upgrades \- Partial Automation AE2 | E05, accessed February 2, 2026, [https://www.youtube.com/watch?v=OLmcWcIZNPk](https://www.youtube.com/watch?v=OLmcWcIZNPk)