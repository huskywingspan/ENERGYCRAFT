# ⚡ The Energy Pipeline
## A Comprehensive Guide to Power in EnergyCraft

> *"Energy is the currency of progress. Master its flow, and you master the world."*

---

## Table of Contents

1. [Understanding Energy Types](#understanding-energy-types)
2. [Tier 0: Manual Labor](#tier-0-manual-labor)
3. [Tier 1: Basic Generators](#tier-1-basic-generators)
4. [Tier 2: Combustion & Fuel Systems](#tier-2-combustion--fuel-systems)
5. [Tier 3: Nuclear Power](#tier-3-nuclear-power)
6. [Tier 4: Renewable Energy](#tier-4-renewable-energy)
7. [Tier 5: End-Game Power](#tier-5-end-game-power)
8. [Energy Conversion](#energy-conversion)
9. [Power Plant Designs](#power-plant-designs)
10. [Efficiency Comparison Tables](#efficiency-comparison-tables)
11. [Common Mistakes to Avoid](#common-mistakes-to-avoid)

---

## Understanding Energy Types

EnergyCraft features three primary energy systems that power different mods:

| Energy Type | Unit | Primary Mod | Color Code |
|-------------|------|-------------|------------|
| **EU** | Energy Units | IC2 Classic | ⚡ Yellow |
| **MJ** | Minecraft Joules | BuildCraft | 🔧 Red |
| **RF** | Redstone Flux | Most Others | 🔴 Red |

### Conversion Ratios (Memorize These!)

```
┌─────────────────────────────────────────┐
│     1 EU  =  2.5 RF  =  0.25 MJ        │
│     1 MJ  =  10 RF   =  4 EU           │
│     1 RF  =  0.4 EU  =  0.1 MJ         │
└─────────────────────────────────────────┘
```

**Pro Tip:** When planning multi-mod setups, always calculate in RF first, then convert. RF is the "common denominator" of modded Minecraft energy.

---

## Tier 0: Manual Labor

Before you have any power infrastructure, you'll rely on manual tools and basic automation.

### Furnaces & Manual Processing
- **Stone Furnace:** 1 coal = 8 items smelted
- **Iron Furnace (IC2):** Faster, still uses fuel
- **Bronze Tools:** Your gateway to IC2

### The Bronze Age Bottleneck

Your first real power need comes from crafting the **Generator**. You'll need:
- Bronze Plates (Forge Hammer or Plate Bending Machine)
- Copper Cable
- A furnace (becomes part of the generator)

**Time Investment:** ~30 minutes from spawn to first generator

---

## Tier 1: Basic Generators

### IC2 Classic Generators

#### Generator (Coal/Charcoal)
The workhorse of early-game IC2.

| Fuel | EU per Item | Burn Time | EU/t |
|------|-------------|-----------|------|
| Coal | 4,000 EU | 200 sec | 10 |
| Charcoal | 4,000 EU | 200 sec | 10 |
| Coal Block | 40,000 EU | 2000 sec | 10 |
| Blaze Rod | 6,000 EU | 300 sec | 10 |
| Lava Bucket | 20,000 EU | 1000 sec | 10 |

**Output:** 10 EU/t (constant while burning)

**Setup Tips:**
- Place adjacent to a Batbox for storage
- Use hoppers or BuildCraft pipes for auto-fuel
- One generator can power: 1 Macerator OR 1 Electric Furnace

#### Geothermal Generator
Converts lava directly to EU. Extremely reliable.

| Input | EU Generated | Notes |
|-------|--------------|-------|
| Lava Bucket | 20,000 EU | Returns empty bucket |
| Lava Cell | 20,000 EU | Consumes cell |

**Output:** 20 EU/t

**Best Practice:** Pump lava from the Nether using BuildCraft pumps. One chunk of Nether lava lake = millions of EU.

#### Water Mill
Free energy, but very slow.

| Mode | Output |
|------|--------|
| Submerged (water source) | 0.25 EU/t |
| With Water Buckets | 2 EU/t (consumes bucket) |

**Verdict:** Only useful in massive arrays (100+ mills) or as a trickle charger.

#### Solar Panel
The classic renewable option.

| Condition | Output |
|-----------|--------|
| Daytime, clear sky | 1 EU/t |
| Night/Rain/Underground | 0 EU/t |

**Average:** ~0.5 EU/t over full day/night cycle

**Note:** Vanilla IC2 solar panels are stepping stones to Environmental Tech solar arrays.

---

### BuildCraft Engines

#### Redstone Engine
The most basic BuildCraft engine. **Cannot produce MJ for machines!**

| Use | Power |
|-----|-------|
| Powering wooden pipes | Variable |
| Powering pumps (slowly) | Very slow |

**Warning:** Redstone engines ONLY work for item/fluid extraction. They cannot power machines like the Assembly Table.

#### Stirling Engine (Stone Engine)
Your first real MJ generator.

| Fuel | MJ per Item | Output |
|------|-------------|--------|
| Coal | 16,000 MJ | 1 MJ/t |
| Charcoal | 16,000 MJ | 1 MJ/t |
| Coal Block | 160,000 MJ | 1 MJ/t |

**Output:** 1 MJ/t constant

**Heat Warning:** Stirling engines can overheat if they have nowhere to output power. Always connect to a machine or Redstone Energy Cell!

**Cooling:** Place a lever nearby and turn off when not in use.

---

## Tier 2: Combustion & Fuel Systems

This is where power generation gets serious. Combustion engines running on refined fuels are the backbone of mid-game BuildCraft automation.

### Combustion Engine (Iron Engine)

The combustion engine runs on liquid fuels and requires water cooling.

| Fuel Type | MJ/Bucket | Output | Heat Rate |
|-----------|-----------|--------|-----------|
| Oil | 10,000 MJ | 3 MJ/t | Medium |
| Fuel (Refined) | 100,000 MJ | 6 MJ/t | High |
| Biofuel | 50,000 MJ | 5 MJ/t | Medium |

**CRITICAL: Water Cooling Required!**
- 1 bucket water per ~100 seconds at full power
- Engine WILL explode without cooling
- Use aqueous accumulator or infinite water source

### Fuel Production Chain

```
                    ┌─────────────┐
     Oil Well       │   PUMPJACK  │
         │          └──────┬──────┘
         ▼                 ▼
    ┌─────────┐      ┌─────────┐
    │   OIL   │ ──── │   OIL   │
    │ (crude) │      │ (crude) │
    └────┬────┘      └────┬────┘
         │                │
         └───────┬────────┘
                 ▼
         ┌───────────────┐
         │   REFINERY    │
         │  (BuildCraft) │
         └───────┬───────┘
                 ▼
         ┌───────────────┐
         │     FUEL      │
         │  (refined)    │
         └───────────────┘
```

### Oil Sources

| Source | Output | Renewable? |
|--------|--------|------------|
| Oil Springs (surface) | Limited pool | No |
| Oil Geysers (desert) | Large deposit | No |
| Ocean Oil Wells | Massive deposit | No |

**Pro Tip:** Use a BuildCraft Quarry to find oil deposits. They appear as black pools on the surface, but the real reserves are underground.

### The Refinery

Converts crude oil into fuel at a 1:1 ratio (1 bucket oil = 1 bucket fuel).

| Stat | Value |
|------|-------|
| Power Required | 10 MJ/t minimum |
| Processing Speed | ~1 bucket per 10 seconds at 10 MJ/t |
| Optimal Power | 25+ MJ/t |

**Efficiency Math:**
- 1 bucket Oil → 1 bucket Fuel
- Oil in Combustion Engine: 10,000 MJ
- Fuel in Combustion Engine: 100,000 MJ
- **Refining multiplies energy by 10x!**

### Biofuel Alternative (Forestry)

If you have Forestry, you can create renewable biofuel:

```
    Saplings/Seeds/Plants
            │
            ▼
    ┌───────────────┐
    │   FERMENTER   │ + Water + Fertilizer
    └───────┬───────┘
            │
            ▼
        Biomass
            │
            ▼
    ┌───────────────┐
    │     STILL     │
    └───────┬───────┘
            │
            ▼
       Biofuel
```

| Forestry Chain | Input | Output |
|----------------|-------|--------|
| Fermenter | 1 Sapling + Water + Fertilizer | 100 mB Biomass |
| Still | 100 mB Biomass | 30 mB Biofuel |

**Verdict:** Biofuel is renewable but requires significant infrastructure. Best used alongside oil, not as a replacement.

---

## Tier 3: Nuclear Power

IC2 Classic nuclear reactors are the most powerful generators in the early-to-mid game, but they require careful design to avoid... incidents.

### Nuclear Reactor Basics

| Component | Function |
|-----------|----------|
| Nuclear Reactor | The core block, 6-slot internal inventory |
| Reactor Chamber | Expands inventory by 6 slots each (max 6 chambers = 54 slots) |
| Uranium Cell | Fuel source, generates heat AND EU |
| Coolant Cell | Absorbs heat from adjacent cells |
| Heat Vent | Dissipates heat to air |
| Heat Exchanger | Moves heat between components |
| Reactor Plating | Increases heat capacity of reactor |

### Understanding Heat

```
SAFE ZONE          DANGER ZONE         MELTDOWN
    │                   │                  │
    ▼                   ▼                  ▼
[0%]────────[50%]────────[85%]────────[100%]
    │                   │                  │
 Normal            Damage to          EXPLOSION
Operation         Components          (crater)
```

**The Golden Rule:** Heat generated must equal heat dissipated, or your reactor WILL explode.

### Uranium Processing

```
    Uranium Ore
         │
         ▼ (Macerator)
    Crushed Uranium
         │
         ▼ (Thermal Centrifuge)
    Enriched Uranium + Uranium-238
         │
         ▼ (Crafting with Empty Cells)
    Uranium Fuel Cells
```

### Beginner-Safe Reactor Design (Mark I)

A Mark I reactor runs indefinitely without any risk of overheating.

```
┌───┬───┬───┬───┬───┬───┬───┬───┬───┐
│ H │ H │ H │ H │ H │ H │ H │ H │ H │
├───┼───┼───┼───┼───┼───┼───┼───┼───┤
│ H │ U │ C │ U │ C │ U │ C │ U │ H │
├───┼───┼───┼───┼───┼───┼───┼───┼───┤
│ H │ C │ H │ C │ H │ C │ H │ C │ H │
├───┼───┼───┼───┼───┼───┼───┼───┼───┤
│ H │ U │ C │ U │ C │ U │ C │ U │ H │
├───┼───┼───┼───┼───┼───┼───┼───┼───┤
│ H │ C │ H │ C │ H │ C │ H │ C │ H │
├───┼───┼───┼───┼───┼───┼───┼───┼───┤
│ H │ U │ C │ U │ C │ U │ C │ U │ H │
├───┼───┼───┼───┼───┼───┼───┼───┼───┤
│ H │ H │ H │ H │ H │ H │ H │ H │ H │
└───┴───┴───┴───┴───┴───┴───┴───┴───┘

Legend: U = Uranium Cell, C = Coolant, H = Heat Vent
```

**Output:** ~100 EU/t  
**Risk:** None (Mark I)  
**Cost:** High (many heat vents)

### High-Output Reactor Design (Mark II)

Mark II reactors need to cool down periodically but produce more power.

**Output:** ~200-400 EU/t  
**Risk:** Medium (requires monitoring)  
**Cycle:** Run until 50% heat, then shut down

### MOX Fuel (Advanced)

Once you have a working reactor, you can breed MOX fuel from depleted cells:

| Fuel Type | EU per Cell | Special |
|-----------|-------------|---------|
| Uranium Cell | 1,000,000 EU | Standard |
| MOX Cell | 2,000,000 EU | Requires heat! |

**MOX Bonus:** MOX cells produce MORE power when the reactor is hot. A reactor at 50% heat produces 1.5x power with MOX!

---

## Tier 4: Renewable Energy

### Environmental Tech Solar Arrays

The ultimate in renewable power. These massive solar panels dwarf IC2's basic panels.

| Tier | Output | Size | Materials |
|------|--------|------|-----------|
| Solar Array Tier 1 | 160 RF/t | 3x3 | Basic materials |
| Solar Array Tier 2 | 1,280 RF/t | 5x5 | Litherite |
| Solar Array Tier 3 | 10,240 RF/t | 7x7 | Erodium |
| Solar Array Tier 4 | 81,920 RF/t | 9x9 | Kyronite |
| Solar Array Tier 5 | 655,360 RF/t | 11x11 | Pladium |
| Solar Array Tier 6 | 5,242,880 RF/t | 13x13 | Ionite |

**Note:** Output is during daytime. Night = 0 RF/t (unless you have the Night modifier).

### Solar Array Modifiers

| Modifier | Effect | Recipe Ingredient |
|----------|--------|-------------------|
| Speed | Increases RF generation | Redstone |
| Night | Generates power at night | Glowstone |
| Efficiency | Produces more from same input | Lapis |

### Environmental Tech vs IC2 Solar Comparison

| Generator | Output | Space | Cost |
|-----------|--------|-------|------|
| IC2 Solar Panel | 1 EU/t (2.5 RF/t) | 1 block | Low |
| 100 IC2 Panels | 100 EU/t (250 RF/t) | 100 blocks | Medium |
| ET Solar Tier 1 | 160 RF/t | 9 blocks (3x3) | Medium |
| ET Solar Tier 3 | 10,240 RF/t | 49 blocks (7x7) | High |

**Verdict:** Environmental Tech solar arrays are space-efficient and scale much better, but require progression through their resource tiers.

---

## Tier 5: End-Game Power

### Draconic Evolution Energy Core

The ultimate energy storage and transfer system.

| Tier | Storage | Transfer Rate |
|------|---------|---------------|
| Tier 1 | 45.5M RF | 100k RF/t |
| Tier 2 | 273M RF | 800k RF/t |
| Tier 3 | 1.64B RF | 6.4M RF/t |
| Tier 4 | 9.88B RF | 51.2M RF/t |
| Tier 5 | 59.3B RF | 409M RF/t |
| Tier 6 | 355B RF | 3.27B RF/t |
| Tier 7 | 2.14T RF | 26.2B RF/t |
| Tier 8 | 9,223P RF | Unlimited |

**Building an Energy Core:**
1. Place Energy Core block
2. Surround with Energy Pylons in a specific pattern
3. Add Draconic/Wyvern blocks for higher tiers
4. Insert Stabilizers at corners
5. Activate with right-click

### Draconic Reactor (Chaos Reactor)

**WARNING: This reactor can destroy your entire base if mismanaged!**

| Output | Risk | Fuel |
|--------|------|------|
| Up to 500k RF/t | Extreme | Awakened Draconium |

**Only attempt if:**
- You have Draconic tier equipment
- You understand containment field mechanics
- You have a kill switch (redstone shutoff)
- Your base can survive a 200-block explosion

---

## Energy Conversion

### Energy Converters Mod

The Energy Converters mod is your bridge between IC2, BuildCraft, and RF-based mods.

#### Conversion Chain

```
    EU Source (IC2)
         │
         ▼
┌───────────────────┐
│ EU Consumer Block │
└─────────┬─────────┘
          │ (internal buffer)
          ▼
┌───────────────────┐
│ Energy Bridge     │
└─────────┬─────────┘
          │ (internal buffer)
          ▼
┌───────────────────┐
│ RF Producer Block │
└─────────┬─────────┘
          │
          ▼
    RF Machine (DE, ET, etc.)
```

#### Conversion Blocks

| Block | Function |
|-------|----------|
| EU Consumer | Accepts EU from IC2 |
| EU Producer | Outputs EU to IC2 |
| MJ Consumer | Accepts MJ from BuildCraft |
| MJ Producer | Outputs MJ to BuildCraft |
| RF Consumer | Accepts RF/FE |
| RF Producer | Outputs RF/FE |
| Energy Bridge | Required center block |

#### Efficiency Warning

Energy conversion is NOT 100% efficient by design:

| Conversion | Ratio | Loss |
|------------|-------|------|
| EU → RF | 1:2.5 | ~5% |
| RF → EU | 2.5:1 | ~5% |
| MJ → RF | 1:10 | ~5% |
| RF → MJ | 10:1 | ~5% |

**Best Practice:** Generate power in the type you need when possible. Only convert when necessary.

---

## Power Plant Designs

### Design 1: The Starter Array (Early Game)

**Goal:** 50-100 EU/t for basic IC2 machines

```
Layout (Top View):
    [G][G][G]
    [G][B][G]
    [G][G][G]

G = Generator (coal)
B = Batbox

Output: 80 EU/t peak, ~40 EU/t average with coal automation
Cost: 8 generators, 1 batbox, ~64 copper for cables
```

### Design 2: The Geothermal Bank (Mid Game)

**Goal:** 200+ EU/t from Nether lava

```
Layout:
    Nether Side:
    [Pump] connected to [Ender Tank (hot)]
    
    Overworld Side:
    [Ender Tank (hot)]
         │ (fluid pipe)
         ▼
    [Geo][Geo][Geo][Geo]
    [Geo][MFE ][MFE][Geo]
    [Geo][Geo][Geo][Geo]

Output: 160 EU/t (8 geothermal generators)
Sustainability: Semi-infinite (Nether lava is vast)
```

### Design 3: The Combustion Farm (Mid Game)

**Goal:** High MJ output for BuildCraft automation

```
    [Refinery] ← Oil Tank ← Pumpjack
         │
         ▼
    Fuel Tank
         │
         ├──────┬──────┬──────┐
         ▼      ▼      ▼      ▼
    [CE+W] [CE+W] [CE+W] [CE+W]
         │      │      │      │
         └──────┴──────┴──────┘
                   │
                   ▼
            [Assembly Table / Quarry]

CE = Combustion Engine
W = Water supply (aqueous accumulator)

Output: 24 MJ/t (4 engines on fuel)
```

### Design 4: The Nuclear Facility (Late Mid Game)

**Goal:** Stable, high-output EU for industrial operations

```
    [Nuclear Reactor + 6 Chambers]
              │
              ▼
    [MFSU]──[MFSU]──[MFSU]
       │       │       │
       ▼       ▼       ▼
    [Glass Fibre Cable Bus]
       │       │       │
       ▼       ▼       ▼
    [Machine][Machine][Machine]

Output: 100-400 EU/t depending on design
Storage: 30M EU (3 MFSUs)
Safety: Requires proper venting, recommend isolation room
```

### Design 5: The Solar Farm (End Game)

**Goal:** Passive RF generation at massive scale

```
    Environmental Tech Solar Array Tier 4
    ┌─────────────────────────┐
    │  [S][S][S][S][S][S][S]  │
    │  [S][S][S][S][S][S][S]  │
    │  [S][S][S][S][S][S][S]  │ 
    │  [S][S][C][C][S][S][S]  │  C = Controller
    │  [S][S][C][C][S][S][S]  │  S = Solar Cell
    │  [S][S][S][S][S][S][S]  │
    │  [S][S][S][S][S][S][S]  │
    └─────────────────────────┘
              │
              ▼
    [Energy Bridge] → [EU/MJ Machines]
              │
              ▼
    [Draconic Energy Core]

Output: 81,920 RF/t (32,768 EU/t equivalent)
```

---

## Efficiency Comparison Tables

### EU Generation Comparison

| Generator | Output | Fuel Cost | EU per Fuel | Automation |
|-----------|--------|-----------|-------------|------------|
| Generator | 10 EU/t | Coal | 4,000 EU | Easy |
| Geothermal | 20 EU/t | Lava | 20,000 EU | Medium |
| Solar Panel | 1 EU/t | None | ∞ | None needed |
| Water Mill | 0.25 EU/t | None | ∞ | None needed |
| Nuclear | 100-400 EU/t | Uranium | 1M EU | Complex |

### MJ Generation Comparison

| Engine | Output | Fuel Cost | MJ per Fuel | Risk |
|--------|--------|-----------|-------------|------|
| Stirling | 1 MJ/t | Coal | 16,000 MJ | Low |
| Combustion (Oil) | 3 MJ/t | Oil | 10,000 MJ | Medium |
| Combustion (Fuel) | 6 MJ/t | Fuel | 100,000 MJ | Medium |
| Combustion (Biofuel) | 5 MJ/t | Biofuel | 50,000 MJ | Medium |

### Space Efficiency (RF/block)

| Generator | RF/t | Blocks | RF/t per Block |
|-----------|------|--------|----------------|
| IC2 Generator (converted) | 25 RF/t | 2 | 12.5 |
| Geothermal (converted) | 50 RF/t | 2 | 25 |
| ET Solar T1 | 160 RF/t | 9 | 17.8 |
| ET Solar T3 | 10,240 RF/t | 49 | 209 |
| ET Solar T6 | 5,242,880 RF/t | 169 | 31,023 |

### Cost Efficiency (Early Game)

| Setup | Cost (Approx) | Output | Best For |
|-------|---------------|--------|----------|
| 4 Generators | 16 Refined Iron, 32 Copper | 40 EU/t | Starting out |
| 2 Geothermals + Pump | 20 Iron, pump setup | 40 EU/t | If near lava |
| 8 Stirling Engines | 64 Stone, 64 Iron | 8 MJ/t | BuildCraft focus |
| 16 Solar Panels | 48 Coal Dust, circuits | 16 EU/t | Long-term passive |

---

## Common Mistakes to Avoid

### ❌ Mistake 1: Ignoring Energy Types
**Problem:** Connecting IC2 cables directly to BuildCraft machines  
**Result:** Nothing works  
**Solution:** Use Energy Converters to bridge systems

### ❌ Mistake 2: Combustion Engines Without Water
**Problem:** Running combustion engines dry  
**Result:** Engine explodes, destroys nearby blocks  
**Solution:** ALWAYS connect aqueous accumulator or water pump

### ❌ Mistake 3: Nuclear Reactor Without Venting
**Problem:** Building a reactor without heat management  
**Result:** Massive crater, radiation, death  
**Solution:** Start with Mark I designs, add vents generously

### ❌ Mistake 4: Over-Converting Energy
**Problem:** EU → RF → MJ → RF → EU chains  
**Result:** Massive efficiency losses (5% per conversion)  
**Solution:** Generate power in the type you need

### ❌ Mistake 5: No Energy Storage
**Problem:** Generators running with nowhere for power to go  
**Result:** Wasted fuel, potential machine damage  
**Solution:** Always buffer with Batboxes, MFSUs, Energy Cells, or DE cores

### ❌ Mistake 6: Undersized Cables
**Problem:** Using Copper Cable for HV applications  
**Result:** Cable burns, potentially fire  
**Solution:** Match cable tier to power level:
- Copper: Up to 32 EU/t (LV)
- Gold: Up to 128 EU/t (MV)  
- HV: Up to 512 EU/t (HV)
- Glass Fibre: Up to 8192 EU/t (EV)

---

## Quick Reference Card

```
╔═══════════════════════════════════════════════════════════╗
║              ENERGYCRAFT QUICK REFERENCE                  ║
╠═══════════════════════════════════════════════════════════╣
║  CONVERSION: 1 EU = 2.5 RF = 0.25 MJ                     ║
║              1 MJ = 10 RF = 4 EU                         ║
╠═══════════════════════════════════════════════════════════╣
║  IC2 VOLTAGE TIERS:                                       ║
║    LV: 32 EU/t    (Batbox)                               ║
║    MV: 128 EU/t   (MFE)                                  ║
║    HV: 512 EU/t   (MFSU)                                 ║
║    EV: 2048 EU/t  (Special applications)                 ║
╠═══════════════════════════════════════════════════════════╣
║  BEST VALUE FUELS:                                        ║
║    EU: Lava (Geothermal) - 20,000 EU/bucket              ║
║    MJ: Refined Fuel - 100,000 MJ/bucket                  ║
╠═══════════════════════════════════════════════════════════╣
║  DANGER WARNINGS:                                         ║
║    ⚠ Combustion Engine + No Water = EXPLOSION            ║
║    ⚠ Nuclear + No Cooling = MELTDOWN                     ║
║    ⚠ Wrong Cable Tier = FIRE                             ║
║    ⚠ Draconic Reactor = BASE DESTRUCTION                 ║
╚═══════════════════════════════════════════════════════════╝
```

---

## Progression Flowchart

```
START
  │
  ▼
[Manual Furnaces] ──────────────────────────────────────┐
  │                                                      │
  ▼                                                      │
[IC2 Generator + Batbox] ◄──────────────────────────────┤
  │                                                      │
  ├─────────────────┬────────────────────┐              │
  ▼                 ▼                    ▼              │
[Geothermal]    [Stirling]         [Solar Farm]        │
  │             [Engines]               │               │
  │                 │                   │               │
  │                 ▼                   │               │
  │         [Combustion Engines]       │               │
  │         [+ Refinery]               │               │
  │                 │                   │               │
  └────────┬────────┴───────────────────┘               │
           │                                            │
           ▼                                            │
    [Nuclear Reactor]                                   │
           │                                            │
           ▼                                            │
    [Environmental Tech Solar Arrays]                   │
           │                                            │
           ▼                                            │
    [Draconic Evolution Energy Core]                    │
           │                                            │
           ▼                                            │
        ENDGAME                                         │
           │                                            │
           └────────────────────────────────────────────┘
                    (Loop: Always need more power!)
```

---

## Appendix: Useful Calculations

### How Much Power Do I Need?

| Machine | Power Draw |
|---------|------------|
| Electric Furnace | 3 EU/t |
| Macerator | 2 EU/t |
| Compressor | 2 EU/t |
| Extractor | 2 EU/t |
| Induction Furnace | 16 EU/t (idle: 1 EU/t) |
| Mass Fabricator | 166 EU/t |
| BuildCraft Quarry | ~10-50 MJ/t |
| Assembly Table | 2.5-25 MJ/t |

### Planning Your Grid

**Early Game Target:** 50 EU/t + 10 MJ/t
- Powers: Basic IC2 processing + BuildCraft pipe systems

**Mid Game Target:** 200 EU/t + 50 MJ/t
- Powers: Multiple machine lines + Quarry

**Late Game Target:** 1000+ EU/t + 100+ MJ/t (or equivalent RF)
- Powers: Mass fabrication, multiple quarries, advanced automation

**End Game Target:** 100,000+ RF/t
- Powers: Draconic Evolution equipment charging, void miners, etc.

---

*"Remember: There's no such thing as too much power. Only not enough storage."*

---

*EnergyCraft Energy Pipeline Guide v1.0*
*Created by the EnergyCraft Curator*
