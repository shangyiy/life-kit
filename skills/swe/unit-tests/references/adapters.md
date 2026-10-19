# Adapter notes for unit tests

Language- and framework-specific forms of rules whose general home is elsewhere. These are outer detail: follow the project's own conventions when they differ.

- **Injection seams** (`unit-tests` § Testability seams): in class-based languages, pass collaborators through a constructor or a setter. Class-level (static) members, sealed (final) classes and methods, and singletons reached through a global accessor block substitution; avoid them where a test needs a double, or hide them behind an injectable interface.
- **Visibility** (§ Hidden logic): changing access modifiers at run time through introspection to reach private members makes tests brittle; test through the visible interface instead.
- **Interface changes** (§ Test-driven change): in statically compiled languages, an interface change with no new behavior can be driven by the compiler: change the interface, follow the errors until it builds, and rerun the suite.
- **Failure reports** (`test-oracle` § Diagnostic and simple): in xUnit-style frameworks whose equality check takes the expected value first and the actual second, reversing them never changes the verdict but swaps the labels in the failure message. A plain true-or-false assertion over a comparison loses the actual value unless the framework rewrites it; prefer an equality or matcher-based check. Fluent matcher checks read like the spec and give better failure output.
- **Mutation operators** (`mutation-testing`): a mutant must still compile in compiled languages; operators that produce code that cannot build are discarded, not counted.
- **Test doubles:** one mocking library can usually play every double role; its terms for them may differ from the kinds named in `unit-tests`.
