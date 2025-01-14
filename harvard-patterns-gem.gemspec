require_relative 'lib/patterns/gem/version'

Gem::Specification.new do |spec|
  spec.name          = "harvard-patterns-gem"
  spec.version       = Patterns::Gem::VERSION
  spec.authors       = ["Maura Meagher"]
  spec.email         = ["maura_ferrarini@harvard.edu"]

  spec.summary       = "Ruby Gem with built assets from Harvard Patterns."
  spec.description   = "This gem provides a set of prebuilt stylesheets and assets for Harvard Library Patterns. It is designed as a Rails Engine and integrates with Rails applications."
  spec.homepage      = "https://github.com/harvard-lts/harvard-patterns-gem"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'" # if want to push to something like RubyGems

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/harvard-lts/harvard-patterns-gem"
  spec.metadata["changelog_uri"] = "https://github.com/harvard-lts/harvard-patterns-gem/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_runtime_dependency 'rails', '~> 6.0'
  spec.add_runtime_dependency 'sassc-rails'

  # Development dependencies
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
end
