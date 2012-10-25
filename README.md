# Compass HDPI

Compass mixins for dealing with HDPI (a.k.a. Retina) sprites and images in your CSS.  
Based on [Compass Sprite Base](https://github.com/chriseppstein/compass/blob/stable/frameworks/compass/stylesheets/compass/utilities/sprites/_base.scss) ([doc](http://compass-style.org/reference/compass/utilities/sprites/base/)).


## Installation

Add the following lines in your Gemfile :

    gem "compass-hdpi", :git => "git://github.com/pierreburel/compass-hdpi.git"
    gem "compass", ">= 0.12.2"
    gem "sass", ">= 3.2.0"

And run 

    bundle install

Or download and copy the extension in the `extensions` folder in your project directory (or in `vendor/plugins/compass_extensions` for Rails applications).  

Then, add the following line in your config.rb file :

    require "compass-hdpi"

---

## Sprites

### @mixin sprite-hdpi($map, $map-hdpi, $sprite, $dimensions, $set-background-image: false)

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
    $icons-hdpi: $sprite-map("icons@2x/*.png");

    .icon-facebook {
      $background: $icons no-repeat;
      @include sprite($icons, $icons-hdpi, facebook, true);
    }


### @mixin sprites-hdpi($map, $map-hdpi, $sprites, $base-class, $dimensions, $prefix, $set-background-image: false)

Generates a class for each space separated name in `$sprite-names`.
The class will be of the form .<map-name>-<sprite-name>.

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
    $icons-hdpi: $sprite-map("icons@2x/*.png");

    .icon {
      $background: $icons no-repeat;
      height: 16px;
      width: 16px;
      @include hide-text;
      @include inline-block;
    }
    @include sprites-hdpi($icons, $icons-hdpi);


#### Example #2
    
    @import "compass-hdpi";

    $sprites: sprite-map("sprites/*.png");
    $sprites-hdpi: $sprite-map("sprites-hdpi/*.png");

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
      @include inline-background-image-hdpi("logo.png", "hdpi/logo.png");
    }

---

## Configuration and other mixins

You can override the HDPI media query with the `$media-hdpi` variable which is by default :

    $media-hdpi: "(min--moz-device-pixel-ratio: 1.5),
      (-o-min-device-pixel-ratio: 3/2),
      (-webkit-min-device-pixel-ratio: 1.5),
      (min-device-pixel-ratio: 1.5),
      (min-resolution: 1.5dppx)" !default;

You can then use the `media-hdpi` mixin to easily target HDPI devices :

    .hr {
      background: blue;

      @include media-hdpi {
        background: red;
      }
    }

You can force HDPI assets on normal screens by setting the `$force-hdpi` variable to `true` (default to `false`)

    $force-hdpi: false !default;

You can also totally disable HDPI assets by setting the `$disable-hdpi` variable to `true` (default to `false`)

    $disable-hdpi: false !default;