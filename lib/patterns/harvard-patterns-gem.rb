require "patterns/gem/version"
require "patterns/gem/engine"

# module Patterns
#   module Gem
#     class Error < StandardError; end
#       module Rails
#         class Engine < ::Rails::Engine
        #   initializer "patterns.gem.assets.precompile" do |app|
        #     app.config.assets.precompile += %w[harvard-patterns.scss]
        #   end
        # end
#       end
#   end
# end

module Patterns
  module Gem
    class Error < StandardError; end
  end
end
