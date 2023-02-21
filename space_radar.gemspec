# frozen_string_literal: true

require_relative 'lib/space_radar/version'

Gem::Specification.new do |spec|
  spec.name          = 'space_radar'
  spec.version       = SpaceRadar::VERSION
  spec.authors       = ['Pavlo Leoniuk']
  spec.email         = ['pashababak@gmail.com']

  spec.summary       = 'I will add later'
  spec.description   = 'I will add later'
  # spec.homepage      = "I will add later"
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.3')

  spec.metadata['allowed_push_host'] = 'I will add later'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
