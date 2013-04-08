Breakpoint Slicer
=================

Along with Respond To, Breakpoint Slicer is an alternative syntax for [Breakpoint][1].


Concept
-------

Imagine the breakpoints of your site on a scale:

     Breakpoint:   0                 400px     600px     800px       1050px
                   ├───────────────────┼─────────┼─────────┼───────────┼─────────>

See those spans between breakpoints? Let's name them "slices".

Breakpoint Slicer numbers the slices sequentially:

     Breakpoint:   0                 400px     600px     800px       1050px
                   ├───────────────────┼─────────┼─────────┼───────────┼─────────>
     Slice #:                1              2         3          4
     
The goal of breakpoint slicer is to let you quickly set breakpoints using those numbers instead of px/em values.


Usage
-----

Breakpoint Slicer offers four handy mixins that let you set breakpoint ranges easily: `at`, `from`, `to` and `between`:

Styles under `at(3)`        are applied when browser window width is inside the 3rd slice.

Styles under `from(3)`      are applied when browser window width is inside the 3rd slice or larger.

Styles under `to(3)`        are applied when browser window width is inside the 3rd slice or larger.

Styles under `between(2,4)` are applied when browser window width is inside the 2nd, 4rd slice or any slice between the two.










  [1]: https://github.com/Team-Sass/breakpoint
