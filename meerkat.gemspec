# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meerkat/version'

Gem::Specification.new do |spec|
  spec.name          = 'meerkat'
  spec.version       = Meerkat::VERSION
  spec.authors       = ['Pierre-Alexandre Kofron']
  spec.email         = ['pierrealexandre.kofron@gmail.com']

  spec.summary       = %q{Ruby client for Meerkat API}
  spec.description   = %q{A Ruby wrapper for the Meerkat API}
  spec.homepage      = 'https://github.com/kofronpi/meerkat'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty', '~> 0.13.3'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
end
