# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'capistrano-mailnote'
  s.version     = '0.1.1'
  s.date        = '2014-11-18'
  s.summary     = ""
  s.description = "A gem for Capistrano email release note."
  s.authors     = ["Robert Pozoga"]
  s.email       = 'robert.pozoga@gmail.com'
  s.homepage    = 'https://github.com/robpe/capistrano-mailnote'

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rails',     '~> 4.1.8'
  s.add_runtime_dependency 'actionmailer'
  s.add_runtime_dependency 'markerb'
  s.add_runtime_dependency 'redcarpet', '>= 2.0'

  s.homepage    = ''
  s.license     = 'MIT'
end
