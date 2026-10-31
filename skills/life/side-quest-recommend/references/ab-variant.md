# Optional variant: two independent runs per mode

This variant runs the half-day or weekend mode twice, as independent runs A and B, and keeps one result. Use it only when the person or the host asks for it: nothing shows it beats the default single pass, and it costs up to six subagents (starter, half-day and weekend, two each).

## Run it

Give A and B the same packet and the same mode files, and never show A's answer to B. Each run gets one seed so the two are not a duplicate race.

| Run | Seed |
|-----|------|
| A | Follow the query order in web-search.md and prefer the higher ranked class. For starter, prefer a drink or a meal. |
| B | Move markets before events, and prefer a different venue class or a neighboring town when that is honest. For starter, prefer air, tidying or water. |

Brief for each run:

```
You are proposing one option for mode <mode>, run <A|B>. Work independently of any other run.
Seed: <the seed row above>
Ground every claim in data: the time, the place and the win must be real and doable for the packet, else STATUS: SKIP.
Context packet: <the full packet>
Write the win and the reason in packet.language. Search in the place's language.
Follow the mode file <path>. For half-day or weekend, also follow <path to references/web-search.md>
and the Ranking in SKILL.md, then return only your single best option.
Lookup: starter uses no web. Half-day and weekend must search and open pages before any OPTION.
An option that names a place or hours must cite a URL you opened.
Return STATUS: OPTION or SKIP in the mode file's output format.
Never invent venues or hours. If you are unsure after the lookup, SKIP, or tag check-before-go with the URL.
```

If the host has no subagents, run the mode file twice yourself with the two seeds.

## Pick the winner

Apply the grounding tests in SKILL.md to A and B first. If both fail, the mode adds nothing. If both pass, take the higher ranked class, then the tie-break in SKILL.md. If A and B name the same place, keep the write-up with the stronger hours and URL. Show one winner per mode, never both runs.
