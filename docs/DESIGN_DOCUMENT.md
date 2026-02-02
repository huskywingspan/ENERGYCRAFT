# Tekkit Remastered - Design Document

> *"Classic Tekkit, brought to 1.12.2 — with all the polish it never had."*

---

## Executive Summary

**Tekkit Remastered** is a curated modpack that faithfully recreates the magic of the original Tekkit experience while leveraging the stability and features of Minecraft 1.12.2. The pack prioritizes **stability**, **cohesion**, and **polish** over feature bloat, delivering a refined industrial/tech experience that respects players' time and intelligence.

**Target Audience:** Players who fondly remember classic Tekkit (circa 2012-2014) and want that nostalgic experience with modern quality-of-life improvements and bug fixes.

**Core Philosophy:** *Less is more.* Every mod earns its place.

---

## Design Pillars

### 1. 🏭 Industrial Authenticity
Capture the feel of classic Tekkit: IC2, BuildCraft, and RedPower (via Project Red) as the holy trinity of tech progression.

### 2. 🔧 Stability First
No experimental builds. No feature-incomplete mods. Every component must be battle-tested and reliable.

### 3. ✨ Polish Over Content
QoL improvements, cross-mod compatibility patches, and UI consistency take priority over adding "just one more tech mod."

### 4. 🎯 Focused Scope
Resist feature creep. If it wasn't in classic Tekkit or doesn't directly enhance the core experience, it doesn't belong.

---

## Current Mod Catalogue

### Category: Core Tech Mods (The Trinity)

| Mod | Version | Role | Classic Tekkit Equivalent |
|-----|---------|------|---------------------------|
| **IC2 Classic** | 1.12-1.5.5.2.1 | Primary power/machines | IndustrialCraft 2 |
| **BuildCraft** | 7.99.24.8 | Pipes, automation, MJ power | BuildCraft |
| **Project Red (Full Suite)** | 4.9.4.120 | Wiring, logic, world gen | RedPower 2 |

**Notes:**
- IC2 Classic chosen over IC2 Experimental to preserve original gameplay feel
- Project Red modules: Base, Integration, Fabrication, Lighting, Mechanical, World, Compat

---

### Category: Power Infrastructure

| Mod | Version | Role | Status |
|-----|---------|------|--------|
| **Redstone Flux API** | 2.1.1.1 | Cross-mod power standard | ✅ Core |
| **Energy Converters** | 1.3.7.30 | EU↔RF↔MJ bridges | ⚠️ Patched (CraftTweaker recipes) |
| **Energy Control** | 0.1.11 | IC2 monitoring/displays | ✅ Core |

**Known Issues:**
- Energy Converters requires custom CraftTweaker recipes for IC2 Classic compatibility
- EMC values added via ProjectE custom_emc.json

---

### Category: Logistics & Storage

| Mod | Version | Role | Classic Tekkit Equivalent |
|-----|---------|------|---------------------------|
| **Logistics Pipes** | 0.10.4.49 | Smart item routing | Logistics Pipes |
| **Additional Pipes** | 6.0.0.8 | Extra BuildCraft pipes | Additional Pipes |
| **Iron Chests** | 7.0.72.847 | Tiered storage | Iron Chests |
| **Iron Tanks** | 2.1.0-beta.18 | Tiered fluid storage | *New addition* |
| **Storage Drawers** | 5.5.3 | Bulk item storage | *New addition* |
| **Storage Drawers Extras** | 3.1.0 | Wood variant drawers | *New addition* |
| **Ender Storage** | 2.4.6.137 | Cross-dimensional storage | Ender Storage |

---

### Category: Equivalent Exchange / Alchemy

| Mod | Version | Role | Classic Tekkit Equivalent |
|-----|---------|------|---------------------------|
| **ProjectE** | PE1.4.1 | EMC transmutation | Equivalent Exchange 2 |

**Notes:**
- Custom EMC mappings needed for modded items (ongoing)
- Consider balance tweaks to prevent trivializing other progression

---

### Category: World Generation & Resources

| Mod | Version | Role | Status |
|-----|---------|------|--------|
| **Project Red - World** | (integrated) | Gems, marble, basalt | ✅ Core |
| **Basic Nether Ores** | 1.0.5.0 | Nether mining dimension | ⚠️ Review for balance |
| **Forestry** | 5.8.2.427 | Bees, trees, farming | ✅ Classic |
| **Railcraft** | 12.0.0 | Rails, steam, world gen | ✅ Classic |

---

### Category: Building & Aesthetics

| Mod | Version | Role | Status |
|-----|---------|------|--------|
| **Chisel** | 1.0.2.45 | Decorative blocks | ✅ Essential |
| **CTM (Connected Textures)** | 1.0.2.31 | Chisel dependency | ✅ Required |
| **Chameleon** | 4.1.3 | Storage Drawers dependency | ✅ Required |
| **BiblioCraft** | 2.4.6 | Furniture, bookshelves | ✅ Classic feel |

---

### Category: Combat & Adventure

| Mod | Version | Role | Status |
|-----|---------|------|--------|
| **Balkon's Weapon Mod** | 1.24.3 | Classic weapons | ✅ Keep - Was in original Tekkit 1.2.5 |

**Note:** Confirmed to be part of the original Tekkit experience. Muskets vs skeletons is a classic gameplay element.

---

### Category: Quality of Life

| Mod | Version | Role | Essential? |
|-----|---------|------|------------|
| **JEI** | 4.16.1.301 | Recipe browser | ✅ Essential |
| **JEI Bees** | 0.9.0.5 | Forestry bee integration | ✅ Essential |
| **Inventory Tweaks** | 1.63 | Auto-sorting | ✅ Essential |
| **Hwyla** | 1.8.26-B41 | Block tooltips | ✅ Essential |
| **AppleSkin** | 1.0.14 | Food saturation display | ✅ Essential |
| **Fast Leaf Decay** | v14 | QoL leaves disappear | ✅ Essential |
| **TreeChop** | 0.14.4 | Tree felling | ⚙️ Optional (disabled by default) |

**Decisions Made:**
- ~~NEI~~ → Removed in favor of JEI (cleaner, better maintained)
- TreeChop → Keep but make optional/configurable (spiritual successor to TreeCapitator)

---

### Category: Navigation & Mapping

| Mod | Version | Role | Status |
|-----|---------|------|--------|
| **Xaero's Minimap** | 24.6.1 | Minimap | ✅ Essential |
| **Xaero's World Map** | 1.39.12 | Full map | ✅ Essential |

---

### Category: Atmosphere & Immersion

| Mod | Version | Role | Status |
|-----|---------|------|--------|
| **MAtmos** | 35.3.1 | Environmental audio | ✅ Polish |

---

### Category: Redstone & Logic

| Mod | Version | Role | Classic Tekkit Equivalent |
|-----|---------|------|---------------------------|
| **Project Red - Integration** | (integrated) | Logic gates | RedPower 2 Logic |
| **Wireless Redstone CBE** | 2.3.2.33 | Wireless signals | Wireless Redstone |

---

### Category: Libraries & APIs

| Mod | Version | Purpose |
|-----|---------|---------|
| **CodeChicken Lib** | 3.2.3.358 | NEI, Ender Storage, etc. |
| **MrTJPCore** | 2.1.4.43 | Project Red |
| **Forge Multipart CBE** | 2.6.2.83 | Microblocks, covers |
| **Redstone Flux** | 2.1.1.1 | RF API |
| **Chameleon** | 4.1.3 | Storage Drawers |
| **CTM** | 1.0.2.31 | Chisel |

---

### Category: Compatibility & Patching

| Mod | Version | Purpose |
|-----|---------|---------|
| **CraftTweaker** | 4.1.20.710 | Recipe patching |
| **Project Red - Compat** | (integrated) | Cross-mod compatibility |

---

## Mod Audit Summary

| Category | Count | Status |
|----------|-------|--------|
| Core Tech | 3 | ✅ Solid |
| Power Infrastructure | 3 | ⚠️ Needs patching |
| Logistics & Storage | 7 | ✅ Good |
| Alchemy | 1 | ⚠️ Balance review |
| World Gen | 4 | ⚠️ Balance review |
| Building | 4 | ✅ Good |
| Combat | 1 | ❓ Scope question |
| QoL | 8 | ⚠️ Redundancy check |
| Navigation | 2 | ✅ Good |
| Atmosphere | 1 | ✅ Good |
| Redstone | 2 | ✅ Good |
| Libraries | 6 | ✅ Required |
| Compatibility | 2 | ✅ Required |
| **TOTAL** | **44 mods** | |

---

## Compatibility Matrix

### Known Issues & Patches Required

| Issue | Affected Mods | Solution | Status |
|-------|---------------|----------|--------|
| Energy Converters recipes missing | Energy Converters + IC2 Classic | CraftTweaker script | ✅ Patched |
| Energy Converters EMC values | Energy Converters + ProjectE | custom_emc.json | ✅ Patched |
| *(Add more as discovered)* | | | |

---

## Proposed Roadmap

### Phase 1: Stabilization (Current)
- [x] Establish core mod list
- [x] Patch Energy Converters compatibility
- [ ] Audit all recipe conflicts
- [ ] Test all power conversions (EU↔RF↔MJ)
- [ ] Verify Forestry + IC2 Classic interactions
- [ ] Test Logistics Pipes with all storage mods

### Phase 2: Balance Pass
- [ ] Review ProjectE EMC values for all modded items
- [ ] Balance Basic Nether Ores spawn rates
- [ ] Review Forestry bee breeding times
- [ ] Ensure progression feels natural (not too fast/slow)

### Phase 3: Polish
- [ ] Consistent keybindings across all mods
- [ ] JEI category organization
- [ ] Custom main menu/loading screen
- [ ] Pack documentation/guidebook
- [ ] Starter kit/quest book (optional)

### Phase 4: Publication
- [ ] Final compatibility testing
- [ ] Performance optimization
- [ ] Server configuration files
- [ ] CurseForge/Modrinth listing
- [ ] Community feedback period

---

## Open Questions

### Scope Decisions Made ✅

1. **~~NEI vs JEI~~:** ✅ DECIDED - JEI only. NEI removed.

2. **~~Weapon Mod~~:** ✅ DECIDED - Keep. Was in original Tekkit 1.2.5.

3. **TreeChop + Fast Leaf Decay:** ✅ DECIDED - Keep both.
   - Fast Leaf Decay = leaves disappear faster (subtle QoL)
   - TreeChop = full tree felling (like TreeCapitator) - make optional/configurable

4. **Basic Nether Ores:** ⚠️ Still pending balance review
   - May trivialize resource gathering
   - Recommendation: Configure spawn rates or make optional

5. **Storage Drawers:** ✅ DECIDED - Keep. Fills the role barrels used to fill.

### Remaining Questions

6. **CC:Tweaked:** ✅ RESOLVED - Use version 1.80pr1.7 (NOT newer versions!)
   - Was core to original Tekkit experience
   - Previous crash caused by using 1.18+ version (wrong Forge API)
   - Download from: https://github.com/cc-tweaked/CC-Tweaked/releases/tag/v1.80pr1.7

7. **Pack Identity/Name:** 🔄 In progress - Need new name (trademark considerations)
   - Must avoid "Tekkit" branding
   - Should evoke nostalgia while being distinct

---

## Mods to Consider Adding

| Mod | Rationale | Risk | Status |
|-----|-----------|------|--------|
| **CC:Tweaked** | Was in original Tekkit, programming turtles | Compatibility issues | 🔄 Attempting |
| **Applied Energistics 2** | Popular request, but scope creep | High complexity | ❌ Not planned |
| **Thermal Expansion** | RF power backbone | May overshadow IC2 | ❌ Not planned |
| **OpenBlocks** | Tanks, fans, QoL | Feature creep risk | ❓ Under consideration |
| **JABBA (Barrels)** | Classic storage | Storage Drawers fills this | ❌ Not needed |
| **Steve's Carts** | Mining, farming automation | Overlaps with other mods | ❓ Under consideration |

**Philosophy:** Be very conservative. The pack's identity is "classic Tekkit, polished" — not "kitchen sink tech."

---

## Mods Removed

| Mod | Reason | Replacement |
|-----|--------|-------------|
| **Not Enough Items (NEI)** | Redundant with JEI | JEI |

---

## Optional Mods Strategy

Some mods should be available but not forced on players:

| Mod | Default State | Rationale |
|-----|---------------|-----------|
| **TreeChop** | Disabled | Significantly changes vanilla tree behavior; not everyone wants it |

**Implementation Options:**
1. `mods/optional/` folder with instructions to move into `mods/`
2. Config-based disable (if mod supports it)
3. CurseForge optional dependency

---

## Configuration Philosophy

### Default Settings Should:
1. **Not overwhelm new players** — sensible defaults
2. **Respect the "classic" feel** — no hand-holding
3. **Enable expert mode options** — for veterans who want challenge
4. **Be server-friendly** — reasonable performance defaults

### Key Config Decisions:
- [ ] IC2 Classic: Hard recipes or easy?
- [ ] ProjectE: Flying ring enabled? 
- [ ] Forestry: Default or accelerated breeding?
- [ ] Railcraft: All modules enabled?

---

## Branding & Identity

### The Challenge
"Tekkit" is a Technic Platform trademark. For CurseForge/Modrinth publication, we need an original name that:
- Evokes the nostalgia of classic Tekkit
- Positions this as a fresh, polished experience
- Is legally distinct and ownable

### Pack Name Candidates

**Industrial/Tech Themed:**
- **IndustrialCraft Revival** - Direct callback, but IC2 isn't the only focus
- **RedPower Reborn** - Nope, Project Red isn't the star either
- **Factory Reforged** - Generic but safe
- **Gearworks** - Simple, evocative

**Nostalgia + Quality Themed:**
- **Retro Industrial** - Vintage + tech
- **Classic Craft: Industrial** - "Classic" signals the era
- **The Factory Floor** - Evocative, workmanlike
- **Pipe Dream** - Fun, references BuildCraft

**Era-Specific:**
- **Golden Age Tech** - References 1.2.5 era
- **2012 Tech Pack** - Very specific nostalgia
- **Beta Era Industries** - Similar vibe

**Polish/Quality Themed:**
- **Industrial Refined** - Emphasizes the polish
- **Tech Pack Definitive** - Bold claim
- **The Complete Factory** - Implies nothing missing

**Current Favorites (for discussion):**
1. **Gearworks** - Simple, memorable, industrial
2. **Industrial Refined** - Emphasizes polish + tech
3. **Factory Reforged** - Clear intent, sounds like a quality remake
4. **Retro Industrial** - Nostalgia baked in

### Tagline Options
- *"Classic tech modding, finally finished."*
- *"The industrial revolution you remember, the quality you deserve."*
- *"Nostalgia-driven. Quality-obsessed."*
- *"1.12.2. All the classics. None of the jank."*
- *"Your favorite mods. Actually working together."*

---

## Success Metrics

A successful 1.0 release means:
- [ ] Zero game-breaking bugs
- [ ] All recipes work and are discoverable
- [ ] Power systems interoperate cleanly
- [ ] 4+ hours of play without crashes
- [ ] Server-compatible out of the box
- [ ] Documentation for new players
- [ ] Positive community reception

---

## Appendix A: Classic Tekkit Mod List (Reference)

For historical reference, classic Tekkit (Minecraft 1.2.5) included:
- IndustrialCraft 2
- BuildCraft
- RedPower 2
- Equivalent Exchange 2
- Forestry
- Railcraft
- ComputerCraft
- Wireless Redstone
- Iron Chests
- Balkons Weapon Mod
- Power Converters
- Ender Storage
- Various smaller utilities

**Coverage Assessment:**
- ✅ IC2 → IC2 Classic
- ✅ BuildCraft → BuildCraft
- ✅ RedPower 2 → Project Red
- ✅ EE2 → ProjectE
- ✅ Forestry → Forestry
- ✅ Railcraft → Railcraft
- ❌ ComputerCraft → *Not included*
- ✅ Wireless Redstone → Wireless Redstone CBE
- ✅ Iron Chests → Iron Chests
- ⚠️ Balkons Weapon Mod → Weapon Mod (review inclusion)
- ✅ Power Converters → Energy Converters
- ✅ Ender Storage → Ender Storage

---

## Appendix B: Files Structure

```
Tekkit Remastered/
├── config/                    # Mod configurations
├── scripts/                   # CraftTweaker patches
│   └── energyconverters_recipes.zs
├── mods/                      # Mod JARs
├── resourcepacks/             # Custom textures (future)
├── DESIGN_DOCUMENT.md         # This document
├── CHANGELOG.md               # Version history (create)
└── README.md                  # Player-facing documentation (create)
```

---

## Document History

| Version | Date | Changes |
|---------|------|---------|
| 0.1 | 2026-02-02 | Initial draft, mod catalogue |

---

*This is a living document. Update as decisions are made and the pack evolves.*
