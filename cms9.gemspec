$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cms9/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cms9"
  s.version     = Cms9::VERSION
  s.authors     = ["SamirHodzic"]
  s.email       = ["samir.hodzic@klika.ba"]
  s.homepage    = "http://www.klika.ba"
  s.summary     = "Cms9"
  s.description = "Small CMS Admin module for Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "puma", "~> 3.0"
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "uglifier", ">= 1.3.0"
  s.add_dependency "coffee-rails", "~> 4.2"
  s.add_dependency "jquery-rails"
  s.add_dependency "jbuilder", "~> 2.5"
  s.add_dependency "bootstrap-sass", "~> 3.3.7"
  s.add_dependency "rails-assets-tether", ">= 1.1.0"
  s.add_dependency "font-awesome-rails"
  s.add_dependency "dragonfly", "~> 1.0.12"
  s.add_dependency "mini_magick"
  s.add_dependency "ckeditor"
  s.add_dependency "kaminari"

  s.add_development_dependency "pry"
  s.add_development_dependency "web-console"
  s.add_development_dependency "listen", "~> 3.0.5"
  s.add_development_dependency "spring"
  s.add_development_dependency "spring-watcher-listen", "~> 2.0.0"
  s.add_development_dependency "sqlite3"
end
