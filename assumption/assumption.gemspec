lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "assumption/version"

Gem::Specification.new do |spec|
  spec.name          = "assumption"
  spec.version       = Assumption::VERSION
  spec.authors       = ["DBuckley0126"]
  spec.email         = ["dannyboy.msn@hotmail.com"]

  spec.summary       = "Flatiron: CLI Scrapper Game"
  spec.description   = "A Command-line interface game which the user is presented with a phrase and they have to assume what autocomplete result is first under a time limit to get to the next stage."
  spec.homepage      = "https://rubygems.org/gems/a"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = "https://rubygems.org/gems/a"
  spec.metadata["source_code_uri"] = "https://rubygems.org/gems/a"
  spec.metadata["changelog_uri"] = "https://rubygems.org/gems/a"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 2.0"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "minitest", "~> 5.0"
  spec.add_dependency "pry", ">= 0"
  spec.add_dependency "nokogiri", ">= 0"
  spec.add_dependency 'tco', '~> 0.1.8'
  spec.add_dependency 'timeout'
end
