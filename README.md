<img alt="an egg slicer" src="http://i.imgur.com/GmQNEMG.jpg" align="right">

Breakpoint Slicer ![npm](https://img.shields.io/npm/v/breakpoint-slicer) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/lolmaus/breakpoint-slicer/Build%20SassDoc%20documentation%20and%20deploy%20to%20Github%20Pages) <!-- omit in toc --> 
=================

**Slice media queries with ease**

Breakpoint Slicer is a set of Sass mixins that makes working with mediaqueries effortless and fun.

```scss
@include at(s)          // => @media (min-width: 400px) and (max-width: 599px)
@include from(s)        // => @media (min-width: 400px)
@include to(s)          // => @media                        (max-width: 599px)
@include between(xs, l) // => @media (min-width: 200px) and (max-width: 799px)
```

See below how to customize breakpoints!

- [Status](#status)
- [Concept](#concept)
  - [Enter the mixins](#enter-the-mixins)
  - [Edge cases](#edge-cases)
- [Installation](#installation)
  - [npm](#npm)
  - [Yarn](#yarn)
- [Usage with default slices](#usage-with-default-slices)
  - [With Sass modules and @use, recommended](#with-sass-modules-and-use-recommended)
  - [With @import](#with-import)
- [Usage with custom slices](#usage-with-custom-slices)
  - [Basics](#basics)
  - [With Sass modules and @use, recommended](#with-sass-modules-and-use-recommended-1)
  - [With @import](#with-import-1)
- [Prepending media queries with custom media types or features](#prepending-media-queries-with-custom-media-types-or-features)
  - [Providing one media/feature group](#providing-one-mediafeature-group)
  - [Providing multiple media/feature groups](#providing-multiple-mediafeature-groups)
- [Credit](#credit)
- [License](#license)



Status
------

Breakpoint Slicer v.3 is a complete rewrite.

Breakpoint Slicer had been evolving, improving its ergonomics while maintaining compatibility with old versions and supporting now obsolete practices. As a result, it ended up being a bit messy.

It's time to shed the legacy and redesign Breakpoint Slicer with simplicity and leveraging new Sass features such as modules and maps.

See [CHANGELOG.md](https://github.com/lolmaus/breakpoint-slicer/blob/gen-3/CHANGELOG.md) for the list of breaking changes (there are many! 🙈).



Concept 
------- 

Most media query heleprs operate with breakpoints. Here they are on a scale:

     Breakpoint:   0       200px     400px     600px     800px     1000px    1200px    1400px       
                   ├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────>

Breakpoint Slicer operates with *slices* instead of breakpoints. A *slice* is a range of viewport sizes between two consequetive breakpoints.

     Breakpoint:   0       200px     400px     600px     800px     1000px    1200px    1400px       
                   ├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────>
     Slice:            xxs        xs        s         m         l         xl       xxl       xxxl   

Slices make it much easier to reason about media queries. Take any viewport width, and you can say which slice it corresponds to.

Given the slices defined above, screen width of `1024px` falls into the `xl` slice, and screen width of `1920px` falls into the `xxxl` slice.
     
The goal of Breakpoint Slicer is to let you quickly apply media queries using slice names instead of px breakpoints.



### Enter the mixins

Breakpoint Slicer offers four handy mixins that let you set breakpoint ranges easily: `at`, `from`, `to` and `between`:

Styles under `at(m)`        are applied when browser window width is inside the `m` slice.

Styles under `from(m)`      are applied when browser window width is inside the `m` slice or larger.

Styles under `to(m)`        are applied when browser window width is inside the `m` slice or smaller.

Styles under `between(s, l)` are applied when browser window width is inside the `s` slice, `l` slice (inclusive) and any slices in between, if any.

     Breakpoint:   0       200px     400px     600px     800px     1000px    1200px    1400px       
                   ├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────>
     Slice:        ·   xxs        xs   ·    s    ·    m    ·    l    ·    xl       xxl       xxxl   
                   ·                   ·         ·         ·         ·                              
                   ·                   ·         ·  at(m)  ·         ·                              
                   ·                   ·         ├────────┤·         ·                              
                   ·                   ·         ·         ·         ·                              
                   ·                   ·         · from(m) ·         ·                              
                   ·                   ·         ├─────────────────────────────────────────────────>
                   ·                   ·                   ·         ·                              
                   ·                   ·            to(m)  ·         ·                              
                   ├──────────────────────────────────────┤·         ·                              
                                       ·                             ·                              
                                       ·         between(s, l)       ·                              
                                       ├────────────────────────────┤·                              


Mixin incovation   | Resulting media query
------------------ | ------------------------------------------
at(m)              | (min-width: 600px) and (max-width: 799px)
from(m)            | (min-width: 600px)
to(m)              | (max-width: 799px)
between(s, l)      | (min-width: 400px) and (max-width: 999px)

Note that each slice includes its left breakpoint but does not include its right breakpoint.


### Edge cases

Note that the last slice does not have a right edge. When it is invoked, the media query will have no max-width value.

Some mixin invocations are **synonomous**:

     Breakpoint:   0       200px     400px     600px     800px     1000px    1200px    1400px       
                   ├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────>
     Slice:        ·   xxs   ·    xs        s         m    ·    l         xl       xxl   ·   xxxl   
                   ·         ·                             ·                             ·          
                   · at(xxs) ·                             ·                             ·  at(xxxl)
                   ├────────┤·                             ·                             ├─────────>
                   ·         ·                             ·                             ·          
                   · to(xxs) ·                             ·                             · from(xxxl)
                   ├────────┤·                             ·                             ├─────────>
                   ·                                       ·                                        
                   ·                               to(m)   ·   from(l)                              
                   ├──────────────────────────────────────┤├───────────────────────────────────────>
                   ·                                       ·                                        
                   ·           between(xxs, m)             ·           between(l, xxxl)             
                   ├──────────────────────────────────────┤├───────────────────────────────────────>

…and some become meaningless and **will produce an error**, preventing you from accidentally covering all viewports with a useless media query:

     Breakpoint:   0       200px     400px     600px     800px     1000px    1200px    1400px       
                   ├─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────>
     Slice:        ·   xxs        xs        s         m         l         xl       xxl       xxxl   
                   ·                                                                                
                   ·  from(xxs)                                                                     
                   ├───────────────────────────────────────────────────────────────────────────────>
                   ·                                                                                
                   ·                                                                      to(xxxl)  
                   ├───────────────────────────────────────────────────────────────────────────────>



Installation
------------

### npm

    npm install -D breakpoint-slicer

### Yarn

    yarn add -D breakpoint-slicer



Usage with default slices
-------------------------

### With Sass modules and @use, recommended

```scss
@use "node_modules/breakpoint-slicer" as bs;

.foo {
  @include bp.at(s) {
    color: red;
  }
}
```

### With @import

Use this only if your Sass version does not support [Sass modules](https://sass-lang.com/blog/the-module-system-is-launched).

Import `breakpoint-slicer` early in your stylesheet:

```scss
@import 'breakpoint-slicer';
```

This will expose mixins into the global scope:

```scss
.foo {
  @include at(s) {
    color: red;
  }
}
```



Usage with custom slices
-------------------------

Breakpoint Slicer lets you define your own set of slices.


### Basics

Slices are defined as a map like this:

```scss
$slices: (
  small: 0px,
  medium: 400px,
  large: 800px,
);
```

Keys are slice names and values are left breakpoints of each slice.

⚠ One slice *must* have a left breakpoint of `0px`.

It is recommended that you list slices in the incremental order.

You can pass a slices map to any of the mixins, ad-hoc style:

```
.foo {
  @include bp.at(small, $slices: $slices) {
    color: red;
  }
}
```

This approach is only useful if you have to deal with more than one set of slices per Sass module/partial.



### With Sass modules and @use, recommended

This is how you can override default slices at the top of your Sass module:

```scss
// config.scss

$slices: (
  small: 0px,
  medium: 400px,
  large: 800px,
);
```

```scss
// my-module.scss

@use "config";
@use "node_modules/breakpoint-slicer" as bs with ($slices: config.$slices);

.foo {
  @include bp.at(small) {
    color: red;
  }
}
```


### With @import

⚠ Use this only if your Sass version does not support [Sass modules](https://sass-lang.com/blog/the-module-system-is-launched).

Define `$slices` globally next to your  `breakpoint-slicer` invocation:

```scss
@import 'breakpoint-slicer';

$slices: (
  small: 0px,
  medium: 400px,
  large: 800px,
);
```
```

This will make mixins use your slices definition globally, unless overridded with an argumetn:

```scss
.foo {
  @include at(medium) {
    color: red;
  }
}

.bar {
  @include at(tablet-landscape, $slices: $other-slices) {
    color: blue;
  }
}
```



Prepending media queries with custom media types or features
------------------------------------------------------------

Use the `$media` variable in the same manner as you use `$slices`, as explained above.

💡 Here only the ad-hoc variant is demonstrated, but `@use` and global invocations are also possible.



### Providing one media/feature group

If you need something simple like `screen`, you can do `$media: screen`.

If you need to use spaces, then wrap it in parens like this: `$media: (screen and (orientation: portrait))`.

```scss
.foo {
  @include at(s, $media: (screen and (orientation: portrait))) {
    color: red;
  }
}
```

produces:

```css
@media screen and (orientation: portrait)) and (min-width: 400px) and (max-width: 599px) {
  .foo {
    color: red;
  }
}
```



### Providing multiple media/feature groups

You can pass media types/features split with commas, e. g `$media: (screen, print)`:

```scss
.foo {
  @include at(s, $media: (screen, print)) {
    color: red;
  }
}
```

The generated media query will be duplicated for each type/feature in the list:

```css
@media screen and (min-width: 400px) and (max-width: 599px), print and (min-width: 400px) and (max-width: 599px) {
  .foo {
    color: red;
  }
}
```



Credit
------

Built by Andrey Mikhaylov ([@lolmaus](https://github.com/lolmaus/)) and [contributors](https://github.com/lolmaus/breakpoint-slicer/graphs/contributors).



License
-------

MIT.
