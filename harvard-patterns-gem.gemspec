require_relative 'lib/harvard/patterns/gem/version'

Gem::Specification.new do |spec|
  spec.name          = "harvard-patterns-gem"
  spec.version       = Harvard::Patterns::Gem::VERSION
  spec.authors       = ["Mr Phil Plencner"]
  spec.email         = ["philip_plencner@harvard.edu"]

  spec.summary       = %q{Ruby Gem with built assets from Harvard Patterns.}
  spec.homepage      = "https://gitlab.com/harvard-library-web-team/harvard-patterns-gem"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.com/harvard-library-web-team/harvard-patterns-gem"
  spec.metadata["changelog_uri"] = "https://gitlab.com/harvard-library-web-team/harvard-patterns-gem/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails'
  spec.add_runtime_dependency 'sass'
  spec.add_runtime_dependency 'sass-rails'
end
