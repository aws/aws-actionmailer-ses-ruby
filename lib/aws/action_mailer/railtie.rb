# frozen_string_literal: true

module Aws
  module ActionMailer
    class Railtie < Rails::Railtie
      config.before_initialize do
        ActiveSupport.on_load :action_mailer do
          add_delivery_method :ses, SES::Mailer
          add_delivery_method :ses_v2, SESV2::Mailer
        end
      end
    end
  end
end
