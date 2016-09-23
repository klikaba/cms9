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

    config.Cms9 = ActiveSupport::OrderedOptions.new
    initializer 'cms9.configuration' do |app|
      if app.config.cms9[:mounted_path]
        app.routes.append do
          mount Cms9::Engine => app.config.cms9[:mounted_path]
        end
      end
    end

  end
end
