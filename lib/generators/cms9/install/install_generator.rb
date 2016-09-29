require "rails/generators/base"

module Cms9
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :def_route, type: :string, default: "cms9"

      def mount_engine_route
        route "mount Cms9::Engine => " + "'/" + file_name + "'"
        puts "Mounted Cms9 route to " + "/" + file_name
      end

      private
        def file_name
          def_route.underscore
        end
    end
  end
end
