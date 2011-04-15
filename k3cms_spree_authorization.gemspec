# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "k3cms/spree_authorization/version"

Gem::Specification.new do |s|
  s.name          = 'k3cms_spree_authorization'
  s.summary       = %q{Use the authorization capabilities built into Spree}
  s.description   = %q{
This gem works with the k3cms_authorization gem to provide an ultra-simple
authorization for Spree.

It uses the authorization scheme already provided by Spree, so any Spree user
that is an admin user in Spree will have FULL permissions in K3cms.  Non-admin
users and non-logged-in user will have only guest permissions.
  }
  s.homepage      = "http://k3cms.org/#{s.name}"

  s.add_dependency 'k3cms_core'

  s.add_development_dependency 'rspec', '~> 2.2.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.version       = K3cms::SpreeAuthorization::Version
  s.platform      = Gem::Platform::RUBY
  s.authors       = `git shortlog --summary --numbered         | awk '{print $2, $3    }'`.split("\n")
  s.email         = `git shortlog --summary --numbered --email | awk '{print $2, $3, $4}'`.split("\n")
end
