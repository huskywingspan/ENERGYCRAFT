# Draconic Evolution - Evaluation Report

**Curator Research Document**  
**Date:** Phase 1 Research  
**Version Researched:** 1.12.2 (2.3.x branch)  
**CurseForge:** https://www.curseforge.com/minecraft/mc-mods/draconic-evolution

---

## Executive Summary

| Criteria | Assessment |
|----------|------------|
| **Recommendation** | ⚠️ **ADD WITH HEAVY CONFIGURATION** |
| **EnergyCraft Fit** | HIGH - Provides end-game power sinks and goals |
| **Balance Risk** | HIGH - Armor trivializes content without configuration |
| **Complexity** | MEDIUM - Clear progression within the mod |
| **Community Sentiment** | POLARIZED - Loved for goals, hated for OP armor |

**TL;DR:** Draconic Evolution solves EnergyCraft's core problem (no end-game goals) but introduces NEW problems (trivializing combat). With proper configuration, it's exactly what we need. Without it, it breaks the pack.

---

## What Draconic Evolution Provides

### Core Features

#### 1. **Energy Core (Multi-block Energy Storage)**
The signature feature - massive RF storage in visually impressive multi-blocks.

| Tier | Storage Capacity | Size | Materials Required |
|------|------------------|------|-------------------|
| 1 | 45.5 Million RF | 3x3x3 | Draconium, Redstone |
| 2 | 273 Million RF | 5x5x5 | More Draconium |
| 3 | 1.64 Billion RF | 7x7x7 | Significant resources |
| 4 | 9.88 Billion RF | 9x9x9 | Heavy investment |
| 5 | 59.3 Billion RF | 11x11x11 | Industrial scale |
| 6 | 356 Billion RF | 13x13x13 | Massive project |
| 7 | 2.14 Trillion RF | 15x15x15 | **MEGASTRUCTURE** |
| 8 | ~9.22 Quintillion RF | Huge | Theoretical max |

**EnergyCraft Relevance:** ⭐⭐⭐⭐⭐  
This IS our end-game power sink. Building a Tier 7 Energy Core is a meaningful goal that requires massive infrastructure.

#### 2. **Draconic Reactor (Chaos-based Power)**
- Extremely dangerous fusion reactor using Chaos Shards
- Generates massive RF/t when tuned correctly
- **CAN EXPLODE** - Creates massive crater if mismanaged
- Requires active management or automation

**EnergyCraft Relevance:** ⭐⭐⭐⭐  
Perfect "dangerous end-game" content. Players must EARN the right to build one.

#### 3. **Fusion Crafting System**
Multi-block crafting using RF injection:
- Fusion Crafting Core + Pedestals
- Requires massive RF to craft high-tier items
- Scales with item tier

**Power Requirements (approximate):**
- Basic items: 256,000 RF
- Wyvern tier: 8,000,000+ RF
- Draconic tier: 32,000,000+ RF
- Awakened tier: 128,000,000+ RF

**EnergyCraft Relevance:** ⭐⭐⭐⭐⭐  
This is our "Forge of Creation" - justifies building massive power infrastructure.

#### 4. **Armor & Tools** ⚠️
This is the PROBLEM feature:

| Tier | Capability |
|------|------------|
| Wyvern | Flight, high protection, tool modes |
| Draconic | Near-invincibility, instant mining |
| Awakened (Chaotic) | Literal god mode |

**Community Feedback on Armor:**
> "Why we disable Draconic Evolution armors..." - Common sentiment
> "The armor trivializes most other combat" - MuteTiefling
> "It overshadows a lot of other mods" - Community consensus

**EnergyCraft Relevance:** ⚠️ NEEDS CONFIGURATION  
Either disable entirely OR make it the FINAL reward after massive investment.

#### 5. **Chaos Guardian Boss Fight**
- Found at Chaos Islands in The End
- Extremely difficult without DE armor
- Drops Chaos Shards (required for reactor/awakened items)
- Designed to be fought WITH Draconic armor

**EnergyCraft Relevance:** ⭐⭐⭐⭐  
Perfect end-game boss - gives players a GOAL to work toward.

#### 6. **Other Features**
- **Dislocators:** Teleportation items (useful utility)
- **Mob Grinder:** Multi-block mob farm (very powerful)
- **Weather/Time Control:** Convenience features
- **Wireless Energy:** Crystal-based power transfer

---

## Community Balance Research

### How Other Packs Handle DE

#### Approach 1: "Make It Impossible to Obtain" (Heavy Gating)
> "By making it next to impossible to obtain" - Reddit

**Implementation:**
- Extended Crafting tables for Cores
- Require end-game items from MULTIPLE mods
- Make Dragon Hearts/Nether Stars unfarmable

#### Approach 2: "Disable Problem Features" (Surgical Removal)
> "Disable the armor and the boss" - MuteTiefling

**Implementation:**
- Keep Energy Core and Fusion Crafting
- Disable armor entirely
- Alternative armor mods (Modular Powersuits, Ender IO)

#### Approach 3: "Let It Be End-Game" (Accept the Power)
> "DE is balanced because it takes effort" - SpecificFail
> "DE does not include an easy way to generate power to fuel its machines"

**Philosophy:**
- DE is SUPPOSED to be overpowered
- The grind IS the balance
- Other mods enable "cheesing" to DE

#### E2:E Approach (Enigmatica 2: Expert)
> "In E2E you can use UU matter to dupe dragon hearts, so a massive portion of grind is taken away" - Skipper_Al531

**Key insight:** E2E doesn't nerf DE's POWER, it gates ACCESS while reducing tedious grind.

### Common Complaints

1. **Dragon Heart Grinding** - "Tedious, not challenging"
2. **Armor Makes Combat Trivial** - "Overshadows other mods"
3. **Reactor Underwhelming** - "Mekanism fusion beats it easily"
4. **Progress Feels Like Chore** - "So damn grindy"

### What Players LIKE

1. **Visual Appeal** - Energy Core looks amazing
2. **Clear Goals** - Obvious progression within the mod
3. **Power Fantasy** - Satisfying end-game reward
4. **Chaos Guardian** - Memorable boss fight

---

## Configuration Options

### Key Config Settings (draconicevolution.cfg)

Based on source code analysis and community documentation:

```cfg
# ITEMS
B:disableArmorMiningSpeed=false    # Recommend: true (if keeping armor)
B:disableFlightPenalty=false       # Keep false (armor should drain power)

# CHAOS GUARDIAN
I:chaosGuardianHealth=2000         # Can increase for difficulty
D:guardianCrystalShieldMultiplier=1.0  # Increase for harder fight

# ENERGY CORE
# (Most balance is through recipes, not config)

# MOB GRINDER
B:enableMobGrinder=true            # Consider: false (too easy automation)

# DISLOCATORS
B:disableDislocators=false         # Keep enabled (useful, not OP)
```

### CraftTweaker Hooks

DE has ZenScript support for:
- Fusion Crafting recipes
- Energy Core tier recipes
- EMC value modifications

**Opportunity:** Make Fusion Crafting require IC2/BuildCraft components!

---

## EnergyCraft Integration Plan

### Recommendation: Add with "Surgical Configuration"

**ENABLE:**
- ✅ Energy Core (ALL tiers) - Our primary power sink
- ✅ Fusion Crafting - Our "Forge of Creation"
- ✅ Draconic Reactor - Dangerous end-game power
- ✅ Chaos Guardian - End-game boss goal
- ✅ Dislocators - Quality of life
- ✅ Basic tools (Wyvern tier) - Reasonable end-game

**DISABLE OR HEAVILY GATE:**
- ⚠️ Draconic Armor - Either disable OR require ALL progression
- ⚠️ Awakened (Chaotic) tier - Save for "post-credits" content
- ⚠️ Mob Grinder - Too easy; use Woot or manual farms
- ❌ Weather/Time control - Breaks immersion

### Recipe Modifications (for Integrator)

#### Energy Core Should Require:
- **Tier 1-3:** IC2 Basic/Advanced circuits, BuildCraft engines
- **Tier 4-5:** HV components, diamond pipes, advanced machines
- **Tier 6-7:** End-game from MULTIPLE mods

#### Fusion Crafting Should Require:
- IC2 Mass Fabricator output
- BuildCraft lasers/assembly table
- Project Red components
- ProjectE Dark/Red Matter ingredients

#### Chaos Shards Should Be:
- Non-farmable (disable Woot chaos guardian support if exists)
- Required for awakened tier ONLY
- Limited to encourage exploration

### EMC Values (for Integrator)

| Item | Recommended EMC | Rationale |
|------|-----------------|-----------|
| Draconium Ore | 8,192 | Rare, valuable |
| Draconium Ingot | 4,096 | Processed ore |
| Awakened Draconium | 32,768 | Rare, difficult |
| Wyvern Core | 65,536 | Mid-tier goal |
| Draconic Core | 262,144 | High-tier |
| Dragon Heart | 1,000,000 | Rare boss drop |
| Chaos Shard | **NO EMC** | Must be earned |

---

## Compatibility Notes

### Known Interactions

| Mod | Interaction | Notes |
|-----|-------------|-------|
| **ProjectE** | Can assign EMC values | Configure carefully |
| **Mekanism** | Fusion reactor overlap | DE reactor less efficient |
| **IC2 Classic** | Energy conversion | Use Energy Converters |
| **Woot** | Can farm Chaos Guardian | **DISABLE THIS** |
| **Ender IO** | Capacitor banks | Inferior to Energy Core |
| **Applied Energistics 2** | Energy conversion | Works well |

### Dependencies
- **Required:** Brandon Core (same author)
- **Optional but Recommended:** Redstone Flux API

---

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Armor breaks progression | HIGH | HIGH | Disable or extreme gating |
| Too grindy without changes | MEDIUM | MEDIUM | E2E-style UU matter loop |
| Chaos Guardian too hard | MEDIUM | LOW | Provide alternative paths |
| Power creep from reactor | LOW | MEDIUM | Other mods already worse |

---

## Final Recommendation

### ✅ ADD TO ENERGYCRAFT with these conditions:

1. **Disable Draconic/Awakened Armor** initially
   - Consider adding back as "true final" reward later

2. **Require IC2/BuildCraft in recipes**
   - Energy Core tiers need our progression
   - Fusion Crafting needs cross-mod integration

3. **Make Chaos Shards precious**
   - Non-farmable
   - Required for reactor and highest tiers

4. **Position Energy Core as THE end-game goal**
   - Tier 7 Energy Core = "You beat the pack"
   - Requires sustained industrial output

5. **Test reactor vs. other power gen**
   - May need buff if Mekanism exists
   - Should be "worth the danger"

---

## Next Steps for Integrator

1. Add Draconic Evolution + Brandon Core to mods folder
2. Create `config/draconicevolution.cfg` with recommended settings
3. Write CraftTweaker scripts for:
   - Fusion Crafting recipe modifications
   - Energy Core recipe modifications
   - EMC value assignments
4. Test Chaos Guardian accessibility
5. Document intended progression path

---

## Sources

- CurseForge mod page
- GitHub: Draconic-Inc/Draconic-Evolution
- Reddit r/feedthebeast threads:
  - "How do you balance draconic?"
  - "Anyone else hate draconic evolution?"
  - "Am I misunderstanding, or does the draconic evolution reactor suck?"
- Community discussions on balance approaches

---

*Report prepared by: Curator Agent*  
*Handoff to: Integrator Agent*  
*Status: Ready for implementation planning*
