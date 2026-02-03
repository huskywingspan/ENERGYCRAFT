# Era VI: Ascension - Quest Implementation Guide

> **Purpose:** Step-by-step instructions for implementing Era VI quests in Better Questing
> **Total Quests:** ~22-24 (estimated)
> **Theme:** End-game power, transmutation, dimensional technology, ultimate goals
> **Prereq:** Era V Complete (Quest 86)

---

## Overview

Era VI is the **culmination** of the EnergyCraft journey. Players have mastered:
- Basic survival and tools (Era I)
- Steam and early power (Era II)
- Industrial electricity (Era III)
- Automated logistics (Era IV)
- Nuclear engineering (Era V)

Now they transcend into **god-tier technology:**

1. **Draconic Evolution** - Energy cores, armor, tools from another dimension
2. **ProjectE** - Transmutation and equivalent exchange
3. **Environmental Tech** - Void miners, solar arrays, lightning rods
4. **Ultimate Goals** - Creative-adjacent power levels

### Design Philosophy

Era VI should feel like **graduation**. The player has EARNED this:

- **Awe-Inspiring:** First Energy Core should feel MASSIVE
- **Expensive:** Costs should be significant but achievable
- **Powerful:** Rewards should feel game-changing
- **Optional Branches:** ProjectE vs Draconic vs Environmental Tech paths
- **Victory Lap:** Celebrate the journey, provide closure

**Key Teaching Points:**
- Draconium is the new endgame resource
- Energy Cores scale to absurd capacities
- Transmutation has limits (EMC gating)
- There's always one more goal...

---

## Pre-Implementation Research

### Draconic Evolution Item IDs

> **NOTE:** Verify all IDs with `/ct hand` in-game before implementation!

#### Core Resources

| Item | Registry ID | Source |
|------|-------------|--------|
| **Draconium Ore** | `draconicevolution:draconium_ore` | End dimension, rare Overworld |
| **Draconium Dust** | `draconicevolution:draconium_dust` | Ore processing |
| **Draconium Ingot** | `draconicevolution:draconium_ingot` | Smelted dust |
| **Draconium Block** | `draconicevolution:draconium_block` | 9 ingots |
| **Awakened Draconium** | `draconicevolution:draconic_ingot` | Ritual crafting |
| **Awakened Draconium Block** | `draconicevolution:draconic_block` | 9 awakened ingots |
| **Dragon Heart** | `draconicevolution:dragon_heart` | Ender Dragon drop |
| **Wyvern Core** | `draconicevolution:wyvern_core` | Tier 1 crafting core |
| **Awakened Core** | `draconicevolution:awakened_core` | Tier 2 crafting core |
| **Draconic Core** | `draconicevolution:draconic_core` | Tier 3 crafting core |
| **Chaos Shard** | `draconicevolution:chaos_shard` | Chaos Guardian drop |

#### Energy Storage

| Component | Registry ID | Capacity |
|-----------|-------------|----------|
| **Energy Core** | `draconicevolution:energy_storage_core` | Core block |
| **Energy Pylon** | `draconicevolution:energy_pylon` | Energy I/O |
| **Particle Generator** | `draconicevolution:particle_generator` | Stabilization |
| **Basic Energy Relay** | `draconicevolution:energy_relay_basic` | Wireless energy |
| **Wyvern Energy Relay** | `draconicevolution:energy_relay_wyvern` | Better relay |
| **Draconic Energy Relay** | `draconicevolution:energy_relay_draconic` | Best relay |

#### Tools & Weapons

| Item | Registry ID | Tier |
|------|-------------|------|
| **Wyvern Pickaxe** | `draconicevolution:wyvern_pick` | Tier 1 |
| **Wyvern Sword** | `draconicevolution:wyvern_sword` | Tier 1 |
| **Wyvern Bow** | `draconicevolution:wyvern_bow` | Tier 1 |
| **Draconic Pickaxe** | `draconicevolution:draconic_pick` | Tier 2 |
| **Draconic Sword** | `draconicevolution:draconic_sword` | Tier 2 |
| **Draconic Bow** | `draconicevolution:draconic_bow` | Tier 2 |
| **Draconic Staff of Power** | `draconicevolution:draconic_staff_of_power` | Ultimate |

#### Armor

| Item | Registry ID | Tier |
|------|-------------|------|
| **Wyvern Helm** | `draconicevolution:wyvern_helm` | Tier 1 |
| **Wyvern Chest** | `draconicevolution:wyvern_chest` | Tier 1 |
| **Wyvern Legs** | `draconicevolution:wyvern_legs` | Tier 1 |
| **Wyvern Boots** | `draconicevolution:wyvern_boots` | Tier 1 |
| **Draconic Helm** | `draconicevolution:draconic_helm` | Tier 2 |
| **Draconic Chest** | `draconicevolution:draconic_chest` | Tier 2 |
| **Draconic Legs** | `draconicevolution:draconic_legs` | Tier 2 |
| **Draconic Boots** | `draconicevolution:draconic_boots` | Tier 2 |

#### Machines

| Machine | Registry ID | Function |
|---------|-------------|----------|
| **Fusion Crafting Core** | `draconicevolution:fusion_crafting_core` | Advanced crafting |
| **Basic Fusion Injector** | `draconicevolution:crafting_injector:0` | Tier 1 crafting |
| **Wyvern Fusion Injector** | `draconicevolution:crafting_injector:1` | Tier 2 crafting |
| **Awakened Fusion Injector** | `draconicevolution:crafting_injector:2` | Tier 3 crafting |
| **Draconic Chest** | `draconicevolution:draconic_chest` | Massive storage |
| **Dislocator Receptacle** | `draconicevolution:dislocator_receptacle` | Teleportation |
| **Celestial Manipulator** | `draconicevolution:celestial_manipulator` | Weather/time |

---

### ProjectE Item IDs

> **NOTE:** ProjectE should be GATED - not available until late Era VI!

#### Core Items

| Item | Registry ID | Function |
|------|-------------|----------|
| **Philosopher's Stone** | `projecte:item.pe_philosophers_stone` | Basic transmutation |
| **Transmutation Table** | `projecte:transmutation_table` | Manual EMC conversion |
| **Energy Condenser** | `projecte:condenser_mk1` | Auto EMC conversion |
| **Energy Condenser MK2** | `projecte:condenser_mk2` | Fast conversion |
| **Alchemical Coal** | `projecte:item.pe_fuel:0` | EMC fuel tier 1 |
| **Mobius Fuel** | `projecte:item.pe_fuel:1` | EMC fuel tier 2 |
| **Aeternalis Fuel** | `projecte:item.pe_fuel:2` | EMC fuel tier 3 |
| **Klein Star Ein** | `projecte:item.pe_klein_star:0` | EMC storage |
| **Klein Star Zwei** | `projecte:item.pe_klein_star:1` | Better EMC storage |
| **Klein Star Drei** | `projecte:item.pe_klein_star:2` | Even better |
| **Klein Star Vier** | `projecte:item.pe_klein_star:3` | Great EMC storage |
| **Klein Star Sphere** | `projecte:item.pe_klein_star:4` | Maximum EMC storage |

#### Matter

| Item | Registry ID | EMC Value |
|------|-------------|-----------|
| **Low Covalence Dust** | `projecte:item.pe_covalence_dust:0` | 1 |
| **Medium Covalence Dust** | `projecte:item.pe_covalence_dust:1` | 576 |
| **High Covalence Dust** | `projecte:item.pe_covalence_dust:2` | 6,144 |
| **Dark Matter** | `projecte:item.pe_matter:0` | 139,264 |
| **Red Matter** | `projecte:item.pe_matter:1` | 466,944 |

#### Equipment

| Item | Registry ID | Notes |
|------|-------------|-------|
| **Dark Matter Pickaxe** | `projecte:item.pe_dm_pick` | 3x3 mining |
| **Dark Matter Sword** | `projecte:item.pe_dm_sword` | Powerful melee |
| **Red Matter Pickaxe** | `projecte:item.pe_rm_pick` | Configurable AOE |
| **Red Matter Sword** | `projecte:item.pe_rm_sword` | Best sword |
| **Dark Matter Armor** | `projecte:item.pe_dm_armor_*` | Strong armor |
| **Red Matter Armor** | `projecte:item.pe_rm_armor_*` | Best armor |
| **Gem Armor** | `projecte:item.pe_gem_armor_*` | Flight, invincibility |

---

### Environmental Tech Item IDs

> **NOTE:** ET provides passive power and resource generation

#### Solar Arrays

| Tier | Registry ID | RF/t |
|------|-------------|------|
| **Solar Array T1** | `environmentaltech:solar_cont_1` | Low |
| **Solar Array T2** | `environmentaltech:solar_cont_2` | Medium |
| **Solar Array T3** | `environmentaltech:solar_cont_3` | Good |
| **Solar Array T4** | `environmentaltech:solar_cont_4` | Great |
| **Solar Array T5** | `environmentaltech:solar_cont_5` | Excellent |
| **Solar Array T6** | `environmentaltech:solar_cont_6` | Maximum |

#### Void Miners

| Tier | Registry ID | Function |
|------|-------------|----------|
| **Void Ore Miner T1** | `environmentaltech:void_ore_miner_cont_1` | Basic mining |
| **Void Ore Miner T2** | `environmentaltech:void_ore_miner_cont_2` | Better mining |
| **Void Ore Miner T3** | `environmentaltech:void_ore_miner_cont_3` | Good mining |
| **Void Ore Miner T4** | `environmentaltech:void_ore_miner_cont_4` | Great mining |
| **Void Ore Miner T5** | `environmentaltech:void_ore_miner_cont_5` | Excellent mining |
| **Void Ore Miner T6** | `environmentaltech:void_ore_miner_cont_6` | Maximum mining |

#### Other Multiblocks

| Machine | Registry ID | Function |
|---------|-------------|----------|
| **Void Resource Miner** | `environmentaltech:void_res_miner_cont_*` | Generates resources |
| **Lightning Rod** | `environmentaltech:lightning_cont_*` | Lightning power |

---

## Quest Structure

Era VI has **four major branches** that converge at the finale:

```
                    [WELCOME TO ASCENSION]
                            |
                   [DRACONIUM DISCOVERY]
                            |
                    [FUSION CRAFTING]
                            |
        ┌───────────────────┼───────────────────┐
        ↓                   ↓                   ↓
  [DRACONIC PATH]    [PROJECTE PATH]    [ENVIRONMENTAL PATH]
   (6 quests)         (5 quests)          (4 quests)
        |                   |                   |
        |     [WYVERN GEAR] |                   |
        |          |        |                   |
        |   [DRACONIC GEAR] |                   |
        |          |        |                   |
        └──────────┼────────┴───────────────────┘
                   ↓
            [CHAOS GUARDIAN]
                   |
            [ULTIMATE POWER]
                   |
           [ERA VI COMPLETE]
                   |
            [VICTORY LAP]
```

---

## Quest Specifications

### INTRODUCTION

#### Quest 87: Welcome to Ascension
**Position:** Center (0, 0)
**Quest ID:** 87
**Prerequisite:** Quest 86 (Era V Complete)

| Property | Value |
|----------|-------|
| **Name** | Welcome to Ascension |
| **Icon** | `draconicevolution:draconic_core` |
| **Description** | "Engineer, you have achieved what few dare attempt.\n\nYou've mined with stone tools. Generated power from coal. Split the atom itself.\n\nNow you stand at the threshold of ASCENSION.\n\nEra VI offers technology beyond mortal comprehension:\n\n🐉 **Draconic Evolution** - Harness dragon essence for limitless energy storage and god-tier equipment\n\n⚗️ **ProjectE** - Master equivalent exchange and transmute matter itself\n\n🌍 **Environmental Tech** - Build multiblock machines that harvest the void\n\nThree paths. All lead to ultimate power.\n\nChoose your destiny, Engineer. The universe awaits." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Accept your destiny |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:dragon_breath` | 16 |
| Item | `minecraft:end_crystal` | 4 |
| XP | 500 XP | - |

---

#### Quest 88: The End Dimension
**Position:** (0, 48)
**Quest ID:** 88
**Prerequisite:** Quest 87

| Property | Value |
|----------|-------|
| **Name** | Journey to The End |
| **Icon** | `minecraft:end_portal_frame` |
| **Description** | "Before ascending, you must face The End.\n\n**The End Dimension:**\n- Accessed via End Portal (Stronghold)\n- Home to the Ender Dragon\n- Contains Draconium Ore (essential!)\n- End Cities have valuable loot\n\n**Preparation Checklist:**\n☐ Full diamond armor minimum\n☐ Bow with 2+ stacks of arrows\n☐ Ender Pearls for navigation\n☐ Blocks for pillaring\n☐ Pumpkin head (Endermen ignore you)\n☐ Water bucket (clutch saves)\n\nThe Ender Dragon awaits. This is your first step to Draconic power." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Location | The End dimension | Visit |
| Retrieval | `minecraft:dragon_egg` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:elytra` | 1 |
| Item | `minecraft:shulker_shell` | 16 |
| XP | 1000 XP | - |

---

#### Quest 89: Draconium Discovery
**Position:** (0, 96)
**Quest ID:** 89
**Prerequisite:** Quest 88

| Property | Value |
|----------|-------|
| **Name** | Draconium Ore |
| **Icon** | `draconicevolution:draconium_ore` |
| **Description** | "**Draconium** is the foundation of Draconic Evolution!\n\n**Finding Draconium:**\n- Common in The End (outer islands)\n- Very rare in Overworld (deep underground)\n- Even rarer in Nether\n\n**Processing:**\n1. Mine with Diamond+ pickaxe\n2. Smelt ore → Draconium Dust\n3. Smelt dust → Draconium Ingot\n\n**Or use machines:**\n- Macerator: 2 dust per ore\n- Thermal Centrifuge: Bonus materials\n\nYou'll need LOTS of Draconium. Start stockpiling now!\n\nTip: The outer End islands (past the gateway) have the most ore." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `draconicevolution:draconium_ore` | 32 |
| Retrieval | `draconicevolution:draconium_ingot` | 16 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:draconium_ingot` | 32 |
| Item | `draconicevolution:draconium_dust` | 16 |

---

#### Quest 90: Fusion Crafting
**Position:** (0, 144)
**Quest ID:** 90
**Prerequisite:** Quest 89

| Property | Value |
|----------|-------|
| **Name** | Fusion Crafting Core |
| **Icon** | `draconicevolution:fusion_crafting_core` |
| **Description** | "The **Fusion Crafting Core** is the heart of Draconic crafting!\n\n**How Fusion Crafting Works:**\n1. Place Fusion Core in center\n2. Surround with Fusion Injectors (at least 4)\n3. Injectors can be up to 16 blocks away\n4. Each injector holds one ingredient\n5. Place main ingredient in Core\n6. Apply redstone signal to start\n7. Requires MASSIVE power!\n\n**Injector Tiers:**\n- Basic: Tier 1 recipes\n- Wyvern: Tier 2 recipes\n- Awakened: Tier 3 recipes (Draconic gear)\n\nBuild your first Fusion setup - this is how you'll craft everything in this era." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:fusion_crafting_core` | 1 |
| Crafting | `draconicevolution:crafting_injector:0` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:crafting_injector:0` | 4 |
| Item | `draconicevolution:wyvern_core` | 2 |
| XP | 500 XP | - |

---

### DRACONIC PATH - Energy Storage

#### Quest 91: First Energy Core
**Position:** (-96, 192)
**Quest ID:** 91
**Prerequisite:** Quest 90

| Property | Value |
|----------|-------|
| **Name** | Draconic Energy Core |
| **Icon** | `draconicevolution:energy_storage_core` |
| **Description** | "The **Energy Core** is Draconic Evolution's legendary energy storage!\n\n**Tier 1 Core (Basic):**\n- 45.5 MILLION RF capacity\n- 3x3x3 inner structure\n- Requires Energy Pylons for I/O\n\n**Building the Core:**\n1. Place Energy Storage Core (center)\n2. Build 3x3x3 frame of Draconium Blocks around it\n3. Leave the 6 face centers EMPTY\n4. Place Particle Generators in corners\n5. Place Energy Pylons facing the core\n6. Right-click core to activate\n\n**The core will VISUALIZE stored energy!**\n\nThis single multiblock stores more than a thousand MFSUs." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:energy_storage_core` | 1 |
| Crafting | `draconicevolution:energy_pylon` | 2 |
| Crafting | `draconicevolution:particle_generator` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:draconium_block` | 8 |
| Item | `draconicevolution:energy_pylon` | 2 |
| XP | 750 XP | - |

---

#### Quest 92: Core Expansion
**Position:** (-96, 240)
**Quest ID:** 92
**Prerequisite:** Quest 91

| Property | Value |
|----------|-------|
| **Name** | Energy Core Tiers |
| **Icon** | `draconicevolution:particle_generator` |
| **Description** | "Energy Cores can be EXPANDED for exponentially more storage!\n\n**Core Tiers:**\n| Tier | Inner Size | Capacity |\n|------|------------|----------|\n| 1 | 3x3x3 | 45.5M RF |\n| 2 | 5x5x5 | 273M RF |\n| 3 | 7x7x7 | 1.64B RF |\n| 4 | 9x9x9 | 9.88B RF |\n| 5 | 11x11x11 | 59.3B RF |\n| 6 | 13x13x13 | 355B RF |\n| 7 | 15x15x15 | 2.14T RF |\n\n**Scaling Requirements:**\n- Higher tiers need more Draconium blocks\n- More Particle Generators for stability\n- Awakened Draconium for Tier 5+\n\nA Tier 7 core stores more energy than you'll ever need!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `draconicevolution:draconium_block` | 16 |
| Retrieval | `draconicevolution:particle_generator` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:draconium_block` | 16 |
| Item | `draconicevolution:awakened_core` | 1 |
| XP | 500 XP | - |

---

#### Quest 93: Energy Distribution
**Position:** (-96, 288)
**Quest ID:** 93
**Prerequisite:** Quest 92

| Property | Value |
|----------|-------|
| **Name** | Wireless Energy |
| **Icon** | `draconicevolution:energy_relay_wyvern` |
| **Description** | "**Energy Relays** provide WIRELESS energy transfer!\n\n**How Relays Work:**\n- Link relay to Energy Core (right-click pylon)\n- Relay broadcasts energy in radius\n- Machines in range receive power wirelessly\n- Crystals can chain for longer distances\n\n**Relay Tiers:**\n- Basic: Short range, low transfer\n- Wyvern: Medium range, good transfer\n- Draconic: Long range, massive transfer\n\n**Crystal Types:**\n- Energy Relay Crystal: Broadcasts power\n- Wireless Crystal: For player inventory charging\n- Dislocator: Teleportation markers\n\nNo more cable spaghetti - just pure wireless energy!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:energy_relay_basic` | 4 |
| Crafting | `draconicevolution:energy_relay_wyvern` | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:energy_relay_wyvern` | 4 |
| Item | `draconicevolution:dislocator` | 2 |

---

### DRACONIC PATH - Equipment

#### Quest 94: Wyvern Core
**Position:** (-48, 192)
**Quest ID:** 94
**Prerequisite:** Quest 90

| Property | Value |
|----------|-------|
| **Name** | Wyvern Tier |
| **Icon** | `draconicevolution:wyvern_core` |
| **Description** | "**Wyvern** is the first tier of Draconic equipment!\n\n**Wyvern Core Recipe (Fusion):**\n- Core ingredient: Nether Star\n- Injectors: Draconium Ingots, Ender Eyes, more\n- Requires ~500,000 RF\n\nWyvern equipment is already MASSIVELY powerful:\n- Wyvern Pickaxe: Mines 3x3, fast, unbreakable (with power)\n- Wyvern Sword: Huge damage, AOE attack\n- Wyvern Armor: Flight, damage immunity, buffs\n\nCraft your first Wyvern Core - this unlocks all Wyvern-tier items." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:wyvern_core` | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:wyvern_core` | 2 |
| Item | `minecraft:nether_star` | 2 |

---

#### Quest 95: Wyvern Equipment
**Position:** (-48, 240)
**Quest ID:** 95
**Prerequisite:** Quest 94

| Property | Value |
|----------|-------|
| **Name** | Wyvern Gear |
| **Icon** | `draconicevolution:wyvern_pick` |
| **Description** | "Craft your first set of **Wyvern equipment**!\n\n**Wyvern Tools:**\n- **Pickaxe:** 3x3 mining, instant obsidian, AOE mode\n- **Sword:** High damage, AOE sweep attack\n- **Bow:** Rapid fire, explosive arrows, homing\n\n**Wyvern Armor (full set):**\n- Flight (creative-style)\n- Fall damage immunity\n- Fire resistance\n- Jump boost\n- Night vision\n- Shield (absorbs damage)\n\nAll Wyvern gear is POWERED - keep it charged!\n\nCraft a Wyvern Pickaxe to experience the power." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:wyvern_pick` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:wyvern_sword` | 1 |
| Item | `draconicevolution:wyvern_core` | 2 |
| XP | 750 XP | - |

---

#### Quest 96: Awakened Draconium
**Position:** (-48, 288)
**Quest ID:** 96
**Prerequisite:** Quest 95

| Property | Value |
|----------|-------|
| **Name** | Dragon Heart Ritual |
| **Icon** | `draconicevolution:draconic_ingot` |
| **Description** | "**Awakened Draconium** is created through ritual!\n\n**The Awakening Process:**\n1. Build Fusion Crafting setup with Awakened Injectors\n2. Place Draconium Block in Fusion Core\n3. Surround with Dragon Hearts + Draconium Ingots\n4. Apply MASSIVE power (millions of RF)\n5. Draconium transforms into Awakened Draconium!\n\n**Dragon Hearts:**\n- Dropped by Ender Dragon\n- Dragon can be resummoned!\n- 4 End Crystals on exit portal = new dragon\n- Each kill = 1 Dragon Heart\n\nYou'll need many Dragon Hearts for Draconic-tier items." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `draconicevolution:dragon_heart` | 4 |
| Crafting | `draconicevolution:draconic_ingot` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:draconic_ingot` | 16 |
| Item | `draconicevolution:draconic_block` | 2 |
| Item | `draconicevolution:awakened_core` | 2 |

---

#### Quest 97: Draconic Equipment
**Position:** (-48, 336)
**Quest ID:** 97
**Prerequisite:** Quest 96

| Property | Value |
|----------|-------|
| **Name** | Draconic Tier |
| **Icon** | `draconicevolution:draconic_pick` |
| **Description** | "**Draconic** equipment is the ultimate tier!\n\n**Draconic Tools:**\n- **Pickaxe:** Up to 9x9 mining, destroys everything\n- **Sword:** Massive damage, huge AOE, life steal\n- **Bow:** Guided arrows, instant kill modes\n- **Staff of Power:** Pickaxe + Sword + Shovel in one!\n\n**Draconic Armor (full set):**\n- Everything Wyvern has, but BETTER\n- Significantly more shield capacity\n- Better flight speed\n- Chaos damage resistance\n\n**Recipe Requirements:**\n- Awakened Draconium blocks\n- Draconic Cores\n- Chaos Shards (for some items)\n- Tens of millions of RF\n\nCraft the Draconic Pickaxe - the ultimate mining tool." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:draconic_core` | 2 |
| Crafting | `draconicevolution:draconic_pick` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:draconic_chest` | 1 |
| Item | `draconicevolution:draconic_core` | 2 |
| XP | 1000 XP | - |

---

### PROJECTE PATH - Transmutation

#### Quest 98: Equivalent Exchange
**Position:** (48, 192)
**Quest ID:** 98
**Prerequisite:** Quest 90

| Property | Value |
|----------|-------|
| **Name** | Transmutation Begins |
| **Icon** | `projecte:item.pe_philosophers_stone` |
| **Description** | "**ProjectE** introduces TRANSMUTATION - converting matter!\n\n**EMC System:**\n- Everything has an EMC (Energy-Matter Covalence) value\n- Items can be converted TO and FROM EMC\n- Learn items to unlock them for transmutation\n\n**The Philosopher's Stone:**\n- Ancient alchemical artifact\n- Transforms blocks in-world (right-click)\n- Stone ↔ Grass ↔ Sand ↔ etc.\n- Required for advanced crafting\n\n**Recipe:**\n- 4 Glowstone Dust\n- 4 Redstone\n- 1 Diamond\n\nThe Philosopher's Stone is your gateway to equivalent exchange!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `projecte:item.pe_philosophers_stone` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `projecte:item.pe_covalence_dust:0` | 64 |
| Item | `projecte:item.pe_covalence_dust:1` | 32 |
| Item | `projecte:item.pe_covalence_dust:2` | 16 |

---

#### Quest 99: Transmutation Table
**Position:** (48, 240)
**Quest ID:** 99
**Prerequisite:** Quest 98

| Property | Value |
|----------|-------|
| **Name** | Learning EMC |
| **Icon** | `projecte:transmutation_table` |
| **Description** | "The **Transmutation Table** is your EMC workbench!\n\n**How it works:**\n1. Place items in 'burn' slot to learn them\n2. Learned items appear in your personal knowledge\n3. Insert items to convert to EMC\n4. Extract items you've learned (costs EMC)\n\n**EMC Examples:**\n- Coal: 64 EMC\n- Iron Ingot: 256 EMC\n- Diamond: 8,192 EMC\n- Nether Star: 24,576 EMC\n\n**Learning is PERMANENT** - once learned, always available!\n\nBuild a Transmutation Table and learn your first items." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `projecte:transmutation_table` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:diamond` | 16 |
| Item | `minecraft:emerald` | 32 |
| XP | 500 XP | - |

---

#### Quest 100: EMC Automation
**Position:** (48, 288)
**Quest ID:** 100
**Prerequisite:** Quest 99

| Property | Value |
|----------|-------|
| **Name** | Energy Condensers |
| **Icon** | `projecte:condenser_mk1` |
| **Description** | "**Energy Condensers** automate EMC conversion!\n\n**How Condensers Work:**\n1. Place target item in the lock slot\n2. Pipe items into the condenser\n3. Items convert to EMC automatically\n4. When enough EMC, output item is created!\n\n**Condenser Tiers:**\n- MK1: Standard speed\n- MK2: Much faster, better GUI\n\n**Automation Ideas:**\n- Cobblestone generator → Condenser → Diamonds!\n- Farm drops → Condenser → Valuable items\n- ANY item can become ANY other item!\n\nBuild a condenser and set up your first EMC farm." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `projecte:condenser_mk1` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `projecte:condenser_mk1` | 1 |
| Item | `projecte:item.pe_klein_star:0` | 4 |

---

#### Quest 101: Dark Matter
**Position:** (48, 336)
**Quest ID:** 101
**Prerequisite:** Quest 100

| Property | Value |
|----------|-------|
| **Name** | Matter Synthesis |
| **Icon** | `projecte:item.pe_matter:0` |
| **Description** | "**Dark Matter** is condensed EMC made physical!\n\n**Creating Dark Matter:**\n- EMC Cost: 139,264 per piece\n- Crafted from Aeternalis Fuel + Diamond Block\n- Or transmuted directly with enough EMC\n\n**Dark Matter Equipment:**\n- **Pickaxe:** 3x3 mining, very fast\n- **Sword:** High damage\n- **Armor:** Strong protection, abilities\n\n**Fuel Tiers (for crafting):**\n- Alchemical Coal (512 EMC)\n- Mobius Fuel (2,048 EMC)\n- Aeternalis Fuel (8,192 EMC)\n\nDark Matter is the stepping stone to Red Matter!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `projecte:item.pe_matter:0` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `projecte:item.pe_matter:0` | 8 |
| Item | `projecte:item.pe_dm_pick` | 1 |
| XP | 750 XP | - |

---

#### Quest 102: Red Matter
**Position:** (48, 384)
**Quest ID:** 102
**Prerequisite:** Quest 101

| Property | Value |
|----------|-------|
| **Name** | Ultimate Matter |
| **Icon** | `projecte:item.pe_matter:1` |
| **Description** | "**Red Matter** is the ultimate ProjectE material!\n\n**Creating Red Matter:**\n- EMC Cost: 466,944 per piece\n- Crafted from Dark Matter + Aeternalis Fuel\n- Requires significant EMC infrastructure\n\n**Red Matter Equipment:**\n- **Pickaxe:** Configurable AOE (up to huge areas)\n- **Sword:** One-shots most mobs\n- **Armor:** Near invincibility\n\n**Gem Armor (Ultimate):**\n- Requires Red Matter + Gems\n- Creative flight\n- Complete invincibility\n- Step assist, speed, everything\n\nRed Matter represents mastery of equivalent exchange!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `projecte:item.pe_matter:1` | 4 |
| Crafting | `projecte:item.pe_rm_pick` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `projecte:item.pe_matter:1` | 8 |
| Item | `projecte:item.pe_klein_star:4` | 1 |
| XP | 1000 XP | - |

---

### ENVIRONMENTAL TECH PATH

#### Quest 103: ET Multiblocks
**Position:** (96, 192)
**Quest ID:** 103
**Prerequisite:** Quest 90

| Property | Value |
|----------|-------|
| **Name** | Environmental Tech |
| **Icon** | `environmentaltech:solar_cont_1` |
| **Description** | "**Environmental Tech** provides passive power and resources!\n\n**Multiblock Machines:**\n- Solar Arrays: Generate RF from sunlight\n- Void Ore Miners: Create ores from nothing\n- Void Resource Miners: Generate other resources\n- Lightning Rods: Harvest storm power\n\n**Structure Basics:**\n- Controller block in center\n- Structure frames around it\n- Modifiers to boost performance\n- Liners for specific functions\n\nAll ET machines come in 6 tiers - higher = more powerful (and expensive!)\n\nStart with a basic Solar Array to learn the system." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `environmentaltech:solar_cont_1` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `environmentaltech:structure_frame_1` | 16 |
| Item | `environmentaltech:solar_cell_1` | 8 |

---

#### Quest 104: Void Mining
**Position:** (96, 240)
**Quest ID:** 104
**Prerequisite:** Quest 103

| Property | Value |
|----------|-------|
| **Name** | Void Ore Miner |
| **Icon** | `environmentaltech:void_ore_miner_cont_1` |
| **Description** | "**Void Ore Miners** create ores from NOTHING!\n\n**How It Works:**\n- Build the multiblock structure\n- Provide RF power\n- Ores spawn in the output!\n\n**Ore Selection:**\n- Uses colored lenses to filter ore types\n- Different lenses = different ores\n- Higher tiers = more lenses = more ore types\n\n**Power Requirements:**\n- Tier 1: ~1,000 RF/t\n- Tier 6: ~100,000+ RF/t\n\n**This obsoletes traditional mining!**\n\nWith a Void Miner, you never need to mine again. Just feed it power." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `environmentaltech:void_ore_miner_cont_1` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `environmentaltech:void_ore_miner_cont_2` | 1 |
| Item | `environmentaltech:modifier_speed` | 4 |
| XP | 750 XP | - |

---

#### Quest 105: Maximum Solar
**Position:** (96, 288)
**Quest ID:** 105
**Prerequisite:** Quest 104

| Property | Value |
|----------|-------|
| **Name** | Solar Array Tier 6 |
| **Icon** | `environmentaltech:solar_cont_6` |
| **Description** | "**Tier 6 Solar Arrays** produce MASSIVE power!\n\n**Solar Array Comparison:**\n| Tier | Approx RF/t | Size |\n|------|-------------|------|\n| 1 | ~100 | Small |\n| 2 | ~500 | Medium |\n| 3 | ~2,000 | Large |\n| 4 | ~8,000 | Huge |\n| 5 | ~32,000 | Massive |\n| 6 | ~128,000+ | Enormous |\n\n**Modifiers:**\n- Speed modifiers increase output\n- Can exceed base values significantly!\n\nA fully-modified Tier 6 array can power your entire base during daytime!\n\nReach for the ultimate solar power." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `environmentaltech:solar_cont_6` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `environmentaltech:modifier_speed` | 8 |
| Item | `environmentaltech:solar_cell_6` | 4 |
| XP | 1000 XP | - |

---

#### Quest 106: Lightning Harvesting
**Position:** (96, 336)
**Quest ID:** 106
**Prerequisite:** Quest 105

| Property | Value |
|----------|-------|
| **Name** | Lightning Rods |
| **Icon** | `environmentaltech:lightning_cont_6` |
| **Description** | "**Lightning Rods** harvest storm power!\n\n**How Lightning Rods Work:**\n- Must be built at Y=128+ (high altitude)\n- Generates RF during thunderstorms\n- MASSIVE burst power when lightning strikes\n\n**Tiers:**\n- Higher tiers attract more strikes\n- More power per strike\n- Larger collection area\n\n**Best Setup:**\n- Build at max height\n- Use multiple rods\n- Store power in Energy Core\n- Wait for storms!\n\nLightning is unpredictable but incredibly powerful when it hits!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `environmentaltech:lightning_cont_1` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `environmentaltech:lightning_cont_3` | 1 |
| Item | `minecraft:lightning_rod` | 4 |
| XP | 500 XP | - |

---

### CONVERGENCE & FINALE

#### Quest 107: The Chaos Guardian
**Position:** (0, 432)
**Quest ID:** 107
**Prerequisite:** Quest 93, Quest 97, Quest 102, Quest 105 (all paths)

| Property | Value |
|----------|-------|
| **Name** | Chaos Guardian |
| **Icon** | `draconicevolution:chaos_shard` |
| **Description** | "You've mastered all paths. Now face the ULTIMATE challenge!\n\n**The Chaos Guardian:**\n- Found on Chaos Islands in The End\n- Chaos Islands appear far from the main island\n- Most powerful boss in the modpack!\n\n**Preparation:**\n☐ Full Draconic Armor (MINIMUM)\n☐ Draconic weapons\n☐ Lots of healing items\n☐ Backup armor/weapons\n☐ Flight enabled\n☐ Shield fully charged\n\n**Drops:**\n- **Chaos Shards** - Used for ultimate items\n- Massive XP\n- Bragging rights!\n\n⚠️ The Chaos Guardian WILL kill unprepared players. This is the final boss." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `draconicevolution:chaos_shard` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:chaos_shard` | 8 |
| Item | `draconicevolution:draconic_core` | 4 |
| XP | 2500 XP | - |

---

#### Quest 108: Ultimate Power
**Position:** (0, 480)
**Quest ID:** 108
**Prerequisite:** Quest 107

| Property | Value |
|----------|-------|
| **Name** | Maximum Energy |
| **Icon** | `draconicevolution:energy_storage_core` |
| **Description** | "Build the ULTIMATE power infrastructure!\n\n**Goals:**\n1. **Tier 7 Energy Core** - 2.14 TRILLION RF storage\n2. **Full Draconic Armor Set** - Complete invincibility\n3. **Draconic Staff of Power** - Ultimate tool\n4. **ProjectE Gem Armor** - Alternative ultimate set\n5. **Void Miner Tier 6** - Infinite resources\n\n**At this point, you have:**\n- Essentially infinite energy storage\n- Passive resource generation\n- Equipment that makes you invincible\n- Transmutation of any material\n\nYou have achieved GODHOOD in Minecraft." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `draconicevolution:draconic_staff_of_power` | 1 |
| Retrieval | `draconicevolution:draconic_block` | 64 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `draconicevolution:creative_rf_source` | 1 |
| Item | `minecraft:bedrock` | 64 |
| XP | 5000 XP | - |

---

#### Quest 109: ERA VI COMPLETE
**Position:** (0, 544)
**Quest ID:** 109
**Prerequisite:** Quest 108

| Property | Value |
|----------|-------|
| **Name** | ERA VI COMPLETE: Ascension |
| **Icon** | `draconicevolution:draconic_core` |
| **Description** | "🎉 **CONGRATULATIONS, ENGINEER!** 🎉\n\nYou have completed EnergyCraft.\n\nYour journey:\n\n⛏️ **Era I:** Punched trees, made tools\n🔥 **Era II:** Harnessed steam and fire\n⚡ **Era III:** Mastered electricity\n🔧 **Era IV:** Built automated factories\n☢️ **Era V:** Split the atom\n🐉 **Era VI:** Achieved ASCENSION\n\n**You now command:**\n- Trillions of RF energy\n- Matter transmutation\n- Dragon-forged equipment\n- Void-harvested resources\n- Power over the very fabric of reality\n\nThe universe is yours, Engineer.\n\nThank you for playing EnergyCraft.\n\n*But there's always one more thing to build...*" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | I have ascended |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:firework_rocket` | 64 |
| Item | `minecraft:nether_star` | 16 |
| Item | `minecraft:dragon_egg` | 1 |
| Item | `minecraft:beacon` | 4 |
| Item | `minecraft:totem_of_undying` | 4 |
| XP | 10000 XP | - |

---

### OPTIONAL: Victory Lap

#### Quest 110: Creative Mode... Earned
**Position:** (0, 608)
**Quest ID:** 110
**Prerequisite:** Quest 109

| Property | Value |
|----------|-------|
| **Name** | Victory Lap |
| **Icon** | `minecraft:structure_void` |
| **Description** | "You've beaten the modpack. Now what?\n\n**Ideas for Continued Play:**\n\n🏗️ **Build Mode:** Create amazing structures with unlimited resources\n\n🎯 **Challenges:** \n- Speed run a new world\n- Try different tech paths\n- Build the most efficient reactor\n\n🌍 **Explore:** Visit every dimension, find every structure\n\n📚 **Share:** Document your builds, teach others\n\n🔨 **Contribute:** Found balance issues? Let us know!\n\n**Or simply enjoy your hard-earned power.**\n\nYou are the master of this world now." |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Reflect on the journey |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:written_book` | 1 |
| Item | `minecraft:firework_star` | 16 |

---

## Quest Line Configuration Summary

| Property | Value |
|----------|-------|
| **Line ID** | 5 |
| **Name** | Era VI: Ascension |
| **Description** | "The ultimate power awaits! Master Draconic Evolution's energy cores and equipment, unlock ProjectE's transmutation abilities, and build Environmental Tech's massive multiblocks. Defeat the Chaos Guardian and achieve true Ascension." |
| **Icon** | `draconicevolution:draconic_core` |
| **Visibility** | UNLOCKED (after Quest 86) |
| **Order** | 5 |

---

## Implementation Checklist

### Pre-Implementation
- [ ] Verify Draconic Evolution is installed and version
- [ ] Verify ProjectE is installed and version
- [ ] Verify Environmental Tech is installed (already confirmed 2.0.20.1)
- [ ] Check all Draconic item IDs with `/ct hand`
- [ ] Check all ProjectE item IDs with `/ct hand`
- [ ] Verify Chaos Guardian spawns and drops work
- [ ] Test Fusion Crafting setup

### Quest Creation
- [ ] Create Quest Line 5 in BQ Editor
- [ ] Add all 24 quests (87-110)
- [ ] Set prerequisite chains correctly
- [ ] Configure four-way branching from Quest 90
- [ ] Convergence at Quest 107 requires ALL branches

### Visual Layout
- [ ] Introduction (87-90) vertical
- [ ] Draconic Energy branch (91-93) left
- [ ] Draconic Equipment branch (94-97) center-left
- [ ] ProjectE branch (98-102) center-right
- [ ] ET branch (103-106) right
- [ ] Finale (107-110) center bottom

### Balance Review
- [ ] Verify ProjectE EMC values match config
- [ ] Check EMC exploits are gated
- [ ] Ensure Draconic recipes match current version
- [ ] Confirm reward quantities are appropriate

### Testing
- [ ] Quest 86 → Era VI unlocks
- [ ] All four paths completable independently
- [ ] Quest 107 requires all paths
- [ ] Final quests unlock properly
- [ ] Victory lap checkbox works

---

## Notes for Integrator

### Critical Mod Verification
1. **Draconic Evolution** - Verify installed, check version for recipe changes
2. **ProjectE** - Check if EMC values have been customized in `config/ProjectE/`
3. **Environmental Tech** - Already verified 2.0.20.1

### EMC Gating (Important!)
ProjectE can break game balance. Verify these are in place:
- High-value items have restricted/no EMC
- No EMC exploits (loops, duplication)
- Transmutation Table requires significant progression

### Recipe Changes
Some items may have CraftTweaker modifications:
- Check `scripts/` for ProjectE recipes
- Check `scripts/` for Draconic recipes
- Environmental Tech already has custom recipes

### Cross-References
- `research/DRACONIC_EVOLUTION_EVALUATION.md` (if exists)
- `research/PROJECTE_EVALUATION.md` (if exists)
- `config/ProjectE/custom_emc.json` - EMC customizations
- `config/DraconicEvolution.cfg` - DE config

### Quest Difficulty Scaling
Era VI should feel EXPENSIVE:
- Use Dragon Hearts, Chaos Shards as gates
- Require multiple of each item type
- Final quests should be achievement goals, not grinding

### Known Issues to Watch
- Chaos Guardian may be overtuned/undertuned
- Energy Core construction can be confusing
- Fusion Crafting requires clear explanation
- ProjectE can trivialize other content if not gated

---

## Era Summary Table

| Quest | Name | Branch | Key Requirement |
|-------|------|--------|-----------------|
| 87 | Welcome to Ascension | Intro | - |
| 88 | Journey to The End | Intro | Dragon Egg |
| 89 | Draconium Discovery | Intro | 32 Draconium Ore |
| 90 | Fusion Crafting | Intro | Fusion Core + Injectors |
| 91 | First Energy Core | Draconic-Energy | Energy Storage Core |
| 92 | Core Expansion | Draconic-Energy | 16 Draconium Blocks |
| 93 | Energy Distribution | Draconic-Energy | Energy Relays |
| 94 | Wyvern Core | Draconic-Equip | 2 Wyvern Cores |
| 95 | Wyvern Equipment | Draconic-Equip | Wyvern Pickaxe |
| 96 | Awakened Draconium | Draconic-Equip | 4 Dragon Hearts |
| 97 | Draconic Equipment | Draconic-Equip | Draconic Pickaxe |
| 98 | Equivalent Exchange | ProjectE | Philosopher's Stone |
| 99 | Transmutation Table | ProjectE | Table + Learn items |
| 100 | EMC Automation | ProjectE | Condenser |
| 101 | Dark Matter | ProjectE | 4 Dark Matter |
| 102 | Red Matter | ProjectE | 4 Red Matter |
| 103 | ET Multiblocks | ET | Solar Array T1 |
| 104 | Void Mining | ET | Void Ore Miner T1 |
| 105 | Maximum Solar | ET | Solar Array T6 |
| 106 | Lightning Harvesting | ET | Lightning Rod |
| 107 | Chaos Guardian | Finale | 4 Chaos Shards |
| 108 | Ultimate Power | Finale | Staff of Power |
| 109 | ERA VI COMPLETE | Finale | Checkbox |
| 110 | Victory Lap | Optional | Checkbox |

---

*Document created by Curator Agent. Ready for Integrator implementation.*
*This is the FINAL ERA - make it feel epic!*
