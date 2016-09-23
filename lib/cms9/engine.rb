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

    original_js = File.binread("app/assets/javascripts/application.js")
    if original_js.include?("require 'cms9'")
       say_status("skipped", "insert into app/assets/javascripts/application.js", :yellow)
    else
       insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require ['"]?jquery['"]?} do
          "\n//= require 'cms9'\n\n"
       end
    end
  end
end
