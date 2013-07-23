# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque/smtp/version'

Gem::Specification.new do |spec|
  spec.name          = "resque-smtp"
  spec.version       = Resque::SMTP::VERSION
  spec.authors       = ["Restoradno"]
  spec.email         = ["dev@restorando.com"]
  spec.description   = %q{Deliver mail in a resque job}
  spec.summary       = %q{Adds a new delivery method to mail to allow delivering mails inside a job}
  spec.homepage      = "https://github.com/restorando/resque-smtp"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "resque", "~> 1.22"
  spec.add_dependency "mail", "~> 2.5.4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "actionmailer", ">= 3.2"
end
