module NeetoEmailPrefixer
  class Railtie < ::Rails::Railtie
    initializer 'neeto_email_prefixer.configure_defaults' do |app|
      config = NeetoEmailPrefixer.configure do |config|
        config.application_name ||= app.class.module_parent_name
        config.stage_name ||= Rails.env
        config.builder ||= NeetoEmailPrefixer::Configuration::DEFAULT_BUILDER
      end
      interceptor = NeetoEmailPrefixer::Interceptor.new(config)
      ActionMailer::Base.register_preview_interceptor(interceptor)
      ActionMailer::Base.register_interceptor(interceptor)
    end
  end
end
