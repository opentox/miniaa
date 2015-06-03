# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "opentox-aa-example"
  s.version     = File.read("./VERSION")
  s.authors     = ["Micha Rautenberg"]
  s.email       = ["rautenberg@in-silico.ch"]
  s.homepage    = ""
  s.summary     = %q{Simple OpenTox A&A Service}
  s.description = %q{Simple OpenTox A&A Service}
  s.license     = 'GPL-3'

  s.files         = `git ls-files`.split("\n")
  s.required_ruby_version = '>= 2.0.0'

  # specify any dependencies here; for example:
  s.add_runtime_dependency "opentox-server"
  s.post_install_message = "Please configure your service in ~/.opentox/config/aa.rb"
end
