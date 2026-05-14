require "harvard/patterns/gem/version"
require "harvard/patterns/gem/engine"

if defined?(Sprockets) || defined?(SassC::Rails)
  warn '[harvard-patterns-gem] sass-rails will be removed as a runtime ' \
       'dependency in v2.0.0. If your app needs sass-rails, list it ' \
       'directly in your Gemfile.'
end

module Harvard
  module Patterns
    module Gem
      class Error < StandardError; end
    end
  end
end