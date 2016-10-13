require "rails/generators/base"
require 'rails/generators/migration'
require 'rails/generators/active_record'

module Cms9
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      argument :def_route, type: :string, default: "cms9"
      source_root File.expand_path(File.dirname(__FILE__))

      def mount_engine_route
        puts "\nMounting Cms9::Engine on " + "/" + file_name + " route"
        route "mount Cms9::Engine => " + "'/" + file_name + "'"
        puts "\n"
      end

      def copy_initializer
        puts "Copying necessary files..."
        copy_file 'templates/cms9_configurator.rb', 'config/initializers/cms9_configurator.rb'
      end

      def copy_ckeditor_config
        copy_file 'templates/ckeditor_config.js', 'app/assets/javascripts/ckeditor/config.js'

        data = File.read("app/assets/javascripts/ckeditor/config.js")
        filtered_data = data.gsub("cms9", file_name)

        File.open("app/assets/javascripts/ckeditor/config.js", "w") do |f|
          f.write(filtered_data)
        end
      end

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      def generate_migration
        destination   = File.expand_path('db/migrate/cms9_create.rb', self.destination_root)
        migration_dir = File.dirname(destination)
        destination   = self.class.migration_exists?(migration_dir, 'cms9_create')

        if destination
          puts "\n\e[0m\e[31mFound existing cms9_create.rb migration. Remove it if you want to regenerate.\e[0m"
        else
          cms9_file_dir = File.expand_path('../../../../../db/migrate/.', __FILE__)
          files = []

          Dir.foreach(cms9_file_dir) do |file|
            files << file unless file =~ /^\.\.?$/
          end

          files.each do |migration|
            migration_template '../../../../db/migrate/' + migration, 'db/migrate/' + migration
          end
        end
      end

      def show_info
        puts "\n  *************************************************************************"
        puts "  *                                                                       *"
        puts "  *     Some things you must do manually if you haven\'t yet               *"
        puts "  *     Visit \033[32mhttps://github.com/klikaba/cms9\033[0m for more informations       *"
        puts "  *                                                                       *"
        puts "  *************************************************************************\n\n"
      end

      private
        def file_name
          def_route.underscore
        end
    end
  end
end
