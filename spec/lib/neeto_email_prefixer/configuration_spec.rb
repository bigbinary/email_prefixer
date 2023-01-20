require 'rails_helper'

RSpec.describe NeetoEmailPrefixer::Configuration do
  before do
    NeetoEmailPrefixer.configuration.application_name = 'MyApp'
  end

  describe NeetoEmailPrefixer::Configuration::DEFAULT_BUILDER do
    describe '#call' do
      subject { NeetoEmailPrefixer::Configuration::DEFAULT_BUILDER.call }
      context 'when stage_name == production' do
        before do
          NeetoEmailPrefixer.configuration.stage_name = 'production'
        end
        it { is_expected.to eq '[MyApp] ' }
      end
      context 'when stage_name != production' do
        before do
          NeetoEmailPrefixer.configuration.stage_name = 'staging'
        end
        it { is_expected.to eq '[MyApp STAGING] ' }
      end
    end
  end
end
