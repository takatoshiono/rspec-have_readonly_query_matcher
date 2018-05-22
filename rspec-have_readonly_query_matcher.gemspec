
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rspec/have_readonly_query_matcher/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec-have_readonly_query_matcher"
  spec.version       = RSpec::HaveReadonlyQueryMatcher::VERSION
  spec.authors       = ["Takatoshi Ono"]
  spec.email         = ["takatoshi.ono@gmail.com"]

  spec.summary       = %q{RSpec matcher for testing readonly queries}
  spec.description   = %q{RSpec matcher for testing readonly queries}
  spec.homepage      = "https://github.com/takatoshiono/rspec-have_readonly_query_matcher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
