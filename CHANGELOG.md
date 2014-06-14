Breakpoint Slicer changelog
===========================

0.1
---

Initial release


1.0
---

- Refactored for DRY.
- Added support for the Breakpoint's no-query fallback.


1.1
---

- Fixed `to` and `from` being swapped. (-_-')


1.2
---

- Introduced `$slicer-anti-overlap-corrections` to prevent slices from overlapping.


1.3
---

- Introduced `$slicer-breakpoint-names` to call slices by name rather than number.


1.31
----

- Fixed bug: Breakpoint Slicer was failing without `$slicer-breakpoint-names` defined.


1.31
----

- Added support for slice names to helper functions.