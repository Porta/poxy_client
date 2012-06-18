# -*- encoding: utf-8 -*-
require File.expand_path('../lib/poxy_client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julian Porta"]
  gem.email         = ["julian@porta.sh"]
  gem.description   = %q{Client for the Poxy website}
  gem.summary       = %q{Poxy is a website that captures requests and let's you retrieve and regenerate those requests to your local app}
  gem.homepage      = "http://poxy.porta.sh"

  gem.add_runtime_dependency "httpi", [">= 1.0.0"]
  
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "poxy_client"
  gem.require_paths = ["lib"]
  gem.version       = PoxyClient::VERSION
end
