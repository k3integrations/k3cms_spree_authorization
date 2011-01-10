# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'k3_trivial_authorization'
  s.version     = '0.1.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['John Ash']
  s.email       = ['jash@k3integrations.com']
  s.homepage    = 'http://k3cms.org/documentation/k3_trivial_authorization'
  s.summary     = %q{Provides trivial authorization capabilities}
  s.description = %q{This gem works with other K3 gems and provides trivial authorization capabilities.  All authenticated visitors have full admin rights.  All other (unauthenticated) visitors to the website have the rights of guest.  This gem provides no way to change the default authorizations provided by other gems.}
  s.add_runtime_dependency(%q<k3_core>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 0"])
  
#  s.rubyforge_project = "k3_trivial_authorization"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
