# Compass HDPI

Compass mixins for dealing with HDPI (a.k.a. Retina) sprites and images in your CSS.  
Based on [Compass Sprite Base](https://github.com/chriseppstein/compass/blob/stable/frameworks/compass/stylesheets/compass/utilities/sprites/_base.scss) ([doc](http://compass-style.org/reference/compass/utilities/sprites/base/)).


## Installation

### With Bundler

Add the following lines in your Gemfile :

    gem "compass-hdpi", :git => "git://github.com/pierreburel/compass-hdpi.git"
    gem "compass", ">= 0.12.2"
    gem "sass", ">= 3.2.0"

And run 

    bundle install

Then, add the following line in your config.rb file :

    require "compass-hdpi"

### Manually

Simply download and copy `stylesheets/_compass-hdpi.scss` in your `sass` directory. But you really should use [RVM](https://rvm.io/) and [Bundler](http://gembundler.com/).

---

## Sprites

### @mixin sprite-hdpi($map, $map-hdpi, $sprite, $dimensions, $set-background-image, $offset-x, $offset-y)

Include the position and (optionally) dimensions of this `$sprite` in the given sprite `$map` and `$map-hdpi`. The sprite url should come from either a base class or you can specify the `sprite-url` explicitly like this, except if `$set-background-image` is set to true:

    background: $map no-repeat;


#### Arguments

 - `$map`: normal `sprite-map` 
 - `$map-hdpi`: HDPI `sprite-map`
 - `$sprite`: sprite name
 - `$dimensions`: set element dimensions based on sprite size (boolean, default to `false`)
 - `$set-background-image`: set element `background-image` (boolean, default to `false`)


#### Example

    @import "compass-hdpi";

    $icons: sprite-map("icons/*.png");
    $icons-hdpi: sprite-map("icons@2x/*.png");

    .icon-facebook {
      background: $icons no-repeat;
      @include sprite($icons, $icons-hdpi, facebook, true);
    }


### @mixin sprites-hdpi($map, $map-hdpi, $sprites, $base-class, $dimensions, $prefix, $set-background-image, $offset-x, $offset-y)

Generates a class for each space separated name in `$sprite-names`.
The class will be of the form `.<map-name>-<sprite-name>`

If a base class is provided, then each class will extend it.

If `$dimensions` is `true`, the sprite dimensions will specified.


#### Arguments

 - `$map`: normal `sprite-map` 
 - `$map-hdpi`: HDPI `sprite-map`
 - `$sprites`: sprites names (default to all sprites)
 - `$base-class`: class to extend (default to false)
 - `$dimensions`: set element dimensions based on sprite size (boolean, default to `false`)
 - `$prefix`: class prefix (default to `sprite-map` name)
 - `$set-background-image`: set `.prefix` element `background-image` (boolean, default to `false`)


#### Example #1

    @import "compass-hdpi";

    $icons: sprite-map("icons/*.png");
    $icons-hdpi: sprite-map("icons@2x/*.png");

    .icon {
      background: $icons no-repeat;
      height: 16px;
      width: 16px;
      @include hide-text;
      @include inline-block;
    }
    @include sprites-hdpi($icons, $icons-hdpi);


#### Example #2
    
    @import "compass-hdpi";

    $sprites: sprite-map("sprites/*.png");
    $sprites-hdpi: sprite-map("sprites-hdpi/*.png");

    .icons {
      @include hide-text;
      @include inline-block;
    }
    @include sprites-hdpi($sprites, $sprites-hdpi, facebook twitter, ".icons", true, "icon", true);

---

## Images

### @mixin background-image-hdpi($image, $image-hdpi, $dimensions)

Set a normal and HDPI background-image and (optionally) its dimensions


#### Arguments

 - `$image`: normal image path
 - `$image-hdpi`: HDPI image path
 - `$dimensions`: set element dimensions based on image size (boolean, default to `false`)


#### Example

    @import "compass-hdpi";

    .logo {
      @include background-image-hdpi("logo.png", "logo@2x.png", true);
      @include hide-text;
    }


### @mixin inline-background-image-hdpi($image, $image-hdpi, $dimensions)

Set a normal and HDPI inline background-image and (optionally) its dimensions


#### Arguments

 - `$image`: normal image path
 - `$image-hdpi`: HDPI image path
 - `$dimensions`: set element dimensions based on image size (boolean, default to `false`)


#### Example

    @import "compass-hdpi";

    .logo {
      height: 50px;
      width: 100px;
      @include hide-text;
      @include inline-background-image-hdpi("logo.png", "hdpi/logo.png");
    }


### @mixin background-image-svg($image, $image-fallback, $dimensions, $background-size, $no-svg, $no-js)

Set a SVG as a `background-image` and its fallback based on `.no-svg` and `.no-js` classes added by [http://modernizr.com/download/#svg-cssclasses](Modernizr)  
Element's dimenions and `background-size` can be set based on the size of the fallback image


#### Arguments

 - `$image`: SVG path
 - `$image-hdpi`: Fallback image path (PNG)
 - `$dimensions`: set element dimensions based on fallback image size (boolean, default to `false`)
 - `$background-size`: set `background-size` based on fallback image size (boolean, default to `false`)
 - `$no-svg`: CSS class added by Modernizr if SVG images aren't supported by the browser (default to `.no-svg`)
 - `$no-js`: CSS class added by Modernizr if JavaScript isn't supported by the browser (default to `.no-js`, set to `false` if you don't want JavaScript detection)


#### Example

    @import "compass-hdpi";

    .logo {
      @include background-image-svg("logo.svg", "logo.png", true);
      @include hide-text;
    }

---

## Configuration and other mixins

### Pixel ratio and media query

You can change the pixel ratio of the media query by overriding the `$pixel-ratio-hdpi` variable which is by default 1.5.

You can then use the `media-hdpi` mixin to easily target HDPI devices :

    .hr {
      height: 1px;

      @include media-hdpi {
        height: 2px;
      }
    }

The mixin accepts a temporary pixel ratio as an argument.

    .hr {
      height: 1px;

      @include media-hdpi(2) {
        height: 2px;
      }
    }

You can also override the whole media query with the `$media-hdpi` variable which is by default (depending of `$pixel-ratio-hdpi`), thanks to [Brett Jankord](http://www.brettjankord.com/2012/11/28/cross-browser-retinahigh-resolution-media-queries/) :

    $media-hdpi: "(-webkit-min-device-pixel-ratio: 1.5), (min-resolution: 144dpi)" !default;

For exemple, you can use [Thomas Fuchs](http://retinafy.me/) media query : 
    
    $media-hdpi: "(min--moz-device-pixel-ratio: 1.5),
      (-o-min-device-pixel-ratio: 150/100),
      (-webkit-min-device-pixel-ratio: 1.5),
      (min-device-pixel-ratio: 1.5),
      (min-resolution: 1.5dppx)";

### Debug

You can force HDPI assets on normal screens by setting the `$force-hdpi` variable to `true` (default to `false`)

    $force-hdpi: false !default;

You can also totally disable HDPI assets by setting the `$disable-hdpi` variable to `true` (default to `false`)

    $disable-hdpi: false !default;