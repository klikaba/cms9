require "rails/generators/base"
require 'rails/generators/migration'

module Cms9
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :def_route, type: :string, default: "cms9"
      include Rails::Generators::Migration
      source_root File.expand_path(File.dirname(__FILE__))

      def mount_engine_route
        route "mount Cms9::Engine => " + "'/" + file_name + "'"
        puts "Mounted Cms9::Engine on " + "/" + file_name + " route"
      end

      def copy_initializer
        copy_file 'templates/cms9_configurator.rb', 'config/initializers/cms9_configurator.rb'
      end

      def copy_ckeditor_config
        copy_file 'templates/ckeditor_config.js', 'app/assets/javascripts/ckeditor/config.js'
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def copy_migrations_config
        migration_template "templates/init_cms9_tables.rb", "db/migrate/init_cms9_tables.rb"
      end

      private
        def file_name
          def_route.underscore
        end
    end
  end
end
