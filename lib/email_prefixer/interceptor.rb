# frozen_string_literal: true

module EmailPrefixer
  class Interceptor
    SKIP_SUBJECTS = ["Re:", "Fwd:"].freeze

    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def delivering_email(mail)
      prefix = configuration.builder.call
      mail.subject.prepend(prefix) unless prefix?(mail)
    end

    alias_method :previewing_email, :delivering_email

    private

      def prefix?(mail)
        SKIP_SUBJECTS.map { |sub_prefix| mail.subject.include?(sub_prefix) }.any?
      end
  end
end
