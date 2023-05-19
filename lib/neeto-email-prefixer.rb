# frozen_string_literal: true

require "neeto_email_prefixer/version"
require "neeto_email_prefixer/configuration"
require "neeto_email_prefixer/interceptor"
require "neeto_email_prefixer/railtie" if defined?(Rails)

module NeetoEmailPrefixer
  class << self
    def configure
      yield configuration
      configuration
    end

    def configuration
      @_configuration ||= NeetoEmailPrefixer::Configuration.new
    end
  end
end
