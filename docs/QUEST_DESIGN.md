# EnergyCraft Quest Book Design Document

> **Purpose:** Define the complete quest book implementation for EnergyCraft
> **System:** Better Questing + Standard Expansion + Quest Book
> **Philosophy:** Every mod serves a purpose. Every quest teaches or gates.

---

## Part 1: Mod Purpose Registry

### Legend
- 🎯 **Core Progression** - Required for main questline
- 🔀 **Optional Branch** - Side content, expands gameplay
- 🛠️ **Utility** - Quality of life, no quests needed
- 📚 **Meta** - Modpack infrastructure

---

### Tech Mods (Core Progression)

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **IC2 Classic** | Primary tech, EU power, ore processing | 🎯 Core - Era III-IV foundation | HIGH |
| **BuildCraft** | MJ power, automation, logistics | 🎯 Core - Era IV automation | HIGH |
| **Draconic Evolution** | End-game goals, power storage, boss | 🎯 Core - Era VIII-IX capstone | HIGH |
| **ProjectE** | Transmutation, EMC economy | 🎯 Core - Era V (gated) | HIGH |
| **Energy Converters** | EU↔MJ↔RF bridges | 🎯 Core - Era IV (enables cross-mod) | MEDIUM |

### Redstone & Wiring

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **Project Red Integration** | Logic gates, compact redstone | 🎯 Core - Era VI redstone | HIGH |
| **Project Red Transmission** | Bundled cables, long-distance | 🎯 Core - Era VI wiring | MEDIUM |
| **Project Red Transportation** | Routed pipes, item sorting | 🔀 Optional - Advanced logistics | MEDIUM |
| **Project Red Fabrication** | Custom ICs | 🔀 Optional - Expert redstone | LOW |
| **Project Red Lighting** | Decorative lights | 🔀 Optional - Aesthetics | LOW |
| **Project Red World** | Ores, tools, materials | 🛠️ Utility - Provides resources | LOW |
| **WR-CBE** | Wireless redstone | 🔀 Optional - Wireless systems | LOW |

### Automation & Logistics

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **Logistics Pipes** | Smart item routing, auto-crafting | 🔀 Optional - Expert automation | MEDIUM |
| **Additional Pipes** | BC pipe enhancements | 🛠️ Utility - BC expansion | LOW |

### Storage & Organization

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **Storage Drawers** | Bulk item storage | 🔀 Optional - Organization | MEDIUM |
| **Iron Chests** | Upgraded chests | 🛠️ Utility - Early storage | LOW |
| **Iron Tanks** | Large fluid storage | 🛠️ Utility - Fluid storage | LOW |
| **Ender Storage** | Cross-dimensional storage | 🔀 Optional - Advanced logistics | MEDIUM |

### Computing & Programming

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **CC:Tweaked** | Programmable computers, turtles | 🎯 Core - Era VII digital | HIGH |

### Industry & Production

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **Forestry** | Bees, farms, bio-production | 🔀 Optional - Alternative resources | MEDIUM |
| **Railcraft** | Rails, steam power, tanks | 🔀 Optional - Transport infrastructure | MEDIUM |

### World & Resources

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **Basic Nether Ores** | Nether mining content | 🛠️ Utility - Resource expansion | LOW |
| **Chisel** | Decorative blocks | 🔀 Optional - Building aesthetics | LOW |
| **BiblioCraft** | Furniture, display | 🔀 Optional - Decoration | LOW |

### Combat & Adventure

| Mod | Purpose | Progression Role | Quest Priority |
|-----|---------|------------------|----------------|
| **Balkon's Weapon Mod** | Additional weapons | 🔀 Optional - Combat variety | LOW |

### Quality of Life (No Quests Needed)

| Mod | Purpose | Notes |
|-----|---------|-------|
| **JEI** | Recipe lookup | 📚 Essential utility |
| **JEI Bees** | Forestry bee info | 📚 JEI addon |
| **Hwyla** | Block tooltips | 📚 Info display |
| **AppleSkin** | Food info | 📚 HUD enhancement |
| **Inventory Tweaks** | Auto-sorting | 📚 Convenience |
| **Xaero's Minimap** | Navigation | 📚 Map |
| **Xaero's World Map** | Full map | 📚 Map |
| **MaTmos** | Ambient sound | 📚 Atmosphere |
| **Fast Leaf Decay** | QoL | 📚 Performance |
| **Tree Chop** | Tree felling | 📚 QoL |

### Infrastructure (No Quests)

| Mod | Purpose |
|-----|---------|
| **Better Questing** | Quest system |
| **Standard Expansion** | Quest features |
| **Quest Book** | Physical item |
| **CraftTweaker** | Recipe modifications |
| **Forge Multipart** | Microblocks |
| **CodeChickenLib** | Library |
| **MrTJPCore** | Library |
| **Brandon's Core** | Library |
| **Chameleon** | Library |
| **CTM** | Connected textures |
| **Redstone Flux** | API |

---

## Part 2: Progression Framework

### Era Structure

```
ERA I: Stone Age          ──► Vanilla survival basics
       │
ERA II: Bronze Age        ──► First machines, manual processing  
       │
ERA III: Industrial Age   ──► IC2 basics, EU power
       │
ERA IV: Automation Age    ──► BuildCraft, pipes, automation
       │
       ├──► [BRANCH] Forestry Path (bees, farms)
       │
ERA V: Transmutation Age  ──► ProjectE unlocked, EMC economy
       │
       ├──► [BRANCH] Railcraft Path (rails, steam)
       │
ERA VI: Redstone Age      ──► Project Red, logic, wiring
       │
       ├──► [BRANCH] Logistics Path (smart routing)
       │
ERA VII: Digital Age      ──► CC:Tweaked, programming
       │
       ├──► [BRANCH] Storage Systems (drawers, ender)
       │
ERA VIII: Dragon Age      ──► Draconic Evolution, fusion
       │
ERA IX: Chaos Age         ──► Chaos Guardian, ultimate goals
```

### Gating Philosophy

| Gate Type | Example | Purpose |
|-----------|---------|---------|
| **Knowledge Gate** | "Craft a Macerator" before unlocking next era | Ensures player understands mechanic |
| **Resource Gate** | "Produce 10,000 EU" to unlock ProjectE | Proves infrastructure exists |
| **Boss Gate** | Kill Wither before Draconic tier | Traditional progression |
| **Item Gate** | Own specific items to unlock branches | Soft requirements |

---

## Part 3: Quest Line Specifications

### ERA I: Stone Age (Tutorial)
**Theme:** Survival basics, quest system introduction
**Quests:** 8-10
**Rewards:** Basic tools, starting resources

| Quest | Type | Task | Reward | Unlocks |
|-------|------|------|--------|---------|
| Welcome to EnergyCraft | Detection | Open quest book | Torch x16 | All Era I |
| Punch a Tree | Retrieval | Get 16 logs | Wood Pickaxe | Stone Tools |
| Stone Tools | Crafting | Craft stone pickaxe | Coal x16 | Mining Basics |
| Mining Basics | Retrieval | Get 32 cobblestone | Stone x64 | First Shelter |
| First Shelter | Crafting | Craft a bed | Wool x8 | Food & Farming |
| Food & Farming | Retrieval | Get 16 wheat | Bread x8 | Iron Age |
| Iron Age | Retrieval | Get 16 iron ingots | Iron Pickaxe | Diamond Hunt |
| Diamond Hunt | Retrieval | Get 3 diamonds | Diamond x2 | Era II unlock |
| **ERA I COMPLETE** | Gateway | All above complete | Celebratory fireworks | Era II |

---

### ERA II: Bronze Age
**Theme:** First tech steps, manual machines
**Quests:** 12-15
**Prereq:** Era I complete

| Quest | Type | Task | Reward | Unlocks |
|-------|------|------|--------|---------|
| The Age of Metals | Detection | Read lore entry | Copper Ore x8 | Copper & Tin |
| Copper & Tin | Retrieval | 32 each | Bronze Dust x16 | Bronze Tools |
| The Forge | Crafting | Build furnace setup | Iron Furnace | IC2 Preview |
| Rubber Hunt | Retrieval | 16 Rubber | Rubber x32 | Cable Basics |
| First Wires | Crafting | Craft copper cables | Cable x32 | Generator |
| Power Generation | Crafting | Build Generator | Coal x64 | Your First Circuit |
| Your First Circuit | Crafting | Electronic Circuit | Circuit x4 | Era III preview |
| **ERA II COMPLETE** | Gateway | Above complete | RE-Battery x4 | Era III |

---

### ERA III: Industrial Age
**Theme:** IC2 mastery, EU power systems
**Quests:** 20-25
**Prereq:** Era II complete

#### Power Generation Branch
| Quest | Task | Reward |
|-------|------|--------|
| Solar Power | Craft Solar Panel | Glowstone x8 |
| Water Power | Build Water Mill setup | Tin Cable x32 |
| Geothermal | Build Geo Generator | Lava Cells x16 |
| Nuclear Preview | Craft Reactor Chamber | Uranium x8 |

#### Ore Processing Branch
| Quest | Task | Reward |
|-------|------|--------|
| Double Your Ores | Use Macerator | Macerator x1 |
| Electric Furnace | Build E-Furnace | Iron Dust x32 |
| Extraction | Use Extractor | Rubber x64 |
| Compression | Use Compressor | Carbon Plate x8 |

#### Energy Storage Branch
| Quest | Task | Reward |
|-------|------|--------|
| BatBox Basics | Craft BatBox | RE-Battery x4 |
| CESU Step-up | Craft CESU | Gold Cable x16 |
| MFE Power | Craft MFE | Energy Crystal x1 |
| MFSU Mastery | Craft MFSU | Lapotron Crystal x1 |

#### Advanced Machines
| Quest | Task | Reward |
|-------|------|--------|
| Induction Furnace | Craft | Advanced Circuit x4 |
| Rotary Macerator | Craft | Steel Dust x32 |
| Advanced Circuit | Craft 4 | Circuit x8 |

| **ERA III COMPLETE** | Build MFE + 3 processors | Advanced Machine Block x4 | Era IV |

---

### ERA IV: Automation Age
**Theme:** BuildCraft, pipes, automated systems
**Quests:** 25-30
**Prereq:** Era III complete

#### Engine Basics
| Quest | Task | Reward |
|-------|------|--------|
| Redstone Power | Craft Redstone Engine | Redstone x32 |
| Sterling Engine | Craft | Coal x64 |
| Combustion Power | Craft Combustion Engine | Oil Bucket x4 |

#### Pipe Networks
| Quest | Task | Reward |
|-------|------|--------|
| Transport Pipes | Craft 32 pipes | Pipe x32 |
| Extraction | Use Wood Pipe + Engine | Iron Pipe x8 |
| Sorting | Use Diamond Pipe | Diamond Pipe x2 |
| Fluid Transport | Build fluid pipe system | Golden Fluid Pipe x4 |

#### Automation Projects
| Quest | Task | Reward |
|-------|------|--------|
| Auto-Smelting | Automate furnace I/O | Speed Upgrade |
| Auto-Macerating | Automate macerator | Overclocker x2 |
| Quarry Master | Build and run Quarry | Mining Well x2 |

#### Power Conversion
| Quest | Task | Reward |
|-------|------|--------|
| Bridge the Gap | Craft Energy Bridge | Converter blocks |
| EU to MJ | Convert 10,000 EU | Consumer/Producer set |
| Universal Power | Run multi-system factory | Era V key item |

| **ERA IV COMPLETE** | Automated ore processing + power conversion | Philosopher's Stone | Era V |

---

### ERA V: Transmutation Age
**Theme:** ProjectE, EMC economy
**Quests:** 15-20
**Prereq:** Era IV complete + Philosopher's Stone earned

#### EMC Basics
| Quest | Task | Reward |
|-------|------|--------|
| Equivalent Exchange | Learn EMC in transmutation table | Alchemical Coal x16 |
| Transmutation Table | Craft | Covalence Dust set |
| Learn Items | Teach 100 items to table | Mobius Fuel x8 |
| Your First Klein | Craft Klein Star Ein | Klein Star refill |

#### EMC Generation
| Quest | Task | Reward |
|-------|------|--------|
| Matter Production | Craft Dark Matter | Dark Matter x1 |
| EMC via Tech | Generate EMC from factory output | Aeternalis Fuel |
| Condenser | Craft MK1 Condenser | Covalence Dust x64 |

#### Advanced Transmutation
| Quest | Task | Reward |
|-------|------|--------|
| Red Matter | Craft Red Matter | RM Block x1 |
| Dark Matter Tools | Craft any DM tool | EMC bonus |
| Red Matter Armor | Craft full RM set | Era VI key |

| **ERA V COMPLETE** | Own full DM tool set + 1M EMC | Gem of Eternal Density | Era VI |

---

### ERA VI: Redstone Age
**Theme:** Project Red, logic, advanced wiring
**Quests:** 20-25
**Prereq:** Era V complete

#### Wiring Basics
| Quest | Task | Reward |
|-------|------|--------|
| Red Alloy | Craft Red Alloy Ingots | Wire x64 |
| First Wire | Place Red Alloy Wire | Insulated Wire x32 |
| Bundled Cable | Craft | Bundled Cable x16 |
| Color Coding | Use all 16 colors | Full color wire set |

#### Logic Gates
| Quest | Task | Reward |
|-------|------|--------|
| OR Gate | Craft and use | Gate materials |
| AND Gate | Craft and use | Gate materials |
| Timer | Craft and use | Pointer x4 |
| Latch | Build RS Latch | Advanced gate mats |
| Counter | Build counter circuit | Sequencer x2 |

#### Advanced Logic
| Quest | Task | Reward |
|-------|------|--------|
| State Cell | Craft | IC materials |
| Comparator | Build comparison circuit | Gate set |
| Bus Transceiver | Use bundled I/O | Fabrication preview |

#### Transportation (Optional Branch)
| Quest | Task | Reward |
|-------|------|--------|
| Routed Pipes | Craft Junction Pipe | Pipe set |
| Item Routing | Set up routed network | Chip set |
| Request System | Use Request Pipe | Crafting Pipe |

| **ERA VI COMPLETE** | Build working combination lock | Wireless Redstone set | Era VII |

---

### ERA VII: Digital Age
**Theme:** CC:Tweaked, programming, turtles
**Quests:** 20-25
**Prereq:** Era VI complete

#### Computer Basics
| Quest | Task | Reward |
|-------|------|--------|
| First Computer | Craft Computer | Disk Drive |
| Hello World | Run first program | Floppy Disk x4 |
| File System | Create and save file | Advanced Computer |

#### Peripheral Programming
| Quest | Task | Reward |
|-------|------|--------|
| Monitor Output | Display text on monitor | Monitor x4 |
| Redstone Control | Control RS via computer | Modem |
| Network | Connect computers | Cables x32 |

#### Turtle Power
| Quest | Task | Reward |
|-------|------|--------|
| Mining Turtle | Craft | Diamond Pickaxe |
| Excavate | Run excavate program | Fuel (coal x64) |
| Auto-Miner | Build turtle mining setup | Mining Turtle x2 |
| Turtle Farm | Automate farming | Farming Turtle |

#### Advanced Computing
| Quest | Task | Reward |
|-------|------|--------|
| Pocket Computer | Craft | GPS Host materials |
| GPS Network | Set up GPS | Era VIII key |
| Control Center | Build central computer hub | Advanced Turtle |

| **ERA VII COMPLETE** | Automated turtle system | Draconic Core | Era VIII |

---

### ERA VIII: Dragon Age
**Theme:** Draconic Evolution, fusion crafting, dragon
**Quests:** 15-20
**Prereq:** Era VII complete + End accessed

#### Draconium
| Quest | Task | Reward |
|-------|------|--------|
| To The End | Kill Ender Dragon | Dragon Heart |
| Draconium Mining | Get 64 Draconium | Draconium Block x4 |
| Draconic Core | Craft | Wyvern Core mats |

#### Energy Storage
| Quest | Task | Reward |
|-------|------|--------|
| Energy Core T1 | Build Tier 1 | Stabilizer x4 |
| Energy Core T4 | Build Tier 4 | Upgrade materials |
| Reactor Plans | Study Reactor | Reactor components |

#### Fusion Crafting
| Quest | Task | Reward |
|-------|------|--------|
| Fusion Core | Build Fusion Core | Injector x4 |
| First Fusion | Complete fusion craft | Wyvern Ingot x4 |
| Wyvern Gear | Craft Wyvern item | Draconic preview |

#### Draconic Tier
| Quest | Task | Reward |
|-------|------|--------|
| Awakened Draconium | Craft via fusion | AD Block x2 |
| Draconic Tools | Craft any Draconic tool | Chaotic preview |
| Draconic Armor | Craft armor piece | Era IX key |

| **ERA VIII COMPLETE** | Full Wyvern armor + T6 Energy Core | Chaos Shard hint | Era IX |

---

### ERA IX: Chaos Age (End-Game)
**Theme:** Chaos Guardian, ultimate challenges
**Quests:** 10-15
**Prereq:** Era VIII complete

#### Chaos Preparation
| Quest | Task | Reward |
|-------|------|--------|
| Scout the Chaos | Find Chaos Island | Map marker |
| Reactor Online | Build working DE Reactor | Draconium x128 |
| Ultimate Power | Generate 1M RF/t | Awakened Core |
| Chaotic Core | Craft | Chaos Guardian spawn item |

#### The Final Battle
| Quest | Task | Reward |
|-------|------|--------|
| Face the Guardian | Challenge Chaos Guardian | (upon victory) |
| Chaos Defeated | Kill Chaos Guardian | Chaos Shards + title |

#### Ultimate Goals
| Quest | Task | Reward |
|-------|------|--------|
| Chaotic Armor | Craft full Chaotic set | Cosmetic reward |
| Energy Core T8 | Build max tier | Achievement |
| EMC Mastery | Reach 1B EMC | Golden trophy |
| **ENERGYCRAFT MASTER** | All quests complete | Credits + celebratory item |

---

## Part 4: Optional Branch Details

### Forestry Branch (Unlocks Era IV)
**Theme:** Bees, farms, passive production
**Quests:** 15-20

- Bee basics, first hive
- Breeding mechanics
- Automated apiaries
- Rare bee species
- Tree breeding
- Farms and bio-fuel

### Railcraft Branch (Unlocks Era V)
**Theme:** Rails, steam, industrial transport
**Quests:** 12-15

- Track laying
- Carts and loaders
- Steam production
- Rolling machine
- Tunnel bore
- Rail networks

### Logistics Branch (Unlocks Era VI)
**Theme:** Smart item routing
**Quests:** 10-12

- Basic Logistics Pipes
- Provider/Requester setup
- Crafting automation
- Network management
- ME-style storage lite

### Storage Branch (Unlocks Era VII)
**Theme:** Organization and mass storage
**Quests:** 8-10

- Storage Drawers basics
- Drawer Controllers
- Compacting Drawers
- Ender Storage networks
- Cross-dimensional items

---

## Part 5: Implementation Checklist

### Phase 1: Structure Setup
- [ ] Create quest line JSON structure
- [ ] Set up era chapters
- [ ] Define gateway quests
- [ ] Configure spawn with book

### Phase 2: Core Content (Eras I-IV)
- [ ] Write Era I quests
- [ ] Write Era II quests
- [ ] Write Era III quests
- [ ] Write Era IV quests
- [ ] Set rewards and unlocks
- [ ] Playtest early game

### Phase 3: Mid-Game (Eras V-VII)
- [ ] Write Era V quests
- [ ] Write Era VI quests
- [ ] Write Era VII quests
- [ ] Balance EMC rewards
- [ ] Playtest mid-game

### Phase 4: End-Game (Eras VIII-IX)
- [ ] Write Era VIII quests
- [ ] Write Era IX quests
- [ ] Balance final rewards
- [ ] Playtest full progression

### Phase 5: Branches
- [ ] Forestry branch
- [ ] Railcraft branch
- [ ] Logistics branch
- [ ] Storage branch

### Phase 6: Polish
- [ ] Quest descriptions/lore
- [ ] Icons and visuals
- [ ] Achievement integration
- [ ] Final balance pass

---

## Part 6: Quest Writing Guidelines

### Description Style
```
**Good:** "The Macerator doubles your ore output by grinding ores into dust. 
         Smelt the dust for two ingots instead of one!"

**Bad:**  "Craft a macerator."
```

### Reward Philosophy
- **Early game:** Give materials that enable next step
- **Mid game:** Give convenience items, time savers
- **Late game:** Give cosmetics, achievements, bragging rights

### Difficulty Curve
- Era I-II: Hand-holding, generous rewards
- Era III-IV: Learning curve, fair rewards
- Era V-VI: Challenge increases, earned rewards
- Era VII-IX: Expert level, prestigious rewards

---

*Document Version: 1.0*
*Last Updated: February 2, 2026*
*Estimated Quest Count: ~185 main line + ~55 optional = ~240 total*
