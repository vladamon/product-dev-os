---
id: 16-measure
phase: learning
tier-lite: false
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-retro.md (evidence section)
skill: product:reflect
---

# Recipe: Measure

## When to use

Use this after shipping a feature, to gather evidence before deciding what to do next. Lean Startup's Build → Measure → Learn loop only works if you actually measure.

**Lite tier:** Skip this recipe. For lite projects, use observation and user conversations instead of instrumentation.

## What to measure

For every feature, measure at minimum:

| Metric | What it tells you |
|--------|------------------|
| Activation | Did users discover and try the feature? |
| Completion rate | Did users who started the journey finish it? |
| Drop-off step | Where in the journey do users stop? |
| Time to complete | Is the journey fast enough to not be frustrating? |
| Error frequency | How often do users hit validation errors or failures? |
| Return usage | Do users use the feature more than once? |

For pipeline products specifically:

| Event | Why it matters |
|-------|---------------|
| wizard_started | Feature discovery |
| connection_selected | First meaningful step completion |
| validation_failed | Pain point identification |
| validation_passed | Journey progress |
| config_reviewed | Pre-deploy engagement |
| pipeline_deployed | Journey completion |
| pipeline_creation_abandoned | Drop-off detection |
| time_to_first_successful_deployment | Core success metric |

## What "actionable metrics" means

An actionable metric can change a decision. A vanity metric cannot.

- Vanity: "10,000 users viewed the pipeline creation page"
- Actionable: "62% of users who started pipeline creation abandoned at the connection selection step"

The second one tells you exactly what to fix.

## Evidence gathering checklist

- [ ] Activation rate measured (what % of active users tried the feature)
- [ ] Completion rate measured (what % who started, finished)
- [ ] Drop-off step identified if completion < 80%
- [ ] At least 3 user conversations or support tickets reviewed
- [ ] Key metric compared to pre-ship baseline (if baseline exists)

## Output structure

Evidence section in `docs/specs/YYYY-MM-DD-[feature]-retro.md`:

```markdown
## Evidence

### Quantitative
- Activation: [X]% of active users used the feature
- Completion: [X]% who started finished the journey
- Drop-off: [Step] had [X]% drop-off
- Error rate: [X]% of sessions hit a validation error

### Qualitative
- [Finding from user conversation or support ticket]
- [Finding 2]

### Baseline comparison
[How does this compare to before the feature shipped?]
```
