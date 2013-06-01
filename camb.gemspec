# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'camb/version'

Gem::Specification.new do |gem|
  gem.name          = "camb"
  gem.version       = Camb::VERSION
  gem.authors       = ["Joshua Bussdieker"]
  gem.email         = ["jbussdieker@gmail.com"]
  gem.description   = %q{Test runner}
  gem.summary       = %q{Test runner}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'eventmachine'
end
