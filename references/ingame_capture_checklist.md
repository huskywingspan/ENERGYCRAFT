# In-Game Item ID Capture Checklist

> **Purpose:** Items to hold and run `/ct hand` on to get exact CraftTweaker IDs
> **Method:** Hold item → run `/ct hand` → ID copies to clipboard & logs to `crafttweaker.log`

---

## Priority 1: IC2 Classic Machines (Most Urgent)

These need verification because IC2 Classic uses different IDs than IC2 Experimental.

### Basic Machines
- [ ] Electric Furnace - <ic2:blockmachinelv:2>
- [ ] Macerator - <ic2:blockmachinelv:3>
- [ ] Extractor - <ic2:blockmachinelv:4>
- [ ] Compressor - <ic2:blockmachinelv:5>
- [ ] Recycler - <ic2:blockmachinelv:7>
- [ ] Metal Former - Couldn't find this in JEI
- [ ] Canning Machine - <ic2:blockmachinelv:6>

### Advanced Machines
- [ ] Induction Furnace - <ic2:blockmachinemv:1>
- [ ] Rotary Macerator - <ic2:blockmachinemv:2>
- [ ] Centrifugal Extractor - <ic2:blockmachinemv:3>
- [ ] Singularity Compressor - <ic2:blockmachinemv:4>
- [ ] Advanced Canning Machine - Couldn't find in JEI

### Generators
- [ ] Generator (basic) - <ic2:blockgenerator>
- [ ] Geothermal Generator - <ic2:blockgenerator:1>
- [ ] Solar Panel - <ic2:blockgenerator:3>
- [ ] Water Mill - <ic2:blockgenerator:2>
- [ ] Wind Mill - <ic2:blockgenerator:4>
- [ ] Nuclear Reactor - <ic2:blockgenerator:5>
- [ ] Radioisotope Thermoelectric Generator - couldn't find in JEI

### Transformers & Storage
- [ ] LV Transformer
- [ ] MV Transformer  
- [ ] HV Transformer
- [ ] EV Transformer
- [ ] BatBox
- [ ] CESU
- [ ] MFE
- [ ] MFSU

### Crafting Components
- [ ] Electronic Circuit
- [ ] Advanced Circuit
- [ ] Machine Casing
- [ ] Advanced Machine Casing
- [ ] Coil
- [ ] Electric Motor
- [ ] Heat Conductor

### Cables (verify meta values)
- [ ] Copper Cable (insulated)
- [ ] Tin Cable
- [ ] Gold Cable
- [ ] Glass Fibre Cable
- [ ] HV Cable

---

## Priority 2: BuildCraft Items

### Engines
- [ ] Redstone Engine
- [ ] Stirling Engine (Steam Engine)
- [ ] Combustion Engine

### Gears
- [ ] Wood Gear
- [ ] Stone Gear
- [ ] Iron Gear
- [ ] Gold Gear
- [ ] Diamond Gear

### Pipes (Transport)
- [ ] Wood Transport Pipe
- [ ] Cobblestone Transport Pipe
- [ ] Stone Transport Pipe
- [ ] Iron Transport Pipe
- [ ] Gold Transport Pipe
- [ ] Diamond Transport Pipe
- [ ] Obsidian Transport Pipe

### Pipes (Fluid)
- [ ] Wood Fluid Pipe
- [ ] Cobblestone Fluid Pipe
- [ ] Iron Fluid Pipe
- [ ] Gold Fluid Pipe

### Pipes (Power/Kinesis)
- [ ] Wood Kinesis Pipe
- [ ] Cobblestone Kinesis Pipe
- [ ] Stone Kinesis Pipe
- [ ] Gold Kinesis Pipe

### Machines
- [ ] Quarry
- [ ] Mining Well
- [ ] Pump
- [ ] Filler
- [ ] Builder
- [ ] Architect Table
- [ ] Assembly Table
- [ ] Integration Table

### Chipsets
- [ ] Redstone Chipset
- [ ] Iron Chipset
- [ ] Gold Chipset
- [ ] Diamond Chipset

---

## Priority 3: Draconic Evolution Items

### Cores
- [ ] Draconic Core
- [ ] Wyvern Core
- [ ] Awakened Core
- [ ] Chaotic Core

### Fusion Crafting
- [ ] Fusion Crafting Core
- [ ] Basic Fusion Crafting Injector
- [ ] Wyvern Fusion Crafting Injector
- [ ] Awakened Fusion Crafting Injector
- [ ] Chaotic Fusion Crafting Injector

### Energy Storage
- [ ] Energy Core
- [ ] Energy Core Stabilizer
- [ ] Energy Pylon
- [ ] Particle Generator
- [ ] Reactor Core
- [ ] Reactor Stabilizer

### Materials
- [ ] Draconium Ingot
- [ ] Draconium Block
- [ ] Awakened Draconium Ingot
- [ ] Awakened Draconium Block
- [ ] Dragon Heart
- [ ] Chaos Shard

### Tools/Weapons (for EMC decisions)
- [ ] Draconic Sword
- [ ] Draconic Pickaxe
- [ ] Draconic Staff of Power

---

## Priority 4: Project Red Items

### Transportation (verify these exist!)
- [ ] Item Transport Pipe
- [ ] Routed Junction Pipe
- [ ] Routed Interface Pipe
- [ ] Routed Request Pipe
- [ ] Routed Crafting Pipe

### Chips (for transport pipes)
- [ ] Item Responder Chip
- [ ] Item Extractor Chip
- [ ] Item Broadcaster Chip
- [ ] Item Stock Keeper Chip

### Wires
- [ ] Red Alloy Wire
- [ ] Insulated Wire (any color)
- [ ] Bundled Cable

### Gates (sample)
- [ ] OR Gate
- [ ] AND Gate
- [ ] Timer
- [ ] Sequencer

---

## Priority 5: Energy Converters

- [ ] EU Consumer (RF→EU)
- [ ] EU Producer (EU→RF)
- [ ] MJ Consumer
- [ ] MJ Producer
- [ ] Energy Bridge

---

## Quick Reference: /ct Commands

```
/ct hand              - ID of held item (copies to clipboard)
/ct hand amount       - Same but includes stack size
/ct inventory         - Dumps all inventory items to log
/ct blockinfo         - Info about block you're looking at
/ct biome             - Current biome info
/ct syntax            - Help with ZenScript syntax
```

## Log Location

After running commands, check:
```
<instance>/logs/crafttweaker.log
```

---

## Template for Recording

When you capture an ID, record it like this:

```markdown
### [Item Name]
- **ID:** `<mod:item:meta>`
- **Ore Dict:** (if applicable)
- **Notes:** (anything special)
```

---

## Output File

Save captured IDs to: `references/item_ids/captured_ids.md`

I can process your captured data and update the technical reference once you have it!

---

*Created: February 2, 2026*
