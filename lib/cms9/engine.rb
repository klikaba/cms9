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

    initializer :append_migrations do |app|
      app.class.configure do
        config.paths['db/migrate'] = Cms9::Engine.paths['db/migrate'].existent
      end
    end

  end
end
