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

### Role Interaction Model (Updated for Dev-First Approach)

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
   [CONTINUE TO NEXT PHASE]      [ITERATE UNTIL STABLE]
   (Dev Cycle, Defer Testing)     (Logic & Crashes Only)
   
                After all phases complete:
                
              ┌─────────────────┐
              │    BALANCER     │
              │ (Full Playtest) │
              └─────────────────┘
                      │
                      │ Balance & Content Feedback
                      │
                      ▼
              ┌─────────────────┐
              │  RELEASE BUILD  │
              └─────────────────┘
```

**Updated Cycle (Development Focus):**
1. Curator researches mod features/balance philosophies
2. Integrator implements scripts + configs (iterate on logic/crashes only)
3. Move to next phase immediately (don't gate on playtesting)
4. After ALL development complete → Comprehensive full playthrough (Phase 4)
5. Balance adjustments based on playtest findings → Release (Phase 5)

---

## Phase 1: Foundation & Research
**Duration:** 2 weeks (COMPLETE ✅)  
**Lead:** Curator  
**Completed:** February 2, 2026

### Goals
- [x] Finalize core mod list
- [x] Complete compatibility research
- [x] Document all config options for balance
- [x] Establish baseline "feel" of progression

### Curator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Audit current 44 mods for conflicts | High | ✅ MOD_COMPATIBILITY_MATRIX.md |
| Research Draconic Evolution configs | High | ✅ research/draconic_evolution_integration.md |
| Research Environmental Tech features | High | ✅ research/environmental_tech_evaluation.md |
| Evaluate RFTools for 1.12.2 | Medium | ⏭️ SKIP v1.0 |
| Document IC2 Classic config options | Medium | ✅ research/ic2_classic_balance_research.md |
| Document ProjectE config options | High | ⏸️ Deferred to Phase 3 |
| Find power-sink mods for 1.12.2 | High | ✅ DE + ET selected |
| Check Mekanism compatibility | Medium | ⏭️ SKIP v1.0 |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Verify Energy Converters recipes work | High | ✅ scripts/energyconverters_recipes.zs |
| Set up scripts folder structure | Medium | ✅ /scripts organized |
| Create mod loading order if needed | Low | ✅ None needed |
| Test CC:Tweaked installation | High | ✅ Verified |

### Balancer Tasks (Deferred to Phase 4 - Comprehensive Playtest)
| Task | Priority | Status |
|------|----------|--------|
| Document current progression (baseline) | High | ⏸️ Deferred - will test all phases together |
| Identify current pain points | High | ⏸️ Deferred - will test all phases together |
| Create progression goals document | Medium | ⏸️ Deferred - will test all phases together |

### Milestone: Phase 1 Complete ✅ ACHIEVED
- [x] Mod list finalized - 21 mods confirmed
- [x] All mod configs documented - MOD_COMPATIBILITY_MATRIX.md
- [x] Research complete on IC2 Classic, DE, ET
- [x] Compatibility issues identified and documented

---

## Phase 2: Power Sink Integration
**Duration:** 3 weeks (IN PROGRESS - 70% COMPLETE)  
**Lead:** Integrator  
**Started:** February 2, 2026  
**Status:** Scripts written, awaiting full playtest validation in Phase 4

### Goals
- [x] Add end-game power sinks (DE + ET integrated)
- [x] Configure new mods for balance (DE cfg, ET recipe gating)
- [x] Create cross-mod recipes (draconic_evolution.zs, environmental_tech.zs)
- [x] Establish "megaproject" goals (Void Miner Tiers 1-6, Draconic Reactor)

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
| Deep-dive Draconic Evolution wiki | High | ✅ Complete - research report |
| Document all DE config options | High | ✅ Complete - MOD_COMPATIBILITY_MATRIX |
| Research DE balance in other packs | Medium | ⏸️ Deferred - baseline works |
| Environmental Tech feature matrix | High | ✅ Complete - research report |
| RFTools Dimensions feasibility | Medium | ⏭️ SKIP v1.0 |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Install & test Draconic Evolution | High | ✅ Complete - scripts written |
| Configure DE: disable OP features | High | ✅ Complete - Mob Grinder disabled |
| Install & test Environmental Tech | High | ✅ Complete - scripts written |
| Configure ET power requirements | High | ✅ Complete - tier-based gating |
| Create recipes linking new mods to core | Medium | ✅ Complete - draconic_evolution.zs, environmental_tech.zs |
| Handle any recipe conflicts | Medium | ✅ Complete - IC2 Classic workarounds |

### Balancer Tasks (Deferred to Phase 4 - Comprehensive Playtest)
| Task | Priority | Status |
|------|----------|--------|
| Test DE progression | High | ⏸️ Deferred to Phase 4 comprehensive playtest |
| Verify Energy Core is achievable goal | High | ⏸️ Deferred to Phase 4 comprehensive playtest |
| Test ET void miners at scale | Medium | ⏸️ Deferred to Phase 4 comprehensive playtest |
| Document new progression path | Medium | ⏸️ Deferred to Phase 4 comprehensive playtest |

### Milestone: Phase 2 Implementation Complete ✅
- [x] Power sink mods scripts written and gating designed
- [x] Clear end-game goals exist (Draconic Reactor, Void Miner T6)
- [x] Solar arrays gated to prevent trivial power
- [x] Cross-mod recipes scripted
- ⏳ **Validation deferred to Phase 4:** Full playtest of balance/progression

### Phase 2 Deliverables Created
- ✅ `scripts/draconic_evolution.zs` (173 lines, 10 recipes gated)
- ✅ `scripts/environmental_tech.zs` (260 lines, 18 controllers + crystals gated)
- ✅ `config/brandon3055/DraconicEvolution.cfg` (balance tweaks)
- ✅ `config/ProjectE/custom_emc.json` (partial - DE + ET values)

---

## Phase 3: ProjectE Integration
**Duration:** 2 weeks (COMPLETE ✅)  
**Lead:** Integrator  
**Completed:** February 2, 2026

### Goals
- [x] Rebalance EMC values
- [x] Create tech-gated transmutation
- [x] Make ProjectE complement, not bypass, tech
- [x] Establish "earned" path to Red Matter

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
| Document all default EMC values | High | ✅ Complete |
| Research other packs' EMC balance | Medium | ✅ Complete |
| Identify EMC exploits to close | High | ✅ Complete - handoff doc |
| Find ProjectE config options | High | ✅ Complete |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Create EMC rebalance script | High | ✅ scripts/projecte_integration.zs |
| Add tech-gated transmutation recipes | High | ✅ DM/RM/Klein/Watch gated |
| Configure ProjectE settings | Medium | ✅ custom_emc.json updated |
| Disable/modify EMC generators | Medium | ✅ MK2/3 gated behind circuits |
| Exploit validation | High | ⏸️ Deferred to Phase 4 playtest |

### Balancer Tasks (Deferred to Phase 4 - Comprehensive Playtest)
| Task | Priority | Status |
|------|----------|--------|
| Playtest early-game EMC earning | High | ⏸️ Deferred to Phase 4 |
| Playtest path to Dark Matter | High | ⏸️ Deferred to Phase 4 |
| Verify tech gate feels fair | High | ⏸️ Deferred to Phase 4 |
| Test Red Matter acquisition | High | ⏸️ Deferred to Phase 4 |

### Milestone: Phase 3 Implementation Complete ✅
- [x] EMC values rebalanced (IC2, Forestry, mob drops, tech rewards)
- [x] Tech gates implemented (DM→AdvCircuit, RM→DraconicCore, Klein→WyvernCore)
- [x] EMC generators configured (Collectors/Relays MK2/3 gated)
- [x] Red Matter acquisition gates designed (requires Draconic Evolution progress)
- ⏳ **Exploit validation deferred to Phase 4 playtest**

**Completion Date:** Phase 3 Complete - Ready for Phase 4

---

## Phase 4: Integration & Comprehensive Playtest
**Duration:** 2-3 weeks (READY TO START)  
**Lead:** Balancer + Integrator  
**Status:** All Phase 1-3 development complete. Ready when user has playtest time.

### Purpose
After all development is complete (Phases 1-3), conduct comprehensive full playthrough from start to end-game, validating balance, progression, and identifying any crashes or logic errors.

### Goals
- [ ] Complete playthrough validates all progression gates
- [ ] No crashes during normal play
- [ ] Balance feedback captured
- [ ] All systems integrated properly
- [ ] Known issues documented before release

### Curator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Compile playtest feedback | Medium | 🔲 STARTING in Phase 4 |
| Write mod descriptions for pack page | Medium | 🔲 DURING Phase 4 |
| Document all added recipes | Medium | 🔲 DURING Phase 4 |
| Create FAQ from playtest findings | Medium | 🔲 AFTER playtest |

### Integrator Tasks
| Task | Priority | Status |
|------|----------|--------|
| Conduct full playthrough | High | 🔲 STARTING in Phase 4 |
| Fix any crashes/logic errors found | High | 🔲 DURING playtest |
| Final balance tweaks from feedback | High | 🔲 AFTER playtest |
| Comment all CraftTweaker scripts | Medium | 🔲 AFTER fixes |
| Organize & document config folder | Medium | 🔲 AFTER fixes |
| Create server config pack | Medium | 🔲 BEFORE release |

### Balancer Tasks
| Task | Priority | Status |
|------|----------|--------|
| Complete 0-to-endgame playtest | High | 🔲 MAIN TASK of Phase 4 |
| Document balance findings | High | 🔲 DURING playtest |
| Write progression guide | High | 🔲 AFTER playtest |
| Document recommended goals | Medium | 🔲 AFTER playtest |
| Create playtest report | Medium | 🔲 AFTER playtest |
| Recruit beta testers | Medium | 🔲 DURING Phase 5 |

### Milestone: Phase 4 Complete
- [ ] Full playthrough 0→endgame completed
- [ ] All crashes/logic errors fixed
- [ ] Balance feedback documented
- [ ] Player progression guide written
- [ ] Release candidate ready

---

## Phase 5: Beta Testing & Release
**Duration:** 1-2 weeks (NOT STARTED)  
**Lead:** All roles  
**Status:** Begins after Phase 4 playtest complete

### Goals
- [ ] Community beta testing (small group)
- [ ] Final feedback incorporation
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
| Draconic Evolution too OP | High | Medium | Config already applied (Mob Grinder disabled), validate in Phase 4 playtest |
| Mod incompatibility crashes | High | Low | Scripts already validated for syntax, full test in Phase 4 |
| EMC exploits not found | Medium | High | Dedicated exploit testing during Phase 4 playtest |
| Scope creep (adding mods) | Medium | LOW | ✅ Mod list frozen after Phase 1 |
| Performance issues | Medium | Low | Monitor during Phase 4 playtest |
| ProjectE balance feels wrong | Medium | Medium | Validate in Phase 4 playtest, iterate if needed |
| Quest system incomplete | High | HIGH | Currently 10/250 quests done - ongoing parallel work |

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

### Current Status: Phase 4 Ready
All development work (Phases 1-3) is complete. Project is ready for comprehensive playtest.

### What's Been Completed
- **Phase 1:** Foundation & Research ✅
- **Phase 2:** Power Sink Integration ✅ (DE + Environmental Tech scripts)
- **Phase 3:** ProjectE Integration ✅ (EMC values, tech gates, exploit prevention)

### When You Have Play Time (Phase 4)
1. **Balancer:** Full playthrough 0→endgame in fresh world
2. **Integrator:** Fix any crashes/errors found during playtest
3. **Curator:** Document findings, write player guides

### Parallel Track (Ongoing)
- Quest book creation: 10/250 quests complete (Era I done)
- Can continue quest development independent of playtest

### Decision Points Already Made ✅
- [x] Mod list frozen at 21 mods (Phase 1 closure)
- [x] RFTools Dimensions deferred (complexity)
- [x] Mekanism skipped (too powerful)
- [x] Development-first approach: complete all phases, then comprehensive playtest
- [x] Full playthrough before release (v1.0 gate)
- [x] ProjectE tech gates: DM→AdvCircuit, RM→DraconicCore, Klein→WyvernCore

---

## Future Ideas

Ideas captured during development are tracked in [`docs/FUTURE_IDEAS.md`](docs/FUTURE_IDEAS.md).

Key topics include:
- Project Red Transportation (RedPower tubes successor)
- Quest book implementation plan
- Mod candidates for future versions
- Balance and gating philosophy

---

*Plan Version: 1.2 — Updated after Phase 3 completion*
