# consult

Prepares one owner to meet one asker who is stuck on a career or life
question. It listens to the asker's account with `listening`, sees the
situation from the asker's side with `perspective`, states the change the asker
wants with `purpose`, picks the skill that fits the problem, and applies it.
The result is a prep note, written by `readable` and organized by
`find-the-argument`: the core argument, what the asker said and what is
inferred, the asker's side, questions to ask, and the points that need the
owner's own stance. It never picks a path for the asker. The agent itself is
[`agents/consult.md`](../../agents/consult.md).

## Limits

**It hears only the account it is given.** The agent cannot ask the asker
anything. A thin or one-sided account gives a thin note, and every question
it would ask goes to the owner instead.

**The real problem is an inference.** The note labels it so. The owner finds
out in the conversation whether it is right.

**It picks one problem type.** A question that mixes several types gets the
skill for the one the agent judges most central, and the note may miss the
others.

**It does not replace the owner.** The owner's experience and view are what
the asker came for, so the note marks those points and leaves them open.

**It is not for crises.** If the account suggests the asker may get hurt, the
note says so first and points to qualified help.
