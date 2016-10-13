require "rails/generators/base"
require 'rails/generators/migration'

module Cms9
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :def_route, type: :string, default: "cms9"
      source_root File.expand_path(File.dirname(__FILE__))

      def mount_engine_route
        puts "\nMounting Cms9::Engine on " + "/" + file_name + " route"
        route "mount Cms9::Engine => " + "'/" + file_name + "'"
        puts "\n"
      end

      def copy_initializer
        puts "Copying necessary configurations..."
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
