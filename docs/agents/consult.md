# consult

Prepares one owner to meet one asker who is stuck on a career or life
question. It listens to the asker's account with `listening`, sees the
situation from the asker's side and anyone else's in it with `perspective`,
states the change the asker wants with `purpose`, picks the skill that fits
the problem, and applies it.
The result is a prep note, written by `readable` and organized by
`find-the-argument`, with these parts: a safety line first when the account
shows risk, the core argument, what the asker said and what is inferred, the
skill picked, questions to ask, and the points that need the owner's own
stance. It never picks a path for the asker. The agent itself is
[`agents/consult.md`](../../agents/consult.md).

## Limits

**It hears only the account it is given.** The agent cannot ask the asker
anything. A thin or one-sided account gives a thin note, and every question
it would ask goes to the owner instead.

**The real problem is an inference.** The note labels it so. The owner finds
out in the conversation whether it is right.

**It picks skills by its own reading of the account.** A misread problem type,
or a type the account does not show, leads to the wrong skill or a missing
one. The owner finds out in the conversation.

**It does not replace the owner.** The owner's experience and view are what
the asker came for, so the note marks those points and leaves them open.

**It cannot judge risk or give crisis help.** It only flags signs in the
account, and stops at any sign that is not clearly about work, with a gentle
question for the owner to ask. The owner supplies local crisis help and a
qualified professional.
