require 'rails_helper'

RSpec.describe NeetoEmailPrefixer::Interceptor do
  describe '#delivering_email' do
    let(:email) { ExampleMailer.simple_mail }
    let(:ticket_email) { ExampleMailer.ticket_mail }

    context 'when application_name and stage_name is configured' do
      before do
        NeetoEmailPrefixer.configuration.application_name = 'CustomApp'
        NeetoEmailPrefixer.configuration.stage_name = 'staging'
        email.deliver_now
      end

      it 'adds prefix to mail subject' do
        expect(email.subject).to eq '[CustomApp STAGING] Here is the Subject'
      end

      it 'does not add prefix to mail subject' do
        expect(ticket_email.subject).to eq 'Fwd: Here is the Subject'
      end
    end
  end
end
