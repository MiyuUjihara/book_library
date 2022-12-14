# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-google-oauth2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'

  gem.authors       = ["Josh Ellithorpe"]
  gem.email         = ["quest@mac.com"]
  gem.description   = %q{A Google oauth2 strategy for OmniAuth 1.0}
  gem.summary       = %q{A Google oauth2 strategy for OmniAuth 1.0}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-google-oauth2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::GoogleOauth2::VERSION
end
