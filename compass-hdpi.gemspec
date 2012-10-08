# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = "compass-hdpi"
  gem.version       = "1.0"
  gem.date          = "2012-09-20"

  gem.authors       = ["Pierre Burel"]
  gem.email         = ["pierre.burel@gmail.com"]
  gem.description   = "Compass HDPI"
  gem.summary       = "Compass mixins for dealing with HDPI (a.k.a. Retina) sprites and images in your CSS"
  gem.homepage      = "http://github.com/pierreburel.com/compass-hdpi"

  gem.files         = ["README.md", Dir.glob("lib/*.*"), Dir.glob("stylesheets/*.*")]

  gem.required_rubygems_version = ">= 1.3.6"
  gem.rubygems_version = "1.3.6"

  gem.add_dependency("compass", [">= 0.12.2"])
  gem.add_dependency("sass", [">= 3.2.0"])
end
