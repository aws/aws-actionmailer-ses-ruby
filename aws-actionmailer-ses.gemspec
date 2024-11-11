# frozen_string_literal: true

version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |spec|
  spec.name         = 'aws-actionmailer-ses'
  spec.version      = version
  spec.author       = 'Amazon Web Services'
  spec.email        = ['aws-dr-rubygems@amazon.com']
  spec.summary       = 'ActionMailer integration with SES'
  spec.description   = 'Amazon Simple Email Service as an ActionMailer delivery method'
  spec.homepage      = 'https://github.com/aws/aws-actionmailer-ses-ruby'
  spec.license       = 'Apache-2.0'
  spec.files         = Dir['LICENSE', 'CHANGELOG.md', 'VERSION', 'lib/**/*']

  # Require these versions for user_agent_framework configs
  spec.add_dependency('aws-sdk-ses', '~> 1', '>= 1.50.0')
  spec.add_dependency('aws-sdk-sesv2', '~> 1', '>= 1.34.0')

  spec.required_ruby_version = '>= 2.7'
end
