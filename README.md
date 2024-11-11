## ActionMailer delivery with Amazon Simple Email Service

This gem contains Mailer classes for Amazon SES and SESV2. To use these mailers
as a delivery method, you need to register them with ActionMailer::Base.
You can create a Rails initializer `config/initializers/action_mailer.rb`
with contents similar to the following:

```ruby
options = { region: 'us-west-2' }
ActionMailer::Base.add_delivery_method :ses, Aws::ActionMailer::SESMailer, **options
ActionMailer::Base.add_delivery_method :ses_v2, Aws::ActionMailer::SESV2Mailer, **options
```

In your Rails environment configuration, set the delivery method to
`:ses` or `:ses_v2`.

```ruby
config.action_mailer.delivery_method = :ses # or :ses_v2
```
