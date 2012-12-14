Gem::Specification.new do |s|
  s.name = "compass-hdpi"
  s.version = "1.4b"

  s.author = "Pierre Burel"
  s.email = "pierre.burel@gmail.com"
  s.summary = %q{Compass HDPI}
  s.description = %q{Compass mixins for dealing with HDPI (a.k.a. Retina) sprites and images in your CSS}
  s.homepage = "http://github.com/pierreburel.com/compass-hdpi"

  s.files = %w(README.md)
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  s.add_dependency("sass", [">= 3.2.0"])
  s.add_dependency("compass", [">= 0.12.2"])
end