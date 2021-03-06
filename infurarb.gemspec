lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infurarb/version'

Gem::Specification.new do |spec|
  spec.name          = 'infurarb'
  spec.version       = Infurarb::VERSION
  spec.authors       = ['Adam Groves']
  spec.email         = ['adam.groves@gmail.com']

  spec.summary       = 'Ruby client for Infura'
  spec.description   = "Simple wrapper around Infura's JSON-RPC API"
  spec.homepage      = 'https://github.com/LicenseRocks/infurarb'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '3.4.2'
  spec.add_runtime_dependency 'http', '~> 4.0.0'
end
