# user-stories

Skill for turning an idea into user stories (use cases) with acceptance
checks, deciding what to ask and what to assume, and splitting the work into
slices that each pass or fail on their own (`/user-stories`). The use case
form, its courses, and where each rule lives come from `/clean-arch-domain`.

## Files

- `SKILL.md`: principles and definitions, including ways to split.
- `sources.md`: where each principle and definition comes from.

Eval sets are kept outside this folder, so a closed-book test-taker given the
skill cannot read them.

## Credit

Adapted from these works. This is an independent restatement, not affiliated
with or endorsed by their authors.

- Ivar Jacobson, Ian Spence, Kurt Bittner, *Use-Case 2.0: The Guide to
  Succeeding with Use Cases* (Ivar Jacobson International, 2011; 2023 e-book
  edition), https://www.ivarjacobson.com/publications/white-papers/use-case-20-e-book
- Mike Cohn, *User Stories Applied: For Agile Software Development*
  (Addison-Wesley, 2004), ISBN 978-0321205681
- Bill Wake, "INVEST in Good Stories, and SMART Tasks" (2003),
  https://xp123.com/invest-in-good-stories-and-smart-tasks/
- Ron Jeffries, "Essential XP: Card, Conversation, Confirmation" (2001),
  https://ronjeffries.com/xprog/articles/expcardconversationconfirmation/
- Richard Lawrence and Peter Green, "The Humanizing Work Guide to Splitting
  User Stories",
  https://www.humanizingwork.com/the-humanizing-work-guide-to-splitting-user-stories/
- Mike Cohn, "SPIDR: Five Simple but Powerful Ways to Split User Stories",
  https://www.mountaingoatsoftware.com/blog/five-simple-but-powerful-ways-to-split-user-stories
- Mike Cohn, "User Stories" guide,
  https://www.mountaingoatsoftware.com/agile/user-stories
- Gojko Adzic, *Specification by Example* (Manning, 2011), ISBN
  978-1617290084; chapter "Key process patterns" (Manning article excerpt)
- Dan North, "Introducing BDD" (2006),
  https://dannorth.net/blog/introducing-bdd/

The ask-or-assume rule ("ask only what changes the result") is the owner's
own rule; this skill also weighs what a wrong guess would cost. The sources
above support its parts, as listed in `sources.md`.
