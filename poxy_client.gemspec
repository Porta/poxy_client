# -*- encoding: utf-8 -*-
require File.expand_path('../lib/poxy_client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julian Porta"]
  gem.email         = ["julian@porta.sh"]
  gem.description   = %q{Client for Poxy (the http inbox)}
  gem.summary       = %q{Poxy is a website that captures requests and lets you do fun stuff with them}
  gem.homepage      = "http://porta.github.com/poxy_client"
  gem.post_install_message = %q{Thanks for installing poxy_client. Make sure to create an account at http://poxy.ws}

  gem.add_runtime_dependency "httpi", [">= 1.0.0"]
  gem.add_runtime_dependency "clap", [">= 0.0.2"]
  gem.add_development_dependency "test-unit"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "curb"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "poxy_client"
  gem.require_paths = ["lib"]
  gem.version       = PoxyClient::VERSION
end
