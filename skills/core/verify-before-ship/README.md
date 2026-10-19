# verify-before-ship

Principles for shipping any change: code, documents, or instructions
(`/verify-before-ship`). Done means the owner can accept the work after one
read. `SKILL.md` holds the principles, most important first, then the terms.
It is the single home of the verification rules (independent closed-book
verifier, evidence on the exact version, held-out checks and no tuning to the
checker). This repo's shipping rules cite it; other skills should cite it rather
than restate these rules. Eval sets are kept outside this folder, so a
closed-book test-taker given the skill cannot read them.

## Credit

Each principle restates published practice. Sources:

1. **Done for the owner; core idea first; reads easily**: Barbara Minto,
   *The Minto Pyramid Principle*
   ([concept](https://www.barbaraminto.com/)); US Army Regulation 25-50,
   *Preparing and Managing Correspondence* (2013), para 1-36 (single rapid
   reading; bottom line up front); William Strunk Jr., *The Elements of Style*
   (1918), Rules 9 and 13
   ([text](https://www.gutenberg.org/files/37134/37134-h/37134-h.htm)).
2. **Separate verifier, sees only what it needs**: IEEE Std 1012, *System,
   Software, and Hardware Verification and Validation*, Annex C (technical and
   managerial independence) ([standard](https://standards.ieee.org/ieee/1012/7324/));
   NIST SP 800-53 Rev. 5, AC-5 Separation of Duties
   ([control](https://csf.tools/reference/nist-sp-800-53/r5/ac/ac-5/));
   Saltzer and Schroeder, *The Protection of Information in Computer Systems*
   (1975), least privilege and need-to-know
   ([paper](https://www.cs.virginia.edu/~evans/cs551/saltzer/)).
3. **Evidence and approval on the exact version**: ISTQB Glossary, regression testing
   ([entry](https://istqb-glossary.page/regression-testing/)); Defense
   Acquisition University, Physical Configuration Audit
   ([entry](https://www.waru.edu/acquipedia-article/physical-configuration-audit-pca));
   NIST SP 800-53 Rev. 5, CM-3(2)
   ([control](https://csf.tools/reference/nist-sp-800-53/r5/cm/cm-3/)); US 21
   CFR 820.30(i) and 820.40(b), changes re-verified and re-approved before they
   take effect ([eCFR, 2025-12-04](https://www.ecfr.gov/on/2025-12-04/title-21/chapter-I/subchapter-H/part-820)).
4. **No tuning to the checker; held-out check**: Charles Goodhart, *Monetary
   Theory and Practice* (Goodhart's law); Marilyn Strathern, "'Improving
   ratings': audit in the British University system", *European Review* 5(3),
   1997 ([record](https://ideas.repec.org/a/cup/eurrev/v5y1997i03p305-321_00.html));
   Hastie, Tibshirani and Friedman, *The Elements of Statistical Learning*,
   sec. 7.2 (test set kept "in a vault"); Duda and Hart, *Pattern
   Classification and Scene Analysis* (1973) ("training on the testing data");
   Daniel Koretz and Robert L. Linn, ETS seminar papers (2009), a second,
   lower-stakes audit measure to compare against the targeted one
   ([Koretz](https://www.ets.org/Media/Research/pdf/KoretzPresenterSession3.pdf),
   [Linn](https://www.ets.org/Media/Research/pdf/LinnReactorSession3.pdf)).
5. **Smallest full change**: Martin Fowler,
   [*Yagni*](https://martinfowler.com/bliki/Yagni.html) (2015); Saltzer and
   Schroeder (1975), economy of mechanism; Strunk (1918), Rule 13.
6. **Owner's explicit OK**: NIST SP 800-53 Rev. 5, CM-3 Configuration Change
   Control and CM-3(1)
   ([control](https://csf.tools/reference/nist-sp-800-53/r5/cm/cm-3/)).

This skill is an independent restatement. It is not affiliated with or
endorsed by any of these authors or bodies.
