# core

This folder is inspired by Clean Architecture. It holds the domain: principles and definitions that stay true whatever the tool, language or output format.

Skills in this kit have at most two layers:

- **Domain** lives here. A core skill states what good work is in its field, and nothing about how one kind of work is done.
- **Use case** lives elsewhere. A use case skill is one kind of work that serves a core idea, and cites the core instead of restating it.

Tool and framework detail is not written in the skills; it is worked out at run time from the project's environment.

## Rules

- Dependencies point inward only. A use case cites the domain; the domain never cites a use case.
- Each rule has one home. Other skills point to it instead of restating it.
- Every skill supports both doing the work and reviewing existing work.
