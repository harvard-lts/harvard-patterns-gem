module Harvard
  module Patterns
    module Gem
      class Engine < ::Rails::Engine
        initializer "harvard-patterns-gem.assets.precompile" do |app|
          app.config.assets.paths << root.join("app", "assets", "images")
          app.config.assets.precompile += %w[*.png *.jpg *.jpeg *.svg *.gif]
        end
      end
    end
  end
end
