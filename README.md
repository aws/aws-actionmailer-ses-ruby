# ActionMailer delivery with Amazon Simple Email Service

[![Gem Version](https://badge.fury.io/rb/aws-actionmailer-ses-ruby.svg)](https://badge.fury.io/rb/aws-actionmailer-ses-ruby)
[![Build Status](https://github.com/aws/aws-actionmailer-ses-ruby/workflows/CI/badge.svg)](https://github.com/aws/aws-actionmailer-ses-ruby/actions)
[![Github forks](https://img.shields.io/github/forks/aws/aws-actionmailer-ses-ruby.svg)](https://github.com/aws/aws-actionmailer-ses-ruby/network)
[![Github stars](https://img.shields.io/github/stars/aws/aws-actionmailer-ses-ruby.svg)](https://github.com/aws/aws-actionmailer-ses-ruby/stargazers)

This gem contains [ActionMailer](https://guides.rubyonrails.org/action_mailer_basics.html)
delivery method classes with Amazon SES and SESV2.

## Installation

Add this gem to your Rails project's Gemfile:

```ruby
gem 'aws-sdk-rails', '~> 4'
gem 'aws-actionmailer-ses', '~> 0'
```

Then run `bundle install`.

This gem also brings in the following AWS gems:

* `aws-sdk-ses`
* `aws-sdk-sesv2`

You will have to ensure that you provide credentials for the SDK to use. See the
latest [AWS SDK for Ruby Docs](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/index.html#Configuration)
for details.

If you're running your Rails application on Amazon EC2, the AWS SDK will
check Amazon EC2 instance metadata for credentials to load. Learn more:
[IAM Roles for Amazon EC2](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html)

## Usage

To use these mailers as a delivery method, you need to register them with
`ActionMailer::Base`. You can create a Rails initializer
`config/initializers/action_mailer.rb` with contents similar to the following:

```ruby
options = { region: 'us-west-2' }
ActionMailer::Base.add_delivery_method :ses, Aws::ActionMailer::SES::Mailer, **options
ActionMailer::Base.add_delivery_method :ses_v2, Aws::ActionMailer::SESV2::Mailer, **options
```

In your Rails environment configuration, set the delivery method to
`:ses` or `:ses_v2`.

```ruby
config.action_mailer.delivery_method = :ses # or :ses_v2
```
