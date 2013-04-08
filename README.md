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




  [1]: https://github.com/Team-Sass/breakpoint
