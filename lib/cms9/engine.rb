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

    paths["app"]                 # => ["app"]
    paths["app/controllers"]     # => ["app/controllers"]
    paths["app/helpers"]         # => ["app/helpers"]
    paths["app/models"]          # => ["app/models"]
    paths["app/views"]           # => ["app/views"]
    paths["lib"]                 # => ["lib"]
    paths["lib/tasks"]           # => ["lib/tasks"]
    paths["config"]              # => ["config"]
    paths["config/initializers"] # => ["config/initializers"]
    paths["config/locales"]      # => ["config/locales"]
    paths["config/routes.rb"]    # => ["config/routes.rb"]
  end
end
