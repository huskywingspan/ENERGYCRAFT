# Era V: Nuclear Age - Quest Implementation Guide

> **Purpose:** Step-by-step instructions for implementing Era V quests in Better Questing
> **Total Quests:** ~18-20 (estimated)
> **Theme:** Nuclear power, uranium processing, reactor design, radiation safety
> **Prereq:** Era IV Complete (Quest 67)

---

## Overview

Era V introduces players to **nuclear power** - the most powerful and dangerous energy source in IC2 Classic. Players will:

1. Discover uranium ore and learn processing
2. Understand nuclear fuel cycles
3. Build their first nuclear reactor
4. Learn reactor safety and heat management
5. Design efficient reactor layouts
6. Prepare for end-game power infrastructure

### Design Philosophy

Nuclear power is the **skill ceiling** of IC2. The era should feel:

- **Educational:** Players learn WHY reactors work, not just HOW
- **Dangerous:** Consequences for mistakes (explosions, radiation)
- **Rewarding:** Successful reactors produce massive EU
- **Progression:** Simple safe designs → complex efficient designs

**Key Teaching Points:**
- Heat management is CRITICAL
- More uranium ≠ more power (it's about efficiency)
- MOX fuel for advanced players
- Reactor chambers expand capacity

---

## Pre-Implementation Research

### IC2 Classic Nuclear Item IDs

> **NOTE:** Verify all IDs with `/ct hand` in-game before implementation!
> IC2 Classic nuclear items differ significantly from IC2 Experimental!

#### Reactor Components

| Component | Registry ID | Function |
|-----------|-------------|----------|
| **Nuclear Reactor** | `ic2:te:22` | Core reactor block |
| **Reactor Chamber** | `ic2:te:23` | Expands reactor grid |
| **Reactor Redstone Port** | `ic2:te:24` | Redstone control |

#### Fuel Items

| Item | Registry ID | Notes |
|------|-------------|-------|
| **Uranium Ore** | `ic2:blockresource:2` | Found Y=0-64 |
| **Uranium Ingot** | `ic2:itemingot:8` | Processed uranium |
| **Uranium 235** | `ic2:itemuran235` | Enriched uranium |
| **Uranium 238** | `ic2:itemuran238` | Depleted uranium |
| **Uranium Fuel Rod** | `ic2:reactoruraniumsimple` | Single fuel rod |
| **Dual Uranium Fuel Rod** | `ic2:reactoruraniumdual` | 2x fuel |
| **Quad Uranium Fuel Rod** | `ic2:reactoruraniumquad` | 4x fuel |
| **MOX Fuel Rod** | `ic2:reactormoxsimple` | Advanced fuel |
| **Near-Depleted Cell** | `ic2:itemcellurandepleted` | Spent fuel |
| **Re-Enriched Cell** | `ic2:itemcelluranreenriched` | Recycled fuel |

#### Cooling Components

| Component | Registry ID | Function |
|-----------|-------------|----------|
| **Heat Vent** | `ic2:reactorheatvent` | Basic cooling |
| **Reactor Heat Vent** | `ic2:reactorheatventcore` | Core cooling |
| **Advanced Heat Vent** | `ic2:reactorheatventspread` | Spreads heat |
| **Overclocked Heat Vent** | `ic2:reactorheatventoverclocked` | High capacity |
| **Component Heat Vent** | `ic2:reactorheatventcomponent` | Adjacent cooling |
| **Heat Exchanger** | `ic2:reactorheatexchanger` | Heat transfer |
| **Reactor Heat Exchanger** | `ic2:reactorheatexchangercore` | Core exchange |
| **Advanced Heat Exchanger** | `ic2:reactorheatexchangeradvanced` | Spreads exchange |
| **Component Heat Exchanger** | `ic2:reactorheatexchangercomponent` | Adjacent exchange |

#### Plating & Protection

| Component | Registry ID | Function |
|-----------|-------------|----------|
| **Reactor Plating** | `ic2:reactorplating` | +1000 heat capacity |
| **Heat-Capacity Plating** | `ic2:reactorplatingheat` | +2000 heat capacity |
| **Containment Plating** | `ic2:reactorplatingexplosive` | Reduces explosion |
| **Neutron Reflector** | `ic2:reactorreflector` | Reflects neutrons |
| **Thick Neutron Reflector** | `ic2:reactorreflectorthick` | Better reflection |
| **Iridium Neutron Reflector** | `ic2:reactorreflectoriridium` | Infinite durability |

#### Coolant Cells

| Component | Registry ID | Function |
|-----------|-------------|----------|
| **Coolant Cell (10k)** | `ic2:reactorcoolant1` | 10k heat storage |
| **Coolant Cell (30k)** | `ic2:reactorcoolant3` | 30k heat storage |
| **Coolant Cell (60k)** | `ic2:reactorcoolant6` | 60k heat storage |
| **RSH-Condensator** | `ic2:reactorcondensator` | Redstone cooling |
| **LZH-Condensator** | `ic2:reactorcondensatorlap` | Lapis cooling |

#### Crafting Materials

| Item | Registry ID | Notes |
|------|-------------|-------|
| **Lead Ingot** | `ic2:itemingot:5` | Shielding material |
| **Lead Plate** | `ic2:itemplate:5` | Reactor crafting |
| **Copper Plate** | `ic2:itemplate:0` | Heat exchangers |
| **Tin Plate** | `ic2:itemplate:1` | Coolant cells |
| **Advanced Alloy** | `ic2:itemalloy` | Reactor components |
| **Dense Copper Plate** | `ic2:itemdenseplate:0` | Advanced cooling |

---

## Quest Structure

Era V has a **linear safety-focused start** followed by **design branches**:

```
           [Welcome to Nuclear]
                    |
             [Uranium Discovery]
                    |
             [Fuel Processing]
                    |
           [Cooling Components]
                    |
          [First Safe Reactor]
                    |
        ┌───────────┼───────────┐
        ↓           ↓           ↓
   [EFFICIENCY] [ADVANCED]  [SAFETY]
   (3 quests)   (3 quests)  (2 quests)
        |           |           |
        └───────────┼───────────┘
                    ↓
            [BREEDER REACTOR]
                (2 quests)
                    |
            [ERA V COMPLETE]
```

---

## Quest Specifications

### INTRODUCTION & SAFETY

#### Quest 68: Welcome to Nuclear
**Position:** Center (0, 0)
**Quest ID:** 68
**Prerequisite:** Quest 67 (Era IV Complete)

| Property | Value |
|----------|-------|
| **Name** | Welcome to Nuclear |
| **Icon** | `ic2:te:22` (Nuclear Reactor) |
| **Description** | "Engineer, you've mastered automation. Now it's time for REAL power.\n\nNuclear reactors produce enormous EU - enough to power entire bases from a single block. But they demand respect.\n\n⚠️ **WARNING:** Improperly designed reactors WILL:\n- Overheat and melt down\n- Explode (bigger than TNT!)\n- Irradiate the surrounding area\n\nThis era will teach you to harness the atom safely. Pay attention to the lessons - your base depends on it.\n\nAre you ready to split atoms?" |

**Tasks:**
| Type | Configuration |
|------|---------------|
| Checkbox | Acknowledge nuclear warning |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemingot:5` (Lead) | 32 |
| Item | `ic2:itemplate:0` (Copper Plate) | 16 |
| XP | 300 XP | - |

---

#### Quest 69: Uranium Discovery
**Position:** (0, 48)
**Quest ID:** 69
**Prerequisite:** Quest 68

| Property | Value |
|----------|-------|
| **Name** | Uranium Discovery |
| **Icon** | `ic2:blockresource:2` (Uranium Ore) |
| **Description** | "Uranium Ore spawns rarely below Y=64. It looks like green-tinted stone.\n\n⚠️ **RADIATION WARNING:**\n- Standing near uranium ore causes minor radiation\n- Carrying uranium items causes radiation damage\n- Use a Hazmat Suit for protection!\n\nMining Tips:\n- Macerator gives 2 Crushed Uranium per ore\n- Fortune pickaxe works on uranium ore\n- Check caves around Y=20 for best results\n\nGather uranium carefully - you'll need plenty for fuel rods." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:blockresource:2` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemingot:8` (Uranium Ingot) | 4 |
| Item | `ic2:itemarmor_hazmat_helm` | 1 |
| XP | 200 XP | - |

---

#### Quest 70: Uranium Processing
**Position:** (0, 96)
**Quest ID:** 70
**Prerequisite:** Quest 69

| Property | Value |
|----------|-------|
| **Name** | Fuel Processing |
| **Icon** | `ic2:reactoruraniumsimple` |
| **Description** | "Raw uranium must be processed into fuel rods.\n\n**Processing Chain:**\n1. Uranium Ore → Macerator → Crushed Uranium\n2. Crushed Uranium → Thermal Centrifuge → U-235 + U-238\n3. U-238 (6) + U-235 (3) → Enriched Uranium Fuel\n4. Enriched Fuel + Iron Plate → Uranium Fuel Rod\n\n**Fuel Rod Types:**\n- **Single:** Basic, easy to cool\n- **Dual:** 2x power, 2x heat\n- **Quad:** 4x power, 4x heat, HARD to cool!\n\nStart with single rods while learning." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactoruraniumsimple` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactoruraniumsimple` | 4 |
| Item | `ic2:itemuran235` | 8 |
| Item | `ic2:itemuran238` | 16 |

---

#### Quest 71: The Thermal Centrifuge
**Position:** (0, 144)
**Quest ID:** 71
**Prerequisite:** Quest 70

| Property | Value |
|----------|-------|
| **Name** | Isotope Separation |
| **Icon** | `ic2:te:53` |
| **Description** | "The **Thermal Centrifuge** is essential for nuclear fuel processing.\n\nWhat it does:\n- Separates Crushed Uranium into U-235 (enriched) and U-238 (depleted)\n- Processes spent fuel cells for re-enrichment\n- Works at 48 EU/t (MV tier)\n\nRecipe:\n- 2 Motor\n- 2 Coil\n- 1 Machine Casing\n- 4 Advanced Alloy\n\nPro tip: Process ALL crushed uranium - both isotopes are valuable!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:te:53` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemalloy` (Advanced Alloy) | 8 |
| Item | `ic2:itemcrafting:6` (Coil) | 4 |

---

### COOLING SYSTEMS

#### Quest 72: Heat Management Basics
**Position:** (0, 192)
**Quest ID:** 72
**Prerequisite:** Quest 71

| Property | Value |
|----------|-------|
| **Name** | Understanding Heat |
| **Icon** | `ic2:reactorheatvent` |
| **Description** | "Reactor heat will KILL your reactor if not managed!\n\n**Heat Sources:**\n- Fuel rods generate heat every tick\n- Adjacent fuel rods multiply heat output\n- No cooling = temperature rises\n\n**Heat Dissipation:**\n- **Heat Vents** - Dissipate heat to air\n- **Heat Exchangers** - Move heat between components\n- **Coolant Cells** - Store heat temporarily\n- **Plating** - Increases max hull heat capacity\n\n**The Rule:** Heat dissipated ≥ Heat generated = Safe reactor\n\nStart with basic Heat Vents - they're the foundation of all cooling." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactorheatvent` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactorheatvent` | 8 |
| Item | `ic2:itemplate:0` (Copper Plate) | 32 |

---

#### Quest 73: Advanced Cooling
**Position:** (0, 240)
**Quest ID:** 73
**Prerequisite:** Quest 72

| Property | Value |
|----------|-------|
| **Name** | Cooling Arsenal |
| **Icon** | `ic2:reactorheatventoverclocked` |
| **Description** | "Different cooling components for different situations:\n\n**Heat Vents:**\n- Basic Vent: 6 heat/t self-cooling\n- Reactor Vent: 5 heat/t from hull\n- Overclocked Vent: 20 heat/t but needs incoming heat\n- Component Vent: 4 heat/t from adjacent\n\n**Heat Exchangers:**\n- Move heat between components\n- Reactor Exchanger: Hull ↔ Component\n- Component Exchanger: Between adjacents\n- Advanced Exchanger: 24 heat/t transfer\n\n**Pro Strategy:** Use exchangers to move heat TO vents.\n\nCraft a variety - you'll need them for efficient designs." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactorheatventoverclocked` | 4 |
| Crafting | `ic2:reactorheatexchanger` | 4 |
| Crafting | `ic2:reactorcoolant1` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactorcoolant3` | 4 |
| Item | `ic2:reactorheatexchangeradvanced` | 2 |
| Item | `minecraft:diamond` | 4 |

---

### FIRST REACTOR

#### Quest 74: Your First Reactor
**Position:** (0, 304)
**Quest ID:** 74
**Prerequisite:** Quest 73

| Property | Value |
|----------|-------|
| **Name** | First Reactor Build |
| **Icon** | `ic2:te:22` |
| **Description** | "Time to build your first nuclear reactor!\n\n**Basic Reactor Recipe:**\n- 3 Reactor Chambers (corners optional, expand grid)\n- 4 Dense Lead Plates\n- 1 Generator\n- 1 Advanced Machine Casing\n\n**SAFE STARTER DESIGN (3x3 grid):**\n```\n[V] [U] [V]\n[V] [V] [V]\n[V] [U] [V]\n```\nV = Heat Vent, U = Single Uranium Rod\n\nThis produces ~20 EU/t safely. Not efficient, but it WON'T explode!\n\nPlace the reactor, insert components via GUI, and watch the EU flow." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:te:22` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactoruraniumsimple` | 8 |
| Item | `ic2:reactorheatvent` | 16 |
| Item | `ic2:itemdenseplate:5` (Dense Lead) | 8 |
| XP | 500 XP | - |

---

#### Quest 75: Reactor Operation
**Position:** (0, 352)
**Quest ID:** 75
**Prerequisite:** Quest 74

| Property | Value |
|----------|-------|
| **Name** | Running Your Reactor |
| **Icon** | `ic2:itemenergycrystal` |
| **Description** | "Your reactor is built. Now learn to operate it!\n\n**Monitoring:**\n- Right-click reactor to open GUI\n- Reactor shows hull heat (keep below max!)\n- Components show individual heat\n- EU output shown on side displays\n\n**Safety Checklist:**\n☐ Heat vents outnumber fuel rods\n☐ Hull heat stays below 50%\n☐ EU is being extracted (full buffer = heat buildup)\n☐ MFSU or cable connected to reactor\n\n**If Heat Rises:**\n1. Remove fuel rods IMMEDIATELY\n2. Let heat vent down\n3. Redesign with more cooling\n\nRun your reactor for 1 full fuel cycle (20,000 ticks) to complete this quest." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:itemcellurandepleted` (Depleted Cell) | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemenergycrystal` | 2 |
| Item | `ic2:reactorplating` | 4 |
| XP | 300 XP | - |

---

### EFFICIENCY BRANCH

#### Quest 76: Reactor Chambers
**Position:** (-64, 400)
**Quest ID:** 76
**Prerequisite:** Quest 75

| Property | Value |
|----------|-------|
| **Name** | Expanding Capacity |
| **Icon** | `ic2:te:23` |
| **Description** | "**Reactor Chambers** expand your reactor grid!\n\nBase reactor: 3x6 = 18 slots\nWith 6 chambers: 9x6 = 54 slots!\n\nPlacement:\n- Chambers must touch the reactor directly\n- Up to 6 chambers (one per face)\n- Each adds 1 column to the grid\n\nMore slots = more fuel + more cooling = more power!\n\nRecipe:\n- 4 Machine Casing\n- 4 Dense Lead Plates\n\nBuild your full 6-chamber reactor for maximum capacity." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:te:23` | 6 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemdenseplate:5` (Dense Lead) | 16 |
| Item | `ic2:itemalloy` | 16 |

---

#### Quest 77: Efficient Designs
**Position:** (-64, 448)
**Quest ID:** 77
**Prerequisite:** Quest 76

| Property | Value |
|----------|-------|
| **Name** | Mark II Reactor |
| **Icon** | `ic2:reactoruraniumdual` |
| **Description** | "Time to optimize! A Mark II reactor runs continuously at stable heat.\n\n**EFFICIENT DESIGN (6 chambers, ~100 EU/t):**\n```\nRow 1: [OV][U ][CV][CV][U ][OV]\nRow 2: [HE][CV][OV][OV][CV][HE]\nRow 3: [OV][U ][CV][CV][U ][OV]\nRow 4: [HE][CV][OV][OV][CV][HE]\nRow 5: [OV][U ][CV][CV][U ][OV]\nRow 6: [__][__][__][__][__][__]\n```\nOV=Overclocked Vent, CV=Component Vent\nHE=Heat Exchanger, U=Single Uranium\n\nThis balances heat generation with dissipation perfectly!\n\nGoal: Run 100 EU/t continuously." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactoruraniumdual` | 4 |
| Crafting | `ic2:reactorheatventcomponent` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactoruraniumdual` | 4 |
| Item | `ic2:reactorheatventoverclocked` | 8 |
| XP | 500 XP | - |

---

#### Quest 78: Neutron Reflectors
**Position:** (-64, 496)
**Quest ID:** 78
**Prerequisite:** Quest 77

| Property | Value |
|----------|-------|
| **Name** | Maximizing Output |
| **Icon** | `ic2:reactorreflectorthick` |
| **Description** | "**Neutron Reflectors** boost fuel rod output!\n\nHow they work:\n- Place adjacent to fuel rods\n- Reflects neutrons back into fuel\n- Increases EU output significantly\n- Adds NO heat generation!\n\nTypes:\n- Basic Reflector: 30k durability\n- Thick Reflector: 120k durability\n- Iridium Reflector: INFINITE durability\n\n**Pro Design Tip:**\nSurround each fuel rod with reflectors on sides that don't have cooling.\n\nReflectors are the key to efficient high-output designs!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactorreflector` | 8 |
| Crafting | `ic2:reactorreflectorthick` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactorreflectorthick` | 8 |
| Item | `minecraft:copper_ingot` | 64 |

---

### ADVANCED FUEL BRANCH

#### Quest 79: Quad Fuel Rods
**Position:** (0, 400)
**Quest ID:** 79
**Prerequisite:** Quest 75

| Property | Value |
|----------|-------|
| **Name** | Maximum Power Rods |
| **Icon** | `ic2:reactoruraniumquad` |
| **Description** | "**Quad Fuel Rods** are the ultimate power source!\n\n4x the uranium = 4x the EU output\nBUT ALSO: 4x the heat generation!\n\nQuad rods are for EXPERTS ONLY:\n- Require massive cooling infrastructure\n- One quad rod can overwhelm basic setups\n- But efficiently cooled = incredible EU/t\n\n**Recipe:** 4 Single Rods + 3 Copper Plates + 1 Dense Copper Plate\n\nDon't put this in your reactor until you've mastered cooling!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactoruraniumquad` | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactoruraniumquad` | 2 |
| Item | `ic2:itemdenseplate:0` (Dense Copper) | 8 |
| Item | `ic2:reactorcoolant6` | 4 |

---

#### Quest 80: MOX Fuel
**Position:** (0, 448)
**Quest ID:** 80
**Prerequisite:** Quest 79

| Property | Value |
|----------|-------|
| **Name** | MOX Fuel System |
| **Icon** | `ic2:reactormoxsimple` |
| **Description** | "**MOX Fuel** (Mixed Oxide) is advanced nuclear fuel!\n\nUnique Property:\n- EU output INCREASES with reactor heat\n- At 50% hull heat: ~1.5x output\n- At 84% hull heat: 5x output!\n\n⚠️ **EXTREME DANGER:**\nMOX reactors run HOT deliberately. One mistake = meltdown.\n\nRecipe:\n- Plutonium (from reprocessed uranium)\n- Similar to regular fuel rods\n\nMOX is for players who want MAXIMUM power and can handle the risk." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactormoxsimple` | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactormoxsimple` | 4 |
| Item | `ic2:itemplutonium` | 4 |
| XP | 500 XP | - |

---

#### Quest 81: Plutonium Production
**Position:** (0, 496)
**Quest ID:** 81
**Prerequisite:** Quest 80

| Property | Value |
|----------|-------|
| **Name** | Fuel Reprocessing |
| **Icon** | `ic2:itemplutonium` |
| **Description** | "Depleted uranium cells aren't waste - they're resources!\n\n**Reprocessing Chain:**\n1. Depleted Cell → Thermal Centrifuge → Plutonium + U-238\n2. Plutonium → MOX Fuel Rods\n3. U-238 → Re-enrichment or Breeder reactors\n\n**Sustainable Nuclear:**\n- Run uranium reactor\n- Reprocess depleted cells\n- Make MOX from plutonium\n- Breed more U-235 from U-238\n\nA well-designed nuclear program is nearly self-sustaining!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:itemplutonium` | 8 |
| Retrieval | `ic2:reactormoxsimple` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemplutonium` | 8 |
| Item | `ic2:itemcelluran` | 8 |
| XP | 500 XP | - |

---

### SAFETY BRANCH

#### Quest 82: Reactor Plating
**Position:** (64, 400)
**Quest ID:** 82
**Prerequisite:** Quest 75

| Property | Value |
|----------|-------|
| **Name** | Hull Reinforcement |
| **Icon** | `ic2:reactorplatingheat` |
| **Description** | "**Reactor Plating** increases hull heat capacity!\n\nWhy it matters:\n- Base hull: 10,000 heat capacity\n- Each plating: +1000 capacity\n- Heat-Capacity Plating: +2000 capacity\n\nMore capacity = more buffer before meltdown!\n\n**Containment Plating:**\n- Reduces explosion radius if meltdown occurs\n- Won't prevent meltdown, just limits damage\n- Use as insurance, not primary defense\n\nPlating lets you run hotter reactors safely." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:reactorplating` | 4 |
| Crafting | `ic2:reactorplatingheat` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactorplatingheat` | 8 |
| Item | `ic2:itemdenseplate:5` | 16 |

---

#### Quest 83: Emergency Systems
**Position:** (64, 448)
**Quest ID:** 83
**Prerequisite:** Quest 82

| Property | Value |
|----------|-------|
| **Name** | Reactor Control |
| **Icon** | `ic2:te:24` |
| **Description** | "Automate reactor safety with redstone control!\n\n**Reactor Redstone Port:**\n- Attach to reactor chamber\n- Configure in GUI for various signals\n- Can output: heat level, EU output status\n- Can input: enable/disable reactor\n\n**Safety Setup:**\n1. Redstone Port set to output at 75% heat\n2. Connect to NOT gate\n3. Feed back to reactor enable\n4. Reactor auto-shuts at high heat!\n\n**Pro Tip:** Use ComputerCraft for advanced monitoring (if installed)." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Crafting | `ic2:te:24` | 1 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:redstone` | 64 |
| Item | `minecraft:comparator` | 8 |
| Item | `ic2:reactorplatingexplosive` | 4 |

---

### BREEDER REACTOR

#### Quest 84: Breeder Basics
**Position:** (0, 560)
**Quest ID:** 84
**Prerequisite:** Quest 78, Quest 81, Quest 83 (all branches)

| Property | Value |
|----------|-------|
| **Name** | Breeding Uranium |
| **Icon** | `ic2:itemcelluranreenriched` |
| **Description** | "**Breeder Reactors** create MORE fuel than they consume!\n\nHow breeding works:\n- Neutrons from fuel rods hit U-238 cells\n- U-238 gradually enriches\n- Eventually becomes re-enriched uranium fuel!\n\n**Breeder Design Principles:**\n- Run at HIGH heat (increases breeding speed)\n- Surround fuel rods with U-238 cells\n- Use isotope cells, not empty cells\n- Be patient - breeding takes time\n\nA breeder + standard reactor = infinite fuel!" |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:itemcelluranreenriched` | 4 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:itemcelluran238` | 16 |
| Item | `ic2:reactoruraniumsimple` | 8 |
| XP | 750 XP | - |

---

#### Quest 85: Sustainable Nuclear
**Position:** (0, 608)
**Quest ID:** 85
**Prerequisite:** Quest 84

| Property | Value |
|----------|-------|
| **Name** | Nuclear Mastery |
| **Icon** | `ic2:te:22` |
| **Description** | "You've learned the full nuclear fuel cycle!\n\n**Complete Nuclear Setup:**\n\n1. **Mining:** Uranium ore → Macerator → Crushed\n2. **Separation:** Thermal Centrifuge → U-235 + U-238\n3. **Power Reactor:** U-235 fuel rods → EU + Depleted cells\n4. **Reprocessing:** Depleted → Plutonium + U-238\n5. **Breeder:** U-238 + neutrons → Re-enriched fuel\n6. **MOX Production:** Plutonium → MOX rods for heat-boosted power\n\nYou now command the atom. Use this power wisely!\n\nProduce 1,000,000 EU from nuclear to complete this quest." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:itemcellurandepleted` | 16 |
| Retrieval | `ic2:itemplutonium` | 8 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `ic2:reactorreflectoriridium` | 2 |
| Item | `ic2:itemlapotroncrystal` | 2 |
| XP | 1000 XP | - |

---

### ERA COMPLETION

#### Quest 86: ERA V COMPLETE
**Position:** (0, 672)
**Quest ID:** 86
**Prerequisite:** Quest 85

| Property | Value |
|----------|-------|
| **Name** | ERA V COMPLETE: Nuclear Engineer |
| **Icon** | `ic2:te:22` |
| **Description** | "NUCLEAR ENGINEER!\n\nYou have conquered the atom:\n\n☢️ Mined and processed uranium\n☢️ Built safe reactor designs\n☢️ Mastered heat management\n☢️ Explored MOX and breeder systems\n☢️ Achieved sustainable nuclear power\n\nYour base now has virtually unlimited EU. Millions of energy units flow at your command.\n\nBut there's always more power to harness...\n\nEra VI introduces DRACONIC EVOLUTION - technology so advanced it borders on magic. Energy cores the size of buildings. Armor that makes you invincible. Tools that reshape the world.\n\nOr perhaps transmutation calls to you? ProjectE awaits...\n\nThe universe is yours, Engineer." |

**Tasks:**
| Type | Item | Amount |
|------|------|--------|
| Retrieval | `ic2:te:22` | 1 |
| Retrieval | `ic2:te:23` | 6 |
| Retrieval | `ic2:te:74` (MFSU) | 2 |

**Rewards:**
| Type | Item | Amount |
|------|------|--------|
| Item | `minecraft:firework_rocket` | 64 |
| Item | `minecraft:nether_star` | 2 |
| Item | `ic2:itemlapotroncrystal` | 4 |
| Item | `minecraft:diamond_block` | 16 |
| XP | 5000 XP | - |

---

## Quest Line Configuration Summary

| Property | Value |
|----------|-------|
| **Line ID** | 4 |
| **Name** | Era V: Nuclear Age |
| **Description** | "Harness the power of the atom! Learn uranium processing, build nuclear reactors, master heat management, and achieve sustainable nuclear power. Handle with care - great power requires great responsibility." |
| **Icon** | `ic2:te:22` (Nuclear Reactor) |
| **Visibility** | UNLOCKED (after Quest 67) |
| **Order** | 4 |

---

## Implementation Checklist

### Pre-Implementation
- [ ] Verify ALL IC2 Classic nuclear item IDs with `/ct hand`
- [ ] Test reactor heat mechanics in creative mode
- [ ] Confirm Thermal Centrifuge recipe and ID
- [ ] Verify plutonium processing chain exists in IC2 Classic
- [ ] Check for Hazmat suit item IDs

### Quest Creation
- [ ] Create Quest Line in BQ Editor
- [ ] Add all 19 quests with correct prerequisites
- [ ] Set icons using verified item IDs
- [ ] Configure tasks (crafting, retrieval, checkbox)
- [ ] Add rewards
- [ ] Write warning text clearly

### Visual Layout
- [ ] Linear start (Quests 68-75)
- [ ] Three branches from Quest 75
- [ ] Convergence at Quest 84
- [ ] Clear safety warnings in descriptions

### Testing
- [ ] Complete Quest 67 → Era V unlocks
- [ ] All fuel processing quests completable
- [ ] Reactor actually works with described designs
- [ ] Heat management descriptions are accurate
- [ ] Quest 86 unlocks Era VI

---

## Notes for Integrator

### Critical Warnings
1. **IC2 Classic vs IC2 Experimental** - Item IDs are DIFFERENT. Double-check everything.
2. **Reactor designs in descriptions** - Must be tested to confirm they work
3. **Heat values** - May differ between IC2 versions, verify cooling math
4. **MOX fuel** - May or may not exist in IC2 Classic, verify availability

### Balance Considerations
- Nuclear should feel REWARDING for the complexity
- Starter reactor design must be truly safe (test it!)
- Final rewards should feel worthwhile (MFSU-level stuff)

### Recipe Research Needed
- Thermal Centrifuge exact recipe
- MOX fuel crafting chain (if it exists)
- Hazmat suit crafting
- Reactor Redstone Port recipe

### Cross-References
- `research/IC2_CLASSIC_QUICK_REFERENCE.md` - IC2 items
- `config/ic2/ic2.cfg` - Nuclear settings
- IC2 Classic wiki for reactor mechanics

### Safety Text
All nuclear quests should emphasize:
- Meltdown consequences
- Heat monitoring importance  
- Safe design principles
- "Test in creative first" mentality

---

*Document created by Curator Agent. Ready for Integrator implementation.*
