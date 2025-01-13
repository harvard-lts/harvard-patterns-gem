module Patterns
  module Gem
    class Engine < ::Rails::Engine
      initializer "patterns.gem.assets.precompile" do |app|
        app.config.assets.precompile += %w[harvard-patterns.css]
      end
    end
  end
end
