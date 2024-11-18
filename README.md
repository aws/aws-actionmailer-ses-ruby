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

To use these mailers as a delivery method, you need to set the delivery method
and configure the delivery method with the appropriate settings. For example,
to configure ActionMailer to use the Amazon SESV2 API in the `us-west-2`
region, you can add the following to an environment file in your Rails
application:

```ruby
# config/environments/production.rb

Rails.application.configure do |config|
  ...

  # Use the Amazon SESV2 API in the us-west-2 region
  config.action_mailer.delivery_method = :ses_v2
  config.action_mailer.ses_v2_settings = { region: 'us-west-2' }

  ...
end
```

## Using ARNs with SES

This gem uses [\`Aws::SES::Client#send_raw_email\`](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/SES/Client.html#send_raw_email-instance_method)
and [\`Aws::SESV2::Client#send_email\`](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/SESV2/Client.html#send_email-instance_method)
to send emails. These operations allows you to specify a cross-account identity
for the email's Source, From, and Return-Path. To set these ARNs, use any of the
following headers on your `Mail::Message` object returned by your Mailer class:

* `X-SES-SOURCE-ARN`
* `X-SES-FROM-ARN`
* `X-SES-RETURN-PATH-ARN`

Example:

```ruby
# in your Rails controller
message = MyMailer.send_email(options)
message['X-SES-FROM-ARN'] = 'arn:aws:ses:us-west-2:012345678910:identity/bigchungus@memes.com'
message.deliver
```
