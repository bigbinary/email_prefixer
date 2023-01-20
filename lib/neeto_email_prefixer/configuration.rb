module NeetoEmailPrefixer
  class Configuration
    DEFAULT_BUILDER = lambda do
      stage_name = NeetoEmailPrefixer.configuration.stage_name
      prefixes = []
      prefixes << NeetoEmailPrefixer.configuration.application_name
      prefixes << stage_name.upcase unless stage_name == 'production'
      "[#{prefixes.join(' ')}] "
    end
    attr_accessor :application_name, :stage_name, :builder
  end
end
