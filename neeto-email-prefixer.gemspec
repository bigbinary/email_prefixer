# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neeto_email_prefixer/version'

Gem::Specification.new do |spec|
  spec.name          = 'neeto-email-prefixer'
  spec.version       = NeetoEmailPrefixer::VERSION
  spec.authors       = ['Ryan Sonnek']
  spec.email         = ['ryan@codecrate.com']
  spec.summary       = 'Automatically add email prefix to outgoing emails'
  spec.description   = 'Add standard email prefix to all outgoing emails'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 4.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'coveralls'
end
