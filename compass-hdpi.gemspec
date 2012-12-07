Gem::Specification.new do |s|
  s.name          = "compass-hdpi"
  s.version       = "1.4b"
  s.date          = "2012-12-07"

  s.authors       = "Pierre Burel"
  s.email         = "pierre.burel@gmail.com"
  s.description   = "Compass HDPI"
  s.summary       = "Compass mixins for dealing with HDPI (a.k.a. Retina) sprites and images in your CSS"
  s.homepage      = "http://github.com/pierreburel.com/compass-hdpi"

  s.files         = ["README.md", Dir.glob("lib/*.*"), Dir.glob("stylesheets/*.*")]

  s.add_dependency("sass", [">= 3.2.0"])
  s.add_dependency("compass", [">= 0.12.2"])
end