# frozen_string_literal: true

module NeetoEmailPrefixer
  class Interceptor
    SKIP_SUBJECTS = ["Re:", "Fwd:"].freeze

    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def delivering_email(mail)
      if mail['custom-prefix-override'] && mail['custom-prefix-override'].value != ""
        prefix = custom_prefix_builder(mail['custom-prefix-override'].value)
      else
        prefix = configuration.builder.call
      end
      mail.subject.prepend(prefix) unless prefix?(mail)
    end

    alias_method :previewing_email, :delivering_email

    private

      def custom_prefix_builder(custom_prefix)
        stage_name = NeetoEmailPrefixer.configuration.stage_name
        prefixes = []
        prefixes << custom_prefix
        prefixes << stage_name.upcase unless stage_name == 'production'
        "[#{prefixes.join(' ')}] "
      end

      def prefix?(mail)
        SKIP_SUBJECTS.map { |sub_prefix| mail.subject.include?(sub_prefix) }.any?
      end
  end
end
