# Quest Book System Evaluation

## Summary

| Aspect | Recommendation |
|--------|----------------|
| **Quest Mod** | Better Questing (with Standard Expansion) |
| **Quest Book Item** | Better Questing - Quest Book addon |
| **1.12.2 Compatible** | ✅ Yes |
| **Era/Chapter System** | ✅ Supported via Quest Lines |
| **Recommendation** | **ADD** - Essential for pack accessibility |

---

## Quest Mod Options for 1.12.2

### Option 1: Better Questing ⭐ RECOMMENDED

**Downloads:** 45.5M+ (base mod)

**Components Needed:**
1. **Better Questing** (base) - Core quest engine
2. **Better Questing - Standard Expansion** - Task types & themes
3. **Better Questing - Quest Book** - Physical item to open quests

**Features:**
- In-game quest editor (no external tools needed)
- Modular expansion system
- Quest lines with branching paths
- Multiple task types:
  - Item Retrieval (collect items)
  - Fluid Retrieval (collect fluids)
  - Location (visit coordinates)
  - Mob Kills (kill specific mobs)
  - Item Crafting (craft specific items)
  - Block Break (mine blocks)
  - Advancement triggers
- Reward types:
  - Items
  - Choice rewards (pick one)
  - Commands (grant effects, etc.)
  - Loot bags (tiered random rewards)
- Themes: Light, Dark, Stronghold, Overworld, Nether, End, Vanilla
- HQM quest importer (migrate from other systems)
- JSON-based storage (can edit externally)
- Party/team support

**Why Better Questing for EnergyCraft:**
- Used by Engineer's Life (our reference pack)
- Mature, stable for 1.12.2
- Flexible chapter/era system via quest lines
- Good in-game editor for iteration
- Large community = lots of examples

---

### Option 2: Hardcore Questing Mode (HQM)

**Downloads:** High (legacy standard)

**Pros:**
- OG quest mod, well-known
- Lives system (optional hardcore mode)
- Loot bag rewards

**Cons:**
- Less flexible than Better Questing
- Editor more clunky
- Development slowed for 1.12.2

**Verdict:** Skip - Better Questing is the spiritual successor

---

### Option 3: FTB Quests

**Note:** FTB Quests for 1.12.2 exists but was newer/less mature at the time. For 1.16+ it became the standard, but for 1.12.2 Better Questing has more pack support.

**Verdict:** Not recommended for 1.12.2

---

## Implementation: Era-Based Quest Structure

### Proposed Era System for EnergyCraft

Based on Engineer's Life's progression model, adapted for our tech stack:

| Era | Name | Core Mods | Milestone |
|-----|------|-----------|-----------|
| I | **Stone Age** | Vanilla | First furnace, basic tools |
| II | **Bronze Age** | IC2 Classic (basic) | Bronze tools, first machines |
| III | **Industrial Age** | IC2 Classic (full) | Electric machines, MV power |
| IV | **Automation Age** | BuildCraft | Pipes, engines, quarries |
| V | **Transmutation Age** | ProjectE | Philosopher's Stone, EMC |
| VI | **Redstone Age** | Project Red | Logic, wiring, automation |
| VII | **Digital Age** | CC:Tweaked | Computers, programming |
| VIII | **Dragon Age** | Draconic Evolution | Energy Cores, Fusion Crafting |
| IX | **Chaos Age** | Draconic Evolution | Chaos Guardian, Reactor |

### Quest Line Organization

Better Questing organizes quests into **Quest Lines** (chapters):

```
Quest Lines (Tabs in UI):
├── 📖 Welcome & Getting Started
├── ⛏️ Era I: Stone Age
├── 🔩 Era II: Bronze Age  
├── ⚡ Era III: Industrial Age
├── 🔧 Era IV: Automation Age
├── 💎 Era V: Transmutation Age
├── 🔴 Era VI: Redstone Age
├── 💻 Era VII: Digital Age
├── 🐉 Era VIII: Dragon Age
├── 🌀 Era IX: Chaos Age
└── 🏆 Challenges (Optional)
```

### Quest Prerequisites

Better Questing supports:
- **Linear chains** (Quest A → Quest B → Quest C)
- **Branching paths** (Quest A → Quest B OR Quest C)
- **Convergence** (Quest B AND Quest C → Quest D)
- **Optional branches** (side content)

Example for IC2 progression:
```
Craft Generator → Craft Macerator → Craft Electric Furnace
                ↘                 ↗
                  Craft Extractor
```

---

## Required Mods

### Core (Must Install)

| Mod | Version | Purpose |
|-----|---------|---------|
| Better Questing | 3.5.329+ | Quest engine |
| Better Questing - Standard Expansion | 3.5.276+ | Tasks & rewards |

### Recommended Addons

| Mod | Purpose |
|-----|---------|
| Better Questing - Quest Book | Physical book item to open GUI |
| Loot Bags | Random reward system integration |

### CurseForge Links
- [Better Questing](https://www.curseforge.com/minecraft/mc-mods/better-questing)
- [Standard Expansion](https://www.curseforge.com/minecraft/mc-mods/better-questing-standard-expansion)
- [Quest Book](https://www.curseforge.com/minecraft/mc-mods/better-questing-quest-book)

---

## File Structure

Better Questing stores quest data in:

```
config/betterquesting/
├── QuestDatabase.json      # All quests, tasks, rewards
├── QuestProgress.json      # Player/team progress (per-world)
├── QuestingParties.json    # Party data
└── DefaultQuests.json      # Starting quests for new worlds
```

### Quest Data Location
- **Development:** Edit in-game, exports to `config/betterquesting/`
- **Distribution:** Include `DefaultQuests.json` in modpack
- **Git:** Track `config/betterquesting/` folder

---

## Quest Creation Workflow

### In-Game Editor

1. **Enable Edit Mode:** `/bq_admin edit` (requires OP/cheats)
2. **Open Quest Book:** Right-click quest book item
3. **Create Quest Line:** Click "+" in left panel
4. **Add Quests:** Right-click in quest line view
5. **Configure Quest:**
   - Name & description
   - Icon (any item)
   - Tasks (what player must do)
   - Rewards (what player gets)
   - Prerequisites (required quests)
6. **Save:** `/bq_admin default save`

### Task Types (from Standard Expansion)

| Task Type | Use Case |
|-----------|----------|
| Item Retrieval | "Collect 64 Iron Ingots" |
| Item Crafting | "Craft an Electric Furnace" |
| Fluid Retrieval | "Collect 1000mB of Lava" |
| Location | "Visit the Nether" |
| Mob Kills | "Kill 10 Zombies" |
| Block Break | "Mine 16 Diamond Ore" |
| Advancement | "Get the 'Diamonds!' advancement" |

### Reward Types

| Reward Type | Use Case |
|-------------|----------|
| Item | Give specific items |
| Choice | Player picks from options |
| Command | Run command (give XP, effects) |
| Loot Bag | Random tiered rewards |

---

## Starter Quest Book Item

With the Quest Book addon, players spawn with (or can craft) a quest book item:

### Default Recipe (configurable)
```
[ ][Book][ ]
[Paper][Lapis][Paper]
[ ][Paper][ ]
```

### Config Options (`config/questbook.cfg`)
```cfg
# Give quest book on first spawn
B:spawnWithBook=true

# Show completion notifications
B:showNotifications=true
```

---

## Example Quest: First IC2 Machine

```json
{
  "questID": 10,
  "name": "Power Generation",
  "description": "Craft your first Generator. This machine burns fuel to produce EU (Energy Units), the lifeblood of IC2 machinery.",
  "icon": "ic2:generator",
  "tasks": [
    {
      "type": "crafting",
      "item": "ic2:generator",
      "count": 1
    }
  ],
  "rewards": [
    {
      "type": "item",
      "items": [
        {"id": "ic2:cable", "count": 16, "meta": 0}
      ]
    }
  ],
  "prerequisites": [9],
  "questLine": "era_industrial"
}
```

---

## Integration with Existing Systems

### CraftTweaker Synergy
- Gate items with recipes → Quest teaches how to use them
- Quest rewards can include gated items early

### ProjectE EMC
- Quest rewards can include EMC items
- Quests can teach EMC mechanics

### CC:Tweaked
- "Digital Age" quests teach Lua programming
- Example programs as quest rewards (floppy disks)

---

## Effort Estimate

| Task | Time |
|------|------|
| Install mods & configure | 30 min |
| Create Era I quests (tutorial) | 2-3 hours |
| Create Era II-IV quests | 4-6 hours |
| Create Era V-VII quests | 3-4 hours |
| Create Era VIII-IX quests | 2-3 hours |
| Polish & balance | 2-3 hours |
| **Total** | **~15-20 hours** |

---

## Recommendations

### Immediate Actions
1. **Install** Better Questing + Standard Expansion + Quest Book
2. **Test** in-game editor with sample quests
3. **Design** Era I (tutorial) quest line first
4. **Iterate** based on playtesting

### Quest Writing Guidelines
1. **Teach, don't just track** - Explain WHY in descriptions
2. **Reasonable rewards** - Match effort to reward
3. **Visual progression** - Use icons that show tech tier
4. **Optional branches** - Let players explore interests
5. **No strict gating** - Quests guide, don't restrict

### Example Quest Flow (Era III: Industrial)
```
Welcome to IC2
     ↓
Craft Generator ──────────────────┐
     ↓                            ↓
Craft Macerator             Craft BatBox
     ↓                            ↓
Double Your Ores ←────────── Store Energy
     ↓
Craft Electric Furnace
     ↓
Full Processing Line (Milestone)
```

---

## Sources

- [Better Questing CurseForge](https://www.curseforge.com/minecraft/mc-mods/better-questing)
- [Standard Expansion CurseForge](https://www.curseforge.com/minecraft/mc-mods/better-questing-standard-expansion)
- [Quest Book Addon CurseForge](https://www.curseforge.com/minecraft/mc-mods/better-questing-quest-book)
- [Engineer's Life Modpack](https://www.curseforge.com/minecraft/modpacks/engineers-life) - Reference implementation

---

## Handoff Notes for Integrator

When ready to implement:

1. Download from CurseForge:
   - Better Questing (latest 1.12.2)
   - Better Questing - Standard Expansion (latest 1.12.2)
   - Better Questing - Quest Book (latest 1.12.2)

2. Generate configs by launching game

3. Configure `config/questbook.cfg`:
   - `spawnWithBook=true`

4. Quest creation is done in-game with `/bq_admin edit`

5. Export quests with `/bq_admin default save`

6. Commit `config/betterquesting/` to git
