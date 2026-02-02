# Gemini Deep Research Prompt: EnergyCraft Modpack Technical Reference

### Context
I'm developing a Minecraft 1.12.2 modpack called EnergyCraft using **IC2 Classic** (NOT IC2 Experimental), BuildCraft, Draconic Evolution, and Environmental Tech. I'm using CraftTweaker for recipe modifications and need accurate item registry names.

---

## 🔴 HIGH PRIORITY: IC2 Classic Item Registry Reference

**The Problem:**
CraftTweaker recipes using `<ic2:blockmachine:X>` syntax fail because that's IC2 **Experimental** syntax. IC2 Classic uses different registry names.

**What I Need:**
1. **Complete list of IC2 Classic block registry names** for:
   - All machine blocks (Macerator, Compressor, Electric Furnace, etc.)
   - All transformer blocks (LV, MV, HV, EV Transformers)
   - Advanced Machine Casing
   - Nuclear Reactor and reactor components
   - Energy storage blocks (BatBox, CESU, MFE, MFSU)
   - Generators (all types)

2. **CraftTweaker syntax examples** that actually work with IC2 Classic, such as:
   - How to reference machines in recipes
   - Whether metadata values are used or if blocks have separate IDs
   - Any ore dictionary entries that IC2 Classic registers

3. **Method to dump IC2 Classic item IDs** via:
   - CraftTweaker `/ct hand` or `/ct dump` commands
   - JEI item ID display
   - Any IC2 Classic debug commands

**Search Sources to Check:**
- IC2 Classic GitHub repository (Speiger's fork)
- IC2 Classic wiki or documentation
- FTB Forums threads about IC2 Classic CraftTweaker
- CurseForge comments on IC2 Classic
- Reddit r/feedthebeast posts about IC2 Classic recipes
- Any modpack GitHub repos using IC2 Classic + CraftTweaker (look for .zs files)

**Known Working Syntax (for reference):**
```
<ic2:itemcable:9>      // Glass Fibre Cable - WORKS
<ore:circuitBasic>     // Electronic Circuit - WORKS  
<ore:circuitAdvanced>  // Advanced Circuit - WORKS
```

---

## 🟡 MEDIUM PRIORITY: Environmental Tech 2.0.20.1 Reference

**What I Need:**
1. **Exact item registry names** for Environmental Tech 1.12.2:
   - Void Ore Miner Controllers (all 6 tiers)
   - Void Resource Miner Controllers (all 6 tiers)
   - Solar Array Controllers (all 6 tiers)
   - Lightning Rod
   - Nanobot Beacon
   - All crystal types (Litherite, Erodium, Kyronite, Pladium, Ionite, Aethium)
   - Crystal blocks and items

2. **Config file documentation:**
   - Power consumption settings for each machine tier
   - Ore generation table configuration (what ores spawn at each Void Miner tier)
   - Any feature toggle options

3. **Void Miner ore tables:**
   - Default ore list for each tier
   - How to add/remove ores from generation
   - Whether it respects ore dictionary

**Search Sources:**
- Environmental Tech GitHub (ValkyrieofNight)
- FTB Wiki Environmental Tech page
- CurseForge Environmental Tech mod page and comments
- Modpack configs that use Environmental Tech (E2:E, PO3, etc.)

---

## 🟢 LOW PRIORITY: Draconic Evolution Armor Balance

**Context:**
Draconic Evolution armor (Wyvern, Draconic, Chaotic tiers) is known to trivialize combat. I need recommendations for how other modpacks handle this.

**What I Need:**
1. **Common balance approaches:**
   - Do packs disable DE armor entirely?
   - Do they gate it behind extreme progression?
   - Are there config options to nerf armor stats?

2. **Config options** in Draconic Evolution for:
   - Armor damage reduction values
   - Shield capacity/recharge rates
   - Flight speed limits
   - Any per-piece toggle options

3. **Community consensus:**
   - What do expert-mode packs like E2:E, PO3, GTNH do?
   - Is there a recommended "balanced but not useless" configuration?

**Search Sources:**
- Draconic Evolution GitHub (brandon3055)
- Expert modpack config repositories
- Reddit discussions about DE balance
- FTB Forums balance discussions

---

## Output Format Requested

Please provide findings in this structure:

```markdown
## IC2 Classic Item Registry

### Machines
| Machine | Registry Name | Metadata | CraftTweaker Syntax |
|---------|---------------|----------|---------------------|

### Transformers
| Transformer | Registry Name | CraftTweaker Syntax |
|-------------|---------------|---------------------|

### Storage
| Block | Registry Name | CraftTweaker Syntax |
|-------|---------------|---------------------|

### Verified Working Examples
```zs
// Example recipes that work
```

## Environmental Tech Registry

### Controllers
| Machine | Tier | Registry Name |
|---------|------|---------------|

### Crystals
| Crystal | Item Registry | Block Registry |
|---------|---------------|----------------|

### Config Options
| Setting | File | Default | Description |
|---------|------|---------|-------------|

## Draconic Evolution Armor Recommendations

### Config Options
| Setting | Default | Recommended | Rationale |
|---------|---------|-------------|-----------|

### Pack Comparisons
| Pack | Approach | Notes |
|------|----------|-------|
```

---

## Additional Context

- **Minecraft Version:** 1.12.2
- **Forge Version:** 14.23.5.2855
- **IC2 Classic Version:** Latest for 1.12.2 (Speiger's version)
- **Environmental Tech Version:** 2.0.20.1
- **Draconic Evolution Version:** Latest for 1.12.2
- **CraftTweaker Version:** Latest for 1.12.2

The goal is to create accurate CraftTweaker scripts for recipe gating in a tech-progression modpack. Accuracy of registry names is critical - incorrect names cause script errors and recipes fail silently.
