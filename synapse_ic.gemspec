# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'synapse_ic/version'

Gem::Specification.new do |s|
  s.name          = "synapse_ic"
  s.version       = SynapseIc::VERSION
  s.authors       = ["George Stavrou"]
  s.email         = ["iphone@icleversoft.com"]
  s.summary       = "A simple synapsepay client"
  s.description   = "Provides easy way to interact with the Synapse API"
  s.homepage      = ""
  s.license       = "MIT"
  
  s.add_dependency('rest-client', '~> 1.4')
  s.add_dependency('json', '~> 1.8.1')
  
  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.3.0"
  s.add_development_dependency "pry", "~> 0.10.1"
  s.add_development_dependency "vcr", "~> 2.9.3"
  s.add_development_dependency "webmock", "~> 1.21.0"
  
  s.add_development_dependency "faraday", "~> 0.9.0"
  s.add_development_dependency "faraday_middleware", "~> 0.10.0"
  s.add_development_dependency "simple_oauth", "~> 0.3.1"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

end
