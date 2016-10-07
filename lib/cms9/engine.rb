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

    initializer :append_migrations do |app|
        unless app.root.to_s.match(root.to_s)
            config.paths["db/migrate"].expanded.each do |expand_path|
                app.config.paths['db/migrate'] << expand_path
            end
        end
    end

  end
end
