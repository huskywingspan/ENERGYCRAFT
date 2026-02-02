# EnergyCraft v1.0 - Project Plan

> **Scope:** Configuration changes + existing mod integration only  
> **Target:** Playable, balanced modpack that solves the "what now?" problem  
> **Timeline:** 8-12 weeks to release candidate

---

## Team Structure

### 🔬 The Curator (Researcher)
**Focus:** Discovery, documentation, and compatibility research

**Responsibilities:**
- Research mods for features, performance, and compatibility
- Document mod interactions and known issues
- Find existing solutions before building custom ones
- Maintain mod compatibility matrix
- Scout community feedback and similar packs
- Investigate config options for balance levers

**Deliverables:**
- Mod evaluation reports
- Compatibility matrices
- Config documentation
- Community research summaries

**Tools:**
- CurseForge/Modrinth research
- GitHub issue trackers
- Reddit/Discord community monitoring
- Wiki/documentation reading

---

### 🔧 The Integrator (Builder)
**Focus:** Technical implementation and configuration

**Responsibilities:**
- Write CraftTweaker/ModTweaker scripts
- Configure mod settings for balance
- Handle recipe conflicts and ore dictionary
- Set up EMC values and ProjectE integration
- Create cross-mod recipes
- Manage mod file organization
- Debug crashes and compatibility issues

**Deliverables:**
- CraftTweaker scripts
- Config files
- EMC mappings
- Recipe documentation
- Bug fixes

**Tools:**
- CraftTweaker/ZenScript
- Config editors
- Log analyzers
- JEI (in-game testing)

---

### 🎮 The Balancer (Playtester/Designer)
**Focus:** Progression design and quality assurance

**Responsibilities:**
- Playtest progression from start to end-game
- Identify balance issues and progression gaps
- Validate that goals feel achievable and rewarding
- Test edge cases and exploits
- Document the intended player experience
- Write player-facing documentation/guides
- Provide feedback on "feel" and fun factor

**Deliverables:**
- Playtest reports
- Balance recommendations
- Progression flowcharts
- Player guides
- Bug reports

**Tools:**
- Fresh world testing
- Speedrun testing (exploit finding)
- Multiple playstyles testing
- Community beta feedback

---

### Role Interaction Model

```
┌─────────────┐     Research      ┌─────────────┐
│   CURATOR   │ ───────────────▶  │  INTEGRATOR │
│ (Research)  │                   │  (Build)    │
└─────────────┘                   └─────────────┘
       │                                 │
       │                                 │
       │ Mod Reports          Scripts &  │
       │ & Configs               Configs │
       │                                 │
       ▼                                 ▼
              ┌─────────────────┐
              │    BALANCER     │
              │  (Test & Play)  │
              └─────────────────┘
                      │
                      │ Feedback & Issues
                      │
                      ▼
              ┌─────────────────┐
              │  RELEASE BUILD  │
              └─────────────────┘
```

**Cycle:**
1. Curator researches → Integrator implements
2. Balancer tests → Reports issues
3. Curator investigates alternatives OR Integrator fixes
4. Repeat until stable

---

## Phase 1: Foundation & Research
**Duration:** 2 weeks  
**Lead:** Curator

### Goals
- [ ] Finalize core mod list
- [ ] Complete compatibility research
- [ ] Document all config options for balance
- [ ] Establish baseline "feel" of progression

### Curator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Audit current 44 mods for conflicts | High | 🔲 |
| Research Draconic Evolution configs | High | 🔲 |
| Research Environmental Tech features | High | 🔲 |
| Evaluate RFTools for 1.12.2 | Medium | 🔲 |
| Document IC2 Classic config options | Medium | 🔲 |
| Document ProjectE config options | High | 🔲 |
| Find power-sink mods for 1.12.2 | High | 🔲 |
| Check Mekanism compatibility | Medium | 🔲 |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Verify Energy Converters recipes work | High | 🔲 |
| Set up scripts folder structure | Medium | 🔲 |
| Create mod loading order if needed | Low | 🔲 |
| Test CC:Tweaked installation | High | 🔲 |

### Balancer Tasks
| Task | Priority | Status |
|------|----------|--------|
| Document current progression (baseline) | High | 🔲 |
| Identify current pain points | High | 🔲 |
| Create progression goals document | Medium | 🔲 |

### Milestone: Phase 1 Complete
- [ ] Mod list finalized (no more additions after this)
- [ ] All mod configs documented
- [ ] Baseline playtest complete
- [ ] No critical crashes

---

## Phase 2: Power Sink Integration
**Duration:** 3 weeks  
**Lead:** Integrator

### Goals
- [ ] Add end-game power sinks
- [ ] Configure new mods for balance
- [ ] Create cross-mod recipes
- [ ] Establish "megaproject" goals

### Candidate Mods to Add

#### Tier 1: Definitely Add
| Mod | Purpose | Config Focus |
|-----|---------|--------------|
| **Draconic Evolution** | End-game goals, energy storage | Disable OP items, tune Energy Core costs |
| **Environmental Tech** | Void miners, solar arrays | Tune power requirements, resource costs |

#### Tier 2: Evaluate
| Mod | Purpose | Concern |
|-----|---------|---------|
| **RFTools Dimensions** | Dimension creation | Complexity, performance |
| **Extra Utilities 2** | Grid Power, generators | May be too easy |
| **Actually Additions** | Misc utilities | Scope creep |

#### Tier 3: Probably Skip for v1
| Mod | Reason |
|-----|--------|
| Mekanism | Too powerful, overshadows IC2 |
| Thermal Expansion | Too easy, not "Tekkit feel" |
| Applied Energistics | Solves logistics too completely |

### Curator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Deep-dive Draconic Evolution wiki | High | 🔲 |
| Document all DE config options | High | 🔲 |
| Research DE balance in other packs | Medium | 🔲 |
| Environmental Tech feature matrix | High | 🔲 |
| RFTools Dimensions feasibility | Medium | 🔲 |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Install & test Draconic Evolution | High | 🔲 |
| Configure DE: disable OP features | High | 🔲 |
| Install & test Environmental Tech | High | 🔲 |
| Configure ET power requirements | High | 🔲 |
| Create recipes linking new mods to core | Medium | 🔲 |
| Handle any recipe conflicts | Medium | 🔲 |

### Balancer Tasks
| Task | Priority | Status |
|------|----------|--------|
| Test DE progression | High | 🔲 |
| Verify Energy Core is achievable goal | High | 🔲 |
| Test ET void miners at scale | Medium | 🔲 |
| Document new progression path | Medium | 🔲 |

### Milestone: Phase 2 Complete
- [ ] Power sink mods installed and configured
- [ ] Clear end-game goals exist
- [ ] No power generation trivializes end-game
- [ ] Cross-mod recipes working

---

## Phase 3: ProjectE Integration
**Duration:** 2 weeks  
**Lead:** Integrator

### Goals
- [ ] Rebalance EMC values
- [ ] Create tech-gated transmutation
- [ ] Make ProjectE complement, not bypass, tech
- [ ] Establish "earned" path to Red Matter

### EMC Rebalancing Strategy

#### Philosophy
```
Building things > Growing things > Mining things
Tech crafting > Basic crafting > Raw materials
```

#### EMC Value Adjustments (via CraftTweaker)
| Category | Adjustment | Rationale |
|----------|------------|-----------|
| Raw ores | -50% | Discourage pure mining |
| Basic machines | +100% | Reward building |
| Advanced circuits | +200% | Reward tech investment |
| Multi-block structures | +500% | Reward megabuilds |

### Tech-Gated Transmutation

#### Concept: Transmutation Tiers
```zenscript
// Example: Dark Matter requires tech components
recipes.remove(<projecte:item.pe_matter>);
recipes.addShaped("dark_matter_tech", <projecte:item.pe_matter>,
    [[<projecte:item.pe_fuel:2>, <ic2:itempartcircuitadv>, <projecte:item.pe_fuel:2>],
     [<ic2:itempartcircuitadv>, <projecte:item.pe_covalence_dust:2>, <ic2:itempartcircuitadv>],
     [<projecte:item.pe_fuel:2>, <ic2:itempartcircuitadv>, <projecte:item.pe_fuel:2>]]);
```

#### Proposed Gates
| Item | Requirement | Rationale |
|------|-------------|-----------|
| Dark Matter | 4x Advanced Circuit | Mid-game tech gate |
| Red Matter | Draconic Core + Dark Matter | End-game gate |
| Klein Star Omega | Fusion Reactor proximity? | Ultimate gate |

### Curator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Document all default EMC values | High | 🔲 |
| Research other packs' EMC balance | Medium | 🔲 |
| Identify EMC exploits to close | High | 🔲 |
| Find ProjectE config options | High | 🔲 |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Create EMC rebalance script | High | 🔲 |
| Add tech-gated transmutation recipes | High | 🔲 |
| Configure ProjectE settings | Medium | 🔲 |
| Disable/modify EMC generators | Medium | 🔲 |
| Test for EMC duplication exploits | High | 🔲 |

### Balancer Tasks
| Task | Priority | Status |
|------|----------|--------|
| Playtest early-game EMC earning | High | 🔲 |
| Playtest path to Dark Matter | High | 🔲 |
| Verify tech gate feels fair | High | 🔲 |
| Test Red Matter acquisition | High | 🔲 |

### Milestone: Phase 3 Complete
- [ ] EMC values rebalanced
- [ ] Tech gates implemented
- [ ] No trivial EMC exploits
- [ ] Red Matter requires tech infrastructure

---

## Phase 4: Polish & Documentation
**Duration:** 2 weeks  
**Lead:** Balancer

### Goals
- [ ] Full playthrough without issues
- [ ] Player documentation complete
- [ ] Config files organized and commented
- [ ] Known issues documented

### Curator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Write mod descriptions for pack page | Medium | 🔲 |
| Document all added recipes | Medium | 🔲 |
| Create FAQ from testing | Medium | 🔲 |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Comment all CraftTweaker scripts | Medium | 🔲 |
| Organize config folder | Medium | 🔲 |
| Create server config pack | Medium | 🔲 |
| Final crash/bug fixes | High | 🔲 |
| Optimize load times if needed | Low | 🔲 |

### Balancer Tasks
| Task | Priority | Status |
|------|----------|--------|
| Complete 0-to-endgame playtest | High | 🔲 |
| Write progression guide | High | 🔲 |
| Document recommended goals | Medium | 🔲 |
| Record any showcase/trailer? | Low | 🔲 |
| Recruit beta testers | Medium | 🔲 |

### Milestone: Phase 4 Complete
- [ ] Full playthrough documented
- [ ] Player guide written
- [ ] No critical bugs
- [ ] Beta testing initiated

---

## Phase 5: Beta & Release
**Duration:** 2-3 weeks  
**Lead:** All roles

### Goals
- [ ] Community beta testing
- [ ] Final balance adjustments
- [ ] CurseForge/Modrinth listing
- [ ] v1.0 Release

### Tasks
| Task | Owner | Priority | Status |
|------|-------|----------|--------|
| Recruit 5-10 beta testers | Balancer | High | 🔲 |
| Create feedback collection system | Curator | Medium | 🔲 |
| Triage and fix reported issues | Integrator | High | 🔲 |
| Final balance pass | All | High | 🔲 |
| Write CurseForge description | Curator | High | 🔲 |
| Create pack icon/branding | TBD | Medium | 🔲 |
| Upload to CurseForge | Integrator | High | 🔲 |
| Announce release | All | Medium | 🔲 |

### Milestone: v1.0 Released
- [ ] Pack live on CurseForge
- [ ] No critical bugs
- [ ] Positive beta tester feedback
- [ ] Clear progression from start to end-game
- [ ] EnergyCraft vision achieved

---

## Risk Register

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| Draconic Evolution too OP | High | Medium | Heavy config work, may cut features |
| Mod incompatibility crashes | High | Medium | Thorough testing each phase |
| EMC exploits not found | Medium | High | Dedicated exploit testing session |
| Scope creep (adding mods) | Medium | High | Hard freeze after Phase 1 |
| Performance issues | Medium | Low | Monitor during testing |
| ProjectE feels too nerfed | Medium | Medium | Balance testing feedback loops |

---

## Definition of Done: v1.0

### Functional Requirements
- [x] Core Tekkit mods working (IC2 Classic, BuildCraft, Project Red)
- [ ] ComputerCraft working
- [ ] Power conversion working (EU/RF/MJ)
- [ ] End-game power sinks exist
- [ ] ProjectE integrated with tech
- [ ] Clear progression to end-game

### Quality Requirements
- [ ] No crashes during normal play
- [ ] < 5 minute load time
- [ ] All recipes discoverable in JEI
- [ ] Server-compatible

### Documentation Requirements
- [ ] Progression guide written
- [ ] Known issues documented
- [ ] Config changes documented
- [ ] CurseForge page complete

---

## Communication Plan

### Weekly Sync
- Review completed tasks
- Surface blockers
- Plan next week
- Demo new features

### Documentation
- All decisions logged in `docs/decisions/`
- All research in `docs/research/`
- Scripts commented inline

### Issue Tracking
- Use GitHub Issues or simple markdown tracking
- Label by: Phase, Role, Priority
- Close issues only when verified

---

## Appendix: File Structure

```
EnergyCraft/
├── mods/                      # All mod JARs
├── config/                    # Mod configurations
├── scripts/                   # CraftTweaker scripts
│   ├── _loader.zs            # Load order
│   ├── emc_rebalance.zs      # EMC adjustments
│   ├── tech_gates.zs         # Tech-gated recipes
│   ├── cross_mod.zs          # Cross-mod integration
│   └── fixes.zs              # Bug fixes, conflicts
├── docs/
│   ├── DESIGN_DOCUMENT.md    # Overall design
│   ├── VISION_ENERGYCRAFT.md # Core vision
│   ├── CHANGELOG.md          # Version history
│   ├── PROGRESSION_GUIDE.md  # Player-facing guide
│   ├── research/             # Curator research docs
│   └── decisions/            # Decision records
├── resourcepacks/            # Custom textures if any
└── README.md                 # Pack overview
```

---

## Next Actions

### Immediate (This Week)
1. **Curator:** Research Draconic Evolution configs
2. **Integrator:** Verify Energy Converters + circuits fix works
3. **Balancer:** Document current progression pain points

### Blocking Questions
1. Confirm mod list freeze after Phase 1?
2. Which role will each team member take?
3. Weekly sync time?

---

## Future Ideas

Ideas captured during development are tracked in [`docs/FUTURE_IDEAS.md`](docs/FUTURE_IDEAS.md).

Key topics include:
- Project Red Transportation (RedPower tubes successor)
- Quest book implementation plan
- Mod candidates for future versions
- Balance and gating philosophy

---

*Plan Version: 1.1 — February 2, 2026*
