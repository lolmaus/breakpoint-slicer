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


1.3.
---

- Introduced `$slicer-breakpoint-names` to call slices by name rather than number.


1.3.1
----

- Fixed bug: Breakpoint Slicer was failing without `$slicer-breakpoint-names` defined.


1.3.2
----

- Added support for slice names to helper functions.


1.3.3
----

- Fixed a typo in an error message, brushed up comments.
- Added `lbp()` and `rbp()` shortcuts for the `left-bp-of-slice()` and `right-bp-of-slice()` functions.


1.3.4
----

- Removed support for slices names from the `bp()` function. It made no sense.
- Fixed a bug with `lpm()` calling `right-bp-of-slice()`.


1.3.5
----

- Added `prev-slice()` and `next-slice()` helper functions.


1.3.6
----

- Project published on Bower.


1.4.0
----

- Project published on npm and Eyeglass.


2.0.0
----

- `breakpoint` is no longer imported implicitly. Manual `@import breakpoint` required.