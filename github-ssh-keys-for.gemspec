# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_ssh_keys_for/version'

Gem::Specification.new do |spec|
  spec.name          = "github-ssh-keys-for"
  spec.version       = GithubSshKeysFor::VERSION
  spec.authors       = ["Sandro Padin"]
  spec.email         = ["sandropadin@gmail.com"]
  spec.summary       = %q{Find and print the SSH keys for any Github user.}
  spec.description   = %q{Find and print the SSH keys for any Github user.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
