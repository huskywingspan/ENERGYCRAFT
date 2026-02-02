# Future Ideas & Brainstorming

> **Purpose:** Capture ideas that came up during development but aren't in immediate scope. These may be implemented in future versions or explored during playtesting.

---

## Item Transport & Logistics

### Project Red Transportation (RedPower Tubes Successor?)

**Context:** In classic Tekkit (1.2.5), RedPower 2's pneumatic tubes were the gold standard for item transport:
- No engines required for extraction
- Easy to route through tight spaces
- Sophisticated sorting with filter systems
- Could build entire sorting facilities

**Research Findings:**

| Module | Status in 1.12.2 | Notes |
|--------|------------------|-------|
| Project Red Transportation | **EXISTS in 1.12.2** | The `mechanical` jar appears to include it |
| Routed Pipes | Config present | `ProjectRed.cfg` has "Routed Pipes" settings |

**Project Red Transportation Features (from wiki):**
- **Item Transport Pipe** - Basic pneumatic tube equivalent
- **Routed Junction/Interface/Request/Crafting/Firewall Pipes** - Smart routing
- **Chips** - Configure pipe behavior:
  - Item Responder/Overflow/Terminator
  - Item Extractor/Broadcaster
  - Item Stock Keeper/Crafting chips

**Comparison with Current Options:**

| Feature | BuildCraft Pipes | Project Red Transport | Logistics Pipes |
|---------|------------------|----------------------|-----------------|
| Requires power for extraction | Yes (engines) | No | No (RF optional) |
| Smart routing | No | Yes (chips) | Yes (modules) |
| Auto-crafting | No | Yes (crafting pipes) | Yes |
| Request system | No | Yes | Yes |
| Learning curve | Low | Medium | High |
| Tekkit-era feel | Classic | Very authentic | More complex |

**Recommendation:** 
- Project Red Transportation IS installed via `mechanical` jar - verify in-game
- Could serve as "Advanced Logistics Era" upgrade from BuildCraft
- Natural progression: BC Pipes → PR Transport → Logistics Pipes
- Research needed: Does Additional Pipes make BC competitive enough?

**Action Items:**
- [ ] Verify PR Transportation items exist in JEI
- [ ] Test routed pipes vs Additional Pipes
- [ ] Design progression tier if adding formally

---

## Quest Book System

### Better Questing (Recommended)

**Decision:** Use Better Questing + Standard Expansion + Quest Book for guided progression

**Era Structure (Proposed):**
1. **Era I: Stone Age** (Tutorial, 10 quests)
2. **Era II: Bronze Age** (Basic smelting, 15 quests)  
3. **Era III: Industrial Age** (IC2 basics, 25 quests)
4. **Era IV: Automation Age** (BuildCraft, 30 quests)
5. **Era V: Transmutation Age** (ProjectE, 20 quests)
6. **Era VI: Redstone Age** (Project Red, 25 quests)
7. **Era VII: Digital Age** (CC:Tweaked, 25 quests)
8. **Era VIII: Dragon Age** (Draconic Evo, 20 quests)
9. **Era IX: Chaos Age** (End-game, 15 quests)

**Time Estimate:** 15-20 hours for full quest book content

**Action Items:**
- [ ] Install Better Questing mods
- [ ] Create Era I tutorial quests first
- [ ] Playtest for pacing

---

## End-Game Content Ideas

### Power Sinks
- **Draconic Evolution Reactor** (researched, planned)
- **Environmental Tech Void Miners** - Need evaluation
- **RFTools Dimensions** - Complex, may be out of scope

### Boss Progression
1. Wither (vanilla, gates Nether Star)
2. Ender Dragon (vanilla, gates End content)
3. **Chaos Guardian** (DE, gates Awakened tier)

### Achievement Milestones
- First 10M RF/t generation
- First Energy Core tier 8
- Chaos Guardian defeated
- "Complete" EMC collection

---

## Balance & Gating Ideas

### Energy System Progression
```
EU (IC2 Classic) ──► MJ (BuildCraft) ──► RF (Advanced mods)
     │                    │                    │
Early Game           Mid Game            Late Game
```

### EMC Gating Tiers
- **No EMC:** Exploit-prone items (Chaos Shards, Awakened items)
- **High EMC:** Boss drops, unique items
- **Normal EMC:** Standard progression materials

### Recipe Gating Philosophy
- Gate by **machine tier**, not arbitrary materials
- Each mod's items require previous mod's infrastructure
- No "skip to end-game" crafting paths

---

## Mod Candidates for Future Evaluation

### High Priority
| Mod | Purpose | Concern |
|-----|---------|---------|
| Environmental Tech | Void miners, power sinks | May overlap with DE |
| Applied Energistics 2 | Digital storage | Complexity creep |
| Ender IO | Conduits, machines | Feature overlap |

### Medium Priority
| Mod | Purpose | Concern |
|-----|---------|---------|
| Thermal Expansion | RF machines | Redundant with IC2? |
| Mekanism | Gas systems, 5x ore | Very powerful |
| Tinkers' Construct | Custom tools | Changes combat meta |

### Low Priority / Probably Skip
| Mod | Purpose | Reason to Skip |
|-----|---------|----------------|
| IndustrialCraft 2 Exp | Alternative IC2 | Using IC2 Classic |
| RFTools | Dimensions, builders | Too complex for scope |
| Extra Utilities | Random tools | Kitchen-sink feel |

---

## Quality of Life Ideas

### In-Game Documentation
- JEI integration complete ✓
- Quest book for progression (planned)
- Custom advancement page?

### Performance
- Mod count target: <60 mods
- Load time target: <5 minutes
- Server-compatible from day 1

### UX Polish
- Consistent ore dictionary usage
- No duplicate ores (configs)
- Clear JEI recipe chains

---

## Content Ideas for Future Versions

### v1.1 Candidates
- Better Questing full implementation
- Environmental Tech integration
- Refined balance based on playtesting

### v1.2 Candidates
- Applied Energistics 2 (Digital Era)
- Advanced Rocketry? (Space exploration)
- Thaumcraft? (Magic alternative progression)

### v2.0 Dream Features
- Custom textures/resource pack
- Original quest lore/story
- Community speedrun categories

---

## Questions to Answer During Playtesting

1. Is the early game too grindy without EMC?
2. Does power conversion feel balanced?
3. Is Draconic Evolution too powerful even when gated?
4. How long to reach end-game legitimately?
5. Are there any remaining exploits?
6. Does the pack feel like classic Tekkit?

---

## Technical Debt / Cleanup

- [ ] Audit all configs for consistency
- [ ] Verify all CraftTweaker scripts load cleanly
- [ ] Document all custom EMC values
- [ ] Create recipe conflict resolution document
- [ ] Set up automated testing (if possible)

---

*Last Updated: February 2, 2026*
*Ideas captured from development sessions and brainstorming*
