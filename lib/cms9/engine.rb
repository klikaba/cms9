require 'sass-rails'
require 'uglifier'
require 'coffee-rails'
require 'jquery-rails'
require 'jbuilder'
require 'bootstrap-sass'
require 'rails-assets-tether'
require 'font-awesome-rails'
require 'ckeditor'

module Cms9
  class Engine < ::Rails::Engine
    isolate_namespace Cms9

    require 'kaminari'
  end
end
