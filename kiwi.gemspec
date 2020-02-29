
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kiwi_api/version"

Gem::Specification.new do |spec|
  spec.name          = "kiwi-ruby"
  spec.version       = KiwiApi::VERSION
  spec.authors       = ["Jose Ferrer"]
  spec.email         = ["estoy@moviendo.me"]

  spec.summary       = %q{Wrapper for the Kiwi.com API}
  spec.homepage      = "https://github.com/jferrer/kiwi"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock", "3.6.2"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "activesupport"
end
