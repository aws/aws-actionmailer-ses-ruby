# frozen_string_literal: true

module Aws
  module ActionMailer
    describe Railtie do
      it 'adds SES and SESV2 delivery methods' do
        expect(::ActionMailer::Base.delivery_methods).to include(:ses, :ses_v2)
      end

      it 'can be configured using config.action_mailer.<mailer>_settings' do
        expect(::ActionMailer::Base.ses_settings).to eq({ region: 'peccy' })
        expect(::ActionMailer::Base.ses_v2_settings).to eq({ region: 'peccy_v2' })
      end
    end
  end
end
