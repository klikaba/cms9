require 'sass-rails'
require 'uglifier'
require 'coffee-rails'
require 'jquery-rails'
require 'jbuilder'
require 'bootstrap-sass'
require 'rails-assets-tether'
require 'font-awesome-rails'
require 'ckeditor'
require 'cms9'
require 'events/cms9_events'

module Cms9
  # main cms9 engine class
  class Engine < ::Rails::Engine
    isolate_namespace Cms9

    require 'kaminari'

    config.to_prepare do
      ::ApplicationController.helper(Cms9::ApplicationHelper)
    end
  end
end
