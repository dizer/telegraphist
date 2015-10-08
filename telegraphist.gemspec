# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegraphist/version'

Gem::Specification.new do |spec|
  spec.name          = "telegraphist"
  spec.version       = Telegraphist::VERSION
  spec.authors       = ["Yury Alexandrov"]
  spec.email         = ["dizeru@gmail.com"]

  spec.summary       = %q{Telegram Bot API client}
  spec.homepage      = "https://github.com/dizer/telegraphist"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
