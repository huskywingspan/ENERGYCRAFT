# Changelog

All notable changes to this modpack will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

### Added
- **ProjectE Integration** - Tech-gated transmutation progression
  - CraftTweaker script: `scripts/projecte_integration.zs`
  - **Dark Matter** gated behind IC2 Advanced Circuits
  - **Red Matter** gated behind Draconic Cores (late-game)
  - **Klein Star Omega** gated behind Wyvern Cores (end-game)
  - **Watch of Flowing Time** gated (Advanced Circuit + Diamond Gear)
  - **Collectors/Relays MK2+** require circuits
  - **Condenser MK2** requires Advanced Circuit + Glass Fibre

- **EMC Exploit Prevention** (custom_emc.json updates)
  - IC2 Scrap, Scrapbox, UU-Matter = 0 EMC (prevent recycler loop)
  - Forestry bee products = 0 EMC (beeswax, honey, propolis, combs)
  - Mob farm outputs reduced (Blaze Rod 512, Ender Pearl 256, Ghast Tear 1024)

- **Tech Item EMC Rewards** (reward crafting investment)
  - IC2 Electronic Circuit = 1024 EMC
  - IC2 Advanced Circuit = 4096 EMC
  - BuildCraft Gears: Iron 256, Gold 1024, Diamond 2048 EMC
  - Project Red Silicon Chip = 512 EMC
  - IC2 Glass Fibre Cable = 512 EMC

- **Modpack Distribution System**
  - `setup.ps1` - Automated mod download script (fetches from GitHub Releases)
  - `tools/package-mods.ps1` - Packages mods into distributable archive
  - `mod-manifest.txt` - Auto-generated list of all 51 mods
  - Updated README with proper installation instructions

- **Better Questing System** - Quest book progression implemented
  - Better Questing 3.5.312 + Standard Expansion 3.4.167 + Quest Book 3.1.1
  - Era I: Stone Age (10 quests) fully implemented programmatically
  - `config/betterquesting/DefaultQuests.json` - Quest database
  - `docs/QUEST_DESIGN.md` - Full quest framework (9 eras, ~240 quests)
  - `docs/quests/ERA_I_IMPLEMENTATION.md` - Implementation guide
  - Quest book spawns with new players (questbook.cfg)

- **Draconic Evolution Integration** - End-game power sink and boss content
  - CraftTweaker script: `scripts/draconic_evolution.zs`
  - Energy Storage Core gated behind IC2 Advanced Machine Casings
  - Fusion Crafting Injector requires IC2 MV Transformer
  - Fusion Crafting Core requires IC2 HV Transformer
  - Draconic/Wyvern Cores require IC2 circuits
  - Energy Pylon requires BuildCraft Diamond Gear
  - Reactor components require EV-tier tech + Glass Fibre Cable
  - Dislocator requires basic circuit (QoL teleportation)

- **Environmental Tech Integration** - Void miners as late-game power sinks
  - CraftTweaker script: `scripts/environmental_tech.zs`
  - **Void Ore Miners:** Tier progression gated behind tech:
    - T1-2: IC2 Advanced Circuits + BuildCraft Diamond Gear
    - T3-4: Draconium + Draconic Cores
    - T5-6: Awakened Draconium + Chaos Shards
  - **Void Resource Miners:** Same gating structure
  - **Solar Arrays:** T1-2 disabled, T3+ requires Draconic Evolution
  - **Lightning Rod:** Light gating (fun, weather-dependent)
  - **Nanobot Beacon:** Light gating (QoL feature)
  - **Crystal Progression:** Each tier requires previous + tech components
  
### Configuration Pending
- **Draconic Evolution config** - Requires mod installation first
  - Mob Grinder: DISABLE
  - Chaos Guardian health: 3x multiplier
  - Armor mining speed boost: DISABLE (if available)

### Configuration (IC2 Classic Balance)
- **UU-Matter Production:** Now requires scrap amplifier (`UUNeedsScrap=true`)
  - Adds meaningful resource loop to late-game replication
  - +5 progress per amplifier used
- **Uranium Enrichment:** Harder processing enabled (`enableHardEnrichedUran=true`)
  - Gates nuclear power behind more infrastructure
  - Aligns with Era V (Nuclear Era) progression

### EMC Values (ProjectE)
- Draconium Ore/Ingot: 8,192 EMC
- Draconium Block: 73,728 EMC
- Dragon Heart: 1,000,000 EMC (boss reward)
- Chaos Shard: NO EMC (prevent exploits)
- Awakened Draconium: NO EMC (fusion craft only)
- Awakened Core: NO EMC (requires Chaos Guardian)
- Draconic Core: 16,384 EMC
- Wyvern Core: 65,536 EMC
- **Environmental Tech Crystals:**
  - Litherite: 4,096 EMC
  - Erodium: 8,192 EMC
  - Kyronite: 16,384 EMC
  - Pladium: 32,768 EMC
  - Ionite: 65,536 EMC
  - Aethium: NO EMC (end-game)
- **All Void Miner/Solar Controllers:** NO EMC (prevent exploits)

---

### Research Completed (Phase 1)
- **Draconic Evolution** - Full evaluation completed ([research/draconic_evolution_evaluation.md](research/draconic_evolution_evaluation.md))
  - Recommendation: Add with heavy configuration
  - Energy Core confirmed as primary end-game power sink
  - Armor needs disabling or extreme gating
  - Fusion Crafting = our "Forge of Creation"

### Added
- **CC:Tweaked** (1.89.2) - ComputerCraft fork for programmable computers and turtles
  - Downloaded from SquidDev Maven (CurseForge version removed)
  - This is the final 1.12.2 version with all bug fixes
  - Adds: Computers, Turtles, Monitors, Modems, Speakers, Printers
- **CraftTweaker** (4.1.20.710) - For recipe patching and mod compatibility
- **Energy Converters** (1.3.7.30) - EU↔RF↔MJ power conversion (manually added)
- **AppleSkin** (1.0.14) - Food saturation HUD overlay
- **BiblioCraft** (2.4.6) - Decorative furniture and functional blocks
- **Chisel** (1.0.2.45) + **CTM** (1.0.2.31) - Decorative block variants
- **Ender Storage** (2.4.6.137) - Cross-dimensional storage
- **Fast Leaf Decay** (v14) - QoL: Leaves decay faster after tree chopping
- **Forestry** (5.8.2.427) - Bees, trees, and farming automation
- **Hwyla** (1.8.26-B41) - What Am I Looking At tooltips
- **Iron Tanks** (2.1.0-beta.18) - Tiered fluid storage
- **JEI Bees** (0.9.0.5) - Forestry bee integration for JEI
- **Logistics Pipes** (0.10.4.49) - Smart item routing for BuildCraft
- **MAtmos** (35.3.1) - Environmental ambient sounds
- **Storage Drawers** (5.5.3) + **Extras** (3.1.0) - Bulk item storage
- **TreeChop** (0.14.4) - Tree felling mechanic (optional, may be disabled by default)
- **Xaero's Minimap** (24.6.1) + **World Map** (1.39.12) - Navigation

### Changed
- **Recipe: Energy Converters** - All recipes rewritten via CraftTweaker for IC2 Classic compatibility
  - Now uses ore dictionary (`<ore:circuitBasic>`, `<ore:circuitAdvanced>`) for circuits
  - Uses IC2 Classic cable metadata format (`<ic2:itemcable:N>`)
  - All 18 converter blocks now have working recipes

### Removed
- **Not Enough Items (NEI)** - Removed in favor of JEI for cleaner, modern recipe browsing

### Fixed
- **Energy Converters + IC2 Classic incompatibility** - Original mod expected IC2 Experimental item IDs (`ic2:cable`), which don't exist in IC2 Classic. Custom CraftTweaker recipes now provide full functionality.

### Configuration
- **ProjectE custom_emc.json** - Added EMC values for all Energy Converters blocks:
  - Energy Bridge: 8,192 EMC
  - LV Converters: 4,096 EMC
  - MV Converters: 8,192 EMC
  - HV Converters: 16,384 EMC
  - EV Converters: 32,768 EMC
  - IV Converters: 65,536 EMC
  - RF/FE Converters: 8,192 EMC
  - MJ Converters: 12,288 EMC

---

## Base Modpack - Tekkit Remastered Foundation

### Core Mods (The Classic Trinity)
- **IC2 Classic** (1.12-1.5.5.2.1) - Industrial power and machines
- **BuildCraft** (7.99.24.8) - Pipes, automation, MJ power
- **Project Red** (4.9.4.120) - Full suite: Base, Integration, Fabrication, Lighting, Mechanical, World, Compat

### Supporting Mods
- **Railcraft** (12.0.0) - Rails, steam power, world generation
- **ProjectE** (PE1.4.1) - Equivalent Exchange 2 successor
- **Basic Nether Ores** (1.0.5.0) - Nether dimension mining
- **Iron Chests** (7.0.72.847) - Tiered storage chests
- **Inventory Tweaks** (1.63) - Auto-sorting
- **JEI** (4.16.1.301) - Recipe browsing
- **Wireless Redstone CBE** (2.3.2.33) - Wireless redstone signals
- **Additional Pipes** (6.0.0.8) - Extra BuildCraft pipes
- **Balkon's Weapon Mod** (1.24.3) - Classic weapons (muskets!)

### Libraries & APIs
- CodeChicken Lib (3.2.3.358)
- MrTJPCore (2.1.4.43)
- Forge Multipart CBE (2.6.2.83)
- Redstone Flux API (2.1.1.1)
- Chameleon (4.1.3)

---

## Pending / Planned

### To Investigate
- [ ] CC:Tweaked 1.80pr1.7 for 1.12.2 (NOT newer versions - they're for 1.16+)
  - **Manual download required** (GitHub connection issues)
  - Go to: https://github.com/cc-tweaked/CC-Tweaked/releases/tag/v1.80pr1.7
  - Download the JAR from Assets section
  - Place in `mods/` folder
  - Previous crash was caused by using a 1.18+ version
- [ ] TreeChop default-off configuration or optional mods folder

### Upstream Contributions
- [ ] Document Energy Converters IC2 Classic incompatibility for potential PR
- [ ] Report any other mod compatibility issues found

---

## Technical Notes

### IC2 Classic Item Format Reference
IC2 Classic uses metadata-based items rather than separate registry names:

**Cables** (`ic2:itemcable`):
- `:0` = Copper Cable (uninsulated)
- `:1` = Insulated Copper Cable
- `:2` = Gold Cable (uninsulated)
- `:3` = Insulated Gold Cable
- `:7` = 2x Insulated HV Cable
- `:9` = Glass Fibre Cable

**Circuits** (via Ore Dictionary):
- `<ore:circuitBasic>` = Electronic Circuit
- `<ore:circuitAdvanced>` = Advanced Circuit

### Files Modified
- `scripts/energyconverters_recipes.zs` - CraftTweaker recipe script
- `config/ProjectE/custom_emc.json` - EMC value definitions
