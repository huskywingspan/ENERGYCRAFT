# EnergyCraft - Vision Document

> *"What do you do with infinite power? Build something that needs it."*

---

## The Problem Statement

### The Tekkit Paradox

Classic tech modpacks suffer from a fundamental design flaw: **progression flatlines after mid-game**.

1. **Phase 1: Scarcity** (Exciting)
   - Scrounging for resources
   - Every machine is a milestone
   - Power feels precious

2. **Phase 2: Sufficiency** (Comfortable)
   - Basic automation running
   - Macerators/furnaces handling ores
   - Small power surplus

3. **Phase 3: Abundance** (????)
   - Chests overflow with processed materials
   - Power generation exceeds all needs
   - **Nothing meaningful to build toward**

You've built the factory. Now what?

### The ProjectE Problem

ProjectE (Equivalent Exchange) exacerbates this:
- **Bypasses the entire resource loop** — Why mine when you can transmute?
- **End-game items are inaccessible** — Red Matter costs billions of EMC
- **Accessible only through cheese** — EMC flowers, duplication exploits
- **Separate game loop** — ProjectE becomes its own game, disconnected from tech

The result: You're never building 10 nuclear reactors to fund Red Matter armor. You're either:
- Grinding ProjectE cheese (boring)
- Ignoring end-game entirely (unsatisfying)

### What Players Actually Want

- **Megaprojects** that require scaling production
- **Goals** that feel earned, not cheesed
- **Reasons** to build bigger, more complex systems
- **Integration** between magic (ProjectE) and tech

---

## The EnergyCraft Solution

### Core Philosophy

> **"Energy is the universal currency. Give players things worth spending it on."**

Instead of nerfing ProjectE or adding artificial restrictions, we **add compelling sinks** that:
1. Require massive sustained power
2. Scale with investment
3. Provide meaningful progression
4. Integrate tech and transmutation

### Design Pillars

#### 1. 🏗️ Megastructure Goals
Give players multi-block structures that require industrial-scale resources and power.

#### 2. ⚡ Power-Hungry End-Game
Create machines/systems that actually NEED those 10 nuclear reactors.

#### 3. 🔄 Integration Over Isolation
Make ProjectE work WITH tech mods, not around them.

#### 4. 📈 Horizontal Progression
More things to build at the same tier, not just vertical power creep.

---

## Proposed Solutions

### Tier 1: Resource Sinks (Configuration)

**Immediate changes we can make with CraftTweaker:**

#### A. Rebalance ProjectE EMC Values
```
Philosophy: Make mid-tier tech items EMC-valuable
```

| Item | Current EMC | Proposed | Rationale |
|------|-------------|----------|-----------|
| IC2 Advanced Circuit | ~400 | 2,048 | Reward tech crafting |
| BuildCraft Engines | Varies | Higher | Encourage building, not buying |
| Glass Fibre Cable | ~200 | 1,024 | Make infrastructure valuable |

**Effect:** Players who BUILD things earn EMC faster than those who just farm.

#### B. Add Expensive Transmutation Recipes
Make ProjectE's most powerful items require BOTH EMC AND crafting:

```
Red Matter = Dark Matter + [10x Advanced Circuit] + [1000 EU processing]
```

This forces players to actually build industrial infrastructure.

### Tier 2: Power Sinks (Existing Mods)

**Mods that add reasons to generate more power:**

#### A. Draconic Evolution (Selective Features)
- **Energy Core** — Multi-block battery requiring MASSIVE resources
- **Fusion Reactor** — End-game power gen that requires end-game power to START
- **Draconic Armor** — Goals worth building toward

⚠️ **Risk:** Draconic can be overpowered. May need config tweaks.

#### B. Advanced Rocketry / Galacticraft
- **Rockets** require enormous fuel production
- **Space stations** need continuous power
- **Off-world mining** as resource sink

#### C. RFTools Dimensions
- **Create custom dimensions** at enormous power cost
- **Maintain dimensions** with sustained power
- **Mining dimensions** as progression gateway

#### D. Environmental Tech
- **Void Miners** — Scale infinitely with power input
- **Solar Arrays** — Multi-block structures requiring huge resource investment
- **Lightning Rods** — Convert weather to power at scale

### Tier 3: Custom Content (Modding/Development)

If no existing mod solves the problem, we build it.

#### Concept A: "The Forge of Creation"

A multi-block structure that:
1. Consumes MASSIVE power (100,000 RF/t sustained)
2. Consumes EMC as fuel
3. Produces unique items unavailable elsewhere
4. Scales output with infrastructure investment

```
Example Recipe in The Forge:
- Input: 10,000,000 EMC + 1,000,000 RF over 10 minutes
- Output: "Stabilized Red Matter Ingot"
- Use: Required for crafting Red Matter items (replaces direct EMC transmutation)
```

**Effect:** To get Red Matter gear, you MUST:
1. Build EMC generation (ProjectE)
2. Build massive power generation (IC2/BC/RF)
3. Build The Forge structure (resource sink)
4. Wait for processing (time investment)

#### Concept B: "Industrial Transmutation Table"

Replaces the basic Transmutation Table for high-tier items:
- Requires constant power connection
- Transmutation speed scales with power input
- Cannot transmute items above a certain EMC without upgrading
- Upgrades require tech-mod components

```
Tier 1: Transmute items up to 1,000 EMC — Basic table
Tier 2: Up to 10,000 EMC — Requires IC2 circuits, 100 RF/t
Tier 3: Up to 100,000 EMC — Requires advanced circuits, 1,000 RF/t
Tier 4: Up to 1,000,000 EMC — Requires elite components, 10,000 RF/t
Tier 5: Unlimited — Requires end-game components, 100,000 RF/t
```

#### Concept C: "The Dimensional Anchor"

A structure that:
1. Keeps chunks loaded (replaces chunk loaders)
2. Requires sustained power (scales with loaded chunks)
3. Higher tiers enable cross-dimensional item/fluid/energy transfer
4. Ultimate tier: Personal pocket dimension (requires EVERYTHING)

### Tier 4: Progression Gating

**Controversial but effective:**

#### Option A: Tech Gates for ProjectE
- Klein Star Omega requires a working fusion reactor nearby
- Transmutation of diamonds requires proving you CAN craft them normally first
- "Research" system: Transmute something only after crafting it once

#### Option B: EMC Multipliers for Tech
- EMC earned from tech-crafted items is worth 2x
- EMC earned from automated systems is worth 1.5x
- EMC earned from raw materials is worth 0.5x

This makes BUILDING tech economically superior to just EMC farming.

---

## Mod Candidates for EnergyCraft

### Power Sinks (Must-Have)
| Mod | Purpose | Concern |
|-----|---------|---------|
| **Draconic Evolution** | End-game goals, energy storage | May be OP, needs config |
| **Environmental Tech** | Scalable power sinks | Good fit, 1.12.2 compatible |
| **RFTools** | Dimension creation | Complex, power-hungry |
| **Mekanism** | 5x ore processing, fusion | May overshadow IC2 |

### Power Sinks (Consider)
| Mod | Purpose | Concern |
|-----|---------|---------|
| **Advanced Rocketry** | Space exploration | Complex, may bloat pack |
| **Immersive Engineering** | Aesthetic, multiblocks | Good fit for building |
| **NuclearCraft** | Realistic reactors | May overlap with IC2 |

### Integration Mods
| Mod | Purpose | Concern |
|-----|---------|---------|
| **CraftTweaker** | Recipe modification | Already installed |
| **ContentTweaker** | Custom items/blocks | May need it |
| **ModTweaker** | Mod-specific recipes | Extends CraftTweaker |

### Mods to AVOID
| Mod | Reason |
|-----|--------|
| **Thermal Expansion** | Too easy, overshadows IC2 |
| **Applied Energistics 2** | Solves logistics "too well" |
| **Ender IO** | Kitchen-sink, scope creep |

---

## EnergyCraft Progression Vision

### Early Game (0-10 hours)
**Theme:** Survival, establishing basics

- Manual mining, basic tools
- First generator (Survival Generator, Stirling Engine)
- Basic ore doubling
- **Goal:** Stable power, doubled ore output

### Mid Game (10-50 hours)
**Theme:** Industrialization

- Automated mining/quarries
- Multi-machine processing lines
- Nuclear power or equivalent
- Basic EMC generation
- **Goal:** Resource abundance, power surplus

### Late Game (50-100 hours)
**Theme:** Megaprojects

- Fusion reactors
- Dimensional exploration
- Advanced EMC infrastructure
- Multi-block power storage
- **Goal:** Complete specific megastructures

### End Game (100+ hours)
**Theme:** Creative mode-adjacent, earned

- Pocket dimensions
- Red Matter gear (earned through industry, not cheese)
- Creative-esque building tools
- **Goal:** Anything you want, but you BUILT the capability

---

## Implementation Roadmap

### Phase 1: Foundation (Current)
- [x] Establish core mod list (IC2 Classic, BuildCraft, Project Red)
- [x] Patch compatibility issues (Energy Converters)
- [x] Document vision (this document)
- [ ] Test stability

### Phase 2: Balance Pass
- [ ] Audit all EMC values
- [ ] Adjust ProjectE configs
- [ ] Add CraftTweaker recipes for integration
- [ ] Decide on pack name

### Phase 3: Content Addition
- [ ] Evaluate Draconic Evolution
- [ ] Evaluate Environmental Tech
- [ ] Evaluate RFTools
- [ ] Test mod interactions

### Phase 4: Custom Development (if needed)
- [ ] Assess if existing mods meet vision
- [ ] Design custom mod spec if gaps exist
- [ ] Prototype The Forge of Creation or equivalent
- [ ] Test with focus group

### Phase 5: Polish & Release
- [ ] Final balance pass
- [ ] Documentation/wiki
- [ ] Quest book (optional)
- [ ] Public release

---

## Open Questions

1. **How much should we nerf ProjectE?**
   - Option A: Heavy nerfs, force tech engagement
   - Option B: Light touch, add compelling alternatives
   - Option C: Separate "modes" (Purist vs. Classic)

2. **Draconic Evolution: Yes or No?**
   - Pro: Perfect end-game goals
   - Con: Known to be overpowered, may dominate

3. **Should we add Mekanism?**
   - Pro: 5x ore processing is a great goal
   - Con: Powerful, may overshadow IC2 Classic feel

4. **Custom mod development: Realistic?**
   - Scope: Simple multi-block + recipes = doable
   - Timeline: 1-3 months for basic implementation
   - Alternative: Commission from a mod developer

5. **Quest book: Necessary?**
   - Pro: Guides players, surfaces goals
   - Con: Development time, maintenance burden
   - Middle ground: In-game documentation without forced quests

---

## Success Criteria

EnergyCraft succeeds if:

1. ✅ Players naturally progress from early to late game
2. ✅ Building nuclear reactors feels WORTH IT
3. ✅ Red Matter gear requires industrial infrastructure
4. ✅ 100+ hours of engaging content
5. ✅ "What do I build next?" always has an answer
6. ✅ Classic Tekkit feel preserved
7. ✅ Stable, polished experience

---

## Conclusion

EnergyCraft isn't about adding more stuff. It's about **giving meaning to power**.

Every watt generated should have somewhere to go.
Every EMC earned should feel like progress.
Every megaproject should feel earned.

The factory isn't the end. It's the beginning.

---

*"Build the machine that builds the machine that builds the dream."*

---

## Appendix: Name Brainstorming

With "EnergyCraft" as the working title, alternatives:

**Energy-Themed:**
- EnergyCraft
- PowerWorks
- Watt's Next
- The Grid
- Megawatt

**Progression-Themed:**
- Industrial Ascension
- Factory Endgame
- The Long Game
- Build Toward

**Nostalgia + Purpose:**
- Tekkit Evolved (trademark issue)
- Classic Industrial: Endgame
- Retro Factory: Complete

**Current Favorite:** EnergyCraft
- Clear purpose
- Memorable
- No trademark issues
- Works as both pack name and philosophy

---

*Document Version: 0.1 — February 2, 2026*
