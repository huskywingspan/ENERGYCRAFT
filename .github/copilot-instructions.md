# EnergyCraft Modpack - Copilot Instructions

## Project Overview

**EnergyCraft** is a Minecraft 1.12.2 modpack inspired by classic Tekkit, focused on tech progression and energy management. This is NOT a kitchen-sink pack—every mod serves a purpose in the progression.

## Key Context

- **Minecraft Version:** 1.12.2
- **Forge Version:** 14.23.5.2855
- **Pack Philosophy:** Classic tech feel, balanced progression, energy as the core challenge

## Core Mod Stack

| Mod | Role | Energy Type |
|-----|------|-------------|
| IC2 Classic | Primary tech mod | EU |
| BuildCraft | Logistics & automation | MJ |
| Project Red | Redstone & wiring | - |
| ProjectE | Transmutation (gated) | EMC |
| Forestry | Bees & farming | - |
| Energy Converters | Cross-mod power | EU↔MJ↔RF |

**IMPORTANT:** We use **IC2 Classic**, NOT IC2 Experimental. Item IDs and recipes differ significantly.

## Documentation Structure

| File | Purpose |
|------|---------|
| `VISION_ENERGYCRAFT.md` | Core goals, pillars, what we're building |
| `DESIGN_DOCUMENT.md` | Technical decisions, energy ratios, progression |
| `PROJECT_PLAN.md` | Development phases, task tracking |
| `CHANGELOG.md` | Version history, what's been done |
| `research/*.md` | Curator research on mods |

## Agent Roles

This project uses specialized agents:

- **Curator** (`.github/agents/curator.md`) - Research, documentation, compatibility analysis
- **Integrator** (`.github/agents/integrator.md`) - Implementation, config changes, scripting
- **Balancer** (future) - Playtesting, balance validation

## File Locations

```
Tekkit Remastered/
├── config/           # Mod configuration files
├── scripts/          # CraftTweaker .zs files
├── mods/             # Mod JARs (not in git)
├── research/         # Curator research documents
└── .github/agents/   # Agent role definitions
```

## CraftTweaker Conventions

Scripts go in `scripts/` with descriptive names:
- `modname_recipes.zs` - Recipe modifications for a specific mod
- `balance_*.zs` - Cross-mod balance tweaks
- `progression_*.zs` - Gating and progression changes

Example pattern:
```zs
// scripts/example_recipes.zs
import crafttweaker.item.IItemStack;

// Remove overpowered recipe
recipes.remove(<mod:item>);

// Add balanced replacement
recipes.addShaped("recipe_name", <mod:item>, [
    [<ingredient>, <ingredient>, <ingredient>],
    [<ingredient>, <ingredient>, <ingredient>],
    [<ingredient>, <ingredient>, <ingredient>]
]);
```

## EMC Value Guidelines

When assigning EMC values in `config/ProjectE/custom_emc.json`:

| Tier | EMC Range | Examples |
|------|-----------|----------|
| Basic materials | 1-256 | Ores, ingots |
| Processed | 256-2048 | Plates, circuits |
| Machines | 2048-32768 | Basic machines |
| Advanced | 32768-262144 | Advanced machines |
| End-game | 262144-1M | Unique items |
| No EMC | null | Exploit-prone items |

## Energy Conversion Ratios

Standardized across the pack:
- **1 EU = 2.5 RF** (IC2 Classic to RF mods)
- **1 MJ = 10 RF** (BuildCraft to RF mods)
- **1 EU = 0.25 MJ** (IC2 to BuildCraft)

## Git Workflow

- Commit after each significant change
- Use descriptive commit messages
- Tag releases: `v0.X.0-descriptor`
- Current tag: `v0.1.0-foundation`

## Common Tasks

### Adding a New Mod
1. Download JAR to `mods/` folder
2. Launch game once to generate config
3. Configure in `config/modname.cfg`
4. Add CraftTweaker scripts if needed
5. Update CHANGELOG.md
6. Commit changes

### Modifying Recipes
1. Create/edit script in `scripts/`
2. Test in-game with `/ct reload`
3. Check `crafttweaker.log` for errors
4. Commit working script

### Research Handoff (Curator → Integrator)
1. Curator writes `research/modname_evaluation.md`
2. Curator provides handoff prompt with specific directives
3. Integrator implements based on research
4. Integrator updates CHANGELOG.md

## Testing Checklist

Before committing integration work:
- [ ] Game launches without errors
- [ ] Target mod loads correctly
- [ ] Recipes work as intended
- [ ] No JEI errors or missing textures
- [ ] Energy systems connect properly
- [ ] CHANGELOG updated
