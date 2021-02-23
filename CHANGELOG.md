Breakpoint Slicer changelog
===========================



3.0.0-beta.1 (2021.02.23)
-------------------------

### ⚠Breaking changes
- The `$slices` definition now accepts `px` values and not untiless values. (@betaboon)



3.0.0-beta.0 (2021.02.22)
-------------------------

### Fixed
- Flag $slices and $media with !default to allow overrides, fixes #27 (@jaradlight)
- Readme fixes (@jaradlight)


3.0.0-alpha.0 (2021.01.30)
---------------------------

Complete rewrite!

Breakpoint Slicer had been evolving, improving its ergonomics while maintaining compatibility with old versions and supporting now obsolete libraries.

It's time to shed the legacy practices and redesign Breakpoint Slicer with simplicity and leveraging new Sass features such as modules and maps.

### ⚠ Breaking changes
- New syntax for defining slices as a map rather than two arrays.
- New default slice definitions, every 200px, up to 1400px, xxs—xxxxl.
- New variable names. With the new Sass module system, namespacing is no longer necessary.
- Addressing slices by indices is not supported.
- Iterating slices hasn't been reimplemented (now that float-based grid systems have given way to flexbox and css-grid, iteration is no logner necessary).
- Fallback is no longer supported (*I was there, Gandalf. I was there, 3000 years ago, when we had to support browsers incapable of media queries.*).
- Removed Ruby/Compass support. Breakpoint Slicer is now distributed only as an npm/Eyeglass module.
- Overlapping correction is now limited to `-1` on the right side of a slice. `+1` on the left side is no longer supported.


2.0.0
----

- `breakpoint` is no longer imported implicitly. Manual `@import breakpoint` required.


1.4.0
----

- Project published on npm and Eyeglass.

1.3.6
----

- Project published on Bower.

1.3.5
----

- Added `prev-slice()` and `next-slice()` helper functions.


1.3.4
----

- Removed support for slices names from the `bp()` function. It made no sense.
- Fixed a bug with `lpm()` calling `right-bp-of-slice()`.


1.3.3
----

- Fixed a typo in an error message, brushed up comments.
- Added `lbp()` and `rbp()` shortcuts for the `left-bp-of-slice()` and `right-bp-of-slice()` functions.


1.3.2
----

- Added support for slice names to helper functions.


1.3.1
----

- Fixed bug: Breakpoint Slicer was failing without `$slicer-breakpoint-names` defined.


1.3.
---

- Introduced `$slicer-breakpoint-names` to call slices by name rather than number.


1.2
---

- Introduced `$slicer-anti-overlap-corrections` to prevent slices from overlapping.


1.1
---

- Fixed `to` and `from` being swapped. (-_-')


1.0
---

- Refactored for DRY.
- Added support for the Breakpoint's no-query fallback.


0.1
---

Initial release
