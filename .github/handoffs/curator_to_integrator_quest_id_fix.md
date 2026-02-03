# Curator → Integrator Handoff: Quest Item ID Corrections

## Priority: HIGH
## Date: Session 6
## Status: PARTIALLY COMPLETE - REQUIRES VERIFICATION AND COMPLETION

---

## Executive Summary

The `DefaultQuests.json` file contains **incorrect IC2 item IDs** that will prevent quest completion. IC2 Classic uses `ic2:te` with metadata values, not the `ic2:blockmacerator` style IDs.

**Curator Progress:** Fixed ~12 critical IDs for Era II core quests
**Remaining:** ~25+ IDs still need correction, mainly in Era III

---

## Work Completed by Curator

### ✅ Fixed IDs (Verified working format)

| Original | Fixed To | Damage | Location |
|----------|----------|--------|----------|
| `ic2:blockgenerator` | `ic2:te` | 3 | Quest 19 (icon + task), Quest 23 (icon + task) |
| `ic2:blockbatbox` | `ic2:te` | 72 | Quest 22 (icon + task), Quest 23 (task) |
| `ic2:blockmacerator` | `ic2:te` | 4 | Quest 24 (icon), Quest 25 (icon), Quest 26 (icon + task), Quest 48 (task), Era III line icon |
| `ic2:blockelectricfurnace` | `ic2:te` | 2 | Quest 28 (icon + task), Quest 48 (task) |
| `ic2:blockmfe` | `ic2:te` | 73 | Quest 48 (task) |
| `ic2:blockextractor` | `ic2:te` | 6 | Quest 48 (task) |

---

## Remaining Work for Integrator

### ❌ Critical: Processing Machines (Quest Blocking)

| Current ID | Correct ID | Damage | Line(s) | Quest |
|------------|------------|--------|---------|-------|
| `ic2:blockextractor` | `ic2:te` | 6 | 2055, 2081 | Quest 29 |
| `ic2:blockcompressor` | `ic2:te` | 5 | 2124, 2150 | Quest 30 |

### ❌ Critical: Generators (Quest Blocking)

| Current ID | Correct ID | Damage | Line(s) | Quest |
|------------|------------|--------|---------|-------|
| `ic2:blocksolargenerator` | `ic2:te` | **VERIFY** | 2193, 2249, 2275, 2499 | Quests 31, 32, 35 |
| `ic2:blockwatermill` | `ic2:te` | 9 | 2318, 2344 | Quest 33 |
| `ic2:blockgeothermal` | `ic2:te` | 8 | 2387, 2413, 2482 | Quests 34, 35 |

### ❌ Critical: Energy Storage (Quest Blocking)

| Current ID | Correct ID | Damage | Line(s) | Quest |
|------------|------------|--------|---------|-------|
| `ic2:blockmfe` | `ic2:te` | 73 | 2542, 2667, 2693 | Quests 36, 38 |
| `ic2:blockcesu` | `ic2:te` | **VERIFY** | 2598, 2624 | Quest 37 |
| `ic2:blockmfsu` | `ic2:te` | 74 | 2736, 2762 | Quest 39 |

### ❌ High: Advanced Machines (Era III Late)

| Current ID | Correct ID | Damage | Quest |
|------------|------------|--------|-------|
| `ic2:blockinductionfurnace` | `ic2:te` | 46 | Quest 43 |
| `ic2:blockrotarymacerator` | `ic2:te` | **VERIFY** | Quest 44 |
| `ic2:blocksingularitycompressor` | `ic2:te` | **VERIFY** | Quest 45 |
| `ic2:blockcentrifugeextractor` | `ic2:te` | **VERIFY** | Quest 46 |

### ❌ High: Nuclear (Era III Late)

| Current ID | Correct ID | Damage | Quest |
|------------|------------|--------|-------|
| `ic2:blockreactor` | `ic2:te` | 22 | Quest 47 |
| `ic2:blockreactorchamber` | `ic2:te` | **VERIFY** | Quest 47 |

### ❌ Medium: Circuits (Rewards mostly)

| Current ID | Correct ID | Damage | Notes |
|------------|------------|--------|-------|
| `ic2:itempartcircuit` | `ic2:itemcrafting` | 1 | Multiple quests as rewards |
| `ic2:itempartcircuitadv` | `ic2:itemcrafting` | 2 | Quest 41+ |

### ⚠️ Likely Correct (Verify anyway)

These blocks/items may already be correct:
- `ic2:blockmetal` - Storage blocks
- `ic2:blocksapling` - Rubber sapling
- `ic2:blockfurnace` - Iron Furnace
- `ic2:itemingot` - Ingots
- `ic2:itemrebattery` - RE-Battery
- `ic2:itemcable` - Cables
- `ic2:itemharz` - Sticky Resin
- `ic2:itemrubber` - Rubber

---

## Quick Fix Commands

For each wrong ID, use Find & Replace in the JSON file:

1. **Extractor (Quest 29):**
   - Find: `"id:8": "ic2:blockextractor"` + nearby `"Damage:2": 0`
   - Replace: `"id:8": "ic2:te"` + `"Damage:2": 6`

2. **Compressor (Quest 30):**
   - Find: `"id:8": "ic2:blockcompressor"` + nearby `"Damage:2": 0`
   - Replace: `"id:8": "ic2:te"` + `"Damage:2": 5`

3. **MFE (remaining):**
   - Find: `"id:8": "ic2:blockmfe"` + nearby `"Damage:2": 0`
   - Replace: `"id:8": "ic2:te"` + `"Damage:2": 73`

4. **MFSU:**
   - Find: `"id:8": "ic2:blockmfsu"` + nearby `"Damage:2": 0`
   - Replace: `"id:8": "ic2:te"` + `"Damage:2": 74`

5. **Geothermal:**
   - Find: `"id:8": "ic2:blockgeothermal"` + nearby `"Damage:2": 0`
   - Replace: `"id:8": "ic2:te"` + `"Damage:2": 8`

6. **Water Mill:**
   - Find: `"id:8": "ic2:blockwatermill"` + nearby `"Damage:2": 0`
   - Replace: `"id:8": "ic2:te"` + `"Damage:2": 9`

---

## Verification Process

### Step 1: Get Actual IDs In-Game

```
1. Launch Minecraft with modpack
2. Open creative menu or JEI
3. Get each machine item
4. Hold in hand, run: /ct hand
5. Check logs/crafttweaker.log
6. Document actual ID and damage value
```

### Step 2: Create Verified ID List

Before making more changes, verify these items IN-GAME:
- Solar Panel
- CESU
- Rotary Macerator
- Singularity Compressor
- Centrifuge Extractor
- Reactor Chamber
- All circuits

### Step 3: Apply Remaining Fixes

After verification:
1. Backup `DefaultQuests.json`
2. Use careful find/replace (change BOTH `id:8` AND `Damage:2`)
3. Test in-game

---

## Testing Checklist

After fixing:
- [ ] Quest 29 (Extractor) icon displays and detection works
- [ ] Quest 30 (Compressor) icon displays and detection works
- [ ] Quest 32 (Solar Panel) icon displays and detection works
- [ ] Quest 33 (Water Mill) icon displays and detection works
- [ ] Quest 34 (Geothermal) icon displays and detection works
- [ ] Quest 37 (CESU) icon displays and detection works
- [ ] Quest 38 (MFE) icon displays and detection works
- [ ] Quest 39 (MFSU) icon displays and detection works
- [ ] Quest 43-46 (Advanced machines) work
- [ ] Quest 47 (Nuclear Preview) works

---

## ID Reference (From Gemini Research)

### Known Good IDs (High Confidence)

| Machine | ID | Damage |
|---------|-----|--------|
| Generator | `ic2:te` | 3 |
| BatBox | `ic2:te` | 72 |
| MFE | `ic2:te` | 73 |
| MFSU | `ic2:te` | 74 |
| Macerator | `ic2:te` | 4 |
| Compressor | `ic2:te` | 5 |
| Extractor | `ic2:te` | 6 |
| Electric Furnace | `ic2:te` | 2 |
| Geothermal Generator | `ic2:te` | 8 |
| Water Mill | `ic2:te` | 9 |
| Induction Furnace | `ic2:te` | 46 |
| Nuclear Reactor | `ic2:te` | 22 |

### Needs Verification

| Machine | Estimated ID | Notes |
|---------|--------------|-------|
| Solar Panel | `ic2:te` + ? | May conflict with geothermal |
| CESU | `ic2:te` + ? | MV storage |
| Rotary Macerator | `ic2:te` + ? | Advanced |
| Singularity Compressor | `ic2:te` + ? | Advanced |
| Centrifuge Extractor | `ic2:te` + ? | Advanced |

---

## Related Files

- `research/IC2_CLASSIC_QUICK_REFERENCE.md` - ID reference
- `docs/quests/ERA_II_IMPLEMENTATION.md` - Quest design
- `docs/quests/ERA_III_IMPLEMENTATION.md` - Quest design

---

*Note: Always backup before editing. The fixed quests (19-28) should work correctly. Test Era II first before proceeding to Era III fixes.*
