# NeetoEmailPrefixer

Automatically prefix all delivered emails with the application name
and Rails environment.  A helpful configuration for setting up email
filters for non-production emails and ensuring consistency across
all email deliveries.

Examples:
```
[MyApp] Forgot Password
[MyApp STAGING] Forgot Password
```

[Based upon this coderwall protip](https://coderwall.com/p/qtsxug/prefix-all-emails-with-application-name-and-rails-env)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "neeto-email-prefixer", github: "bigbinary/neeto-email-prefixer", branch: "stable"
```

## Configuration
All NeetoEmailPrefixer configuration can be customized using
a standard Rails config initializer.

```ruby
# config/initializers/neeto-email-prefixer.rb
NeetoEmailPrefixer.configure do |config|
  # custom configuration goes here
end
```

Some of the more common configuration options are listed here.
See the source code and test suite for a full list of options.

#### application_name - Customize Application Name
The application name is automatically inferred from the Rails application class name
and can be overridden via the `application_name` setting.

Example:
```ruby
# config/initializers/neeto_email_prefixer.rb
NeetoEmailPrefixer.configure do |config|
  config.application_name = 'MyApp'
end
```

#### stage_name - Customize Environment Stage Name
The application environment/stage name is automatically
inferred from the running Rails.env and it can be overridden
via the `stage_name` setting.

Example:
```ruby
# config/initializers/neeto_email_prefixer.rb
NeetoEmailPrefixer.configure do |config|
  config.stage_name = 'demo'
end
```

#### builder - Override the prefix format
Want to override the default format for the email prefix? Assign a custom
`proc` to the `builder` setting like so:

Example:
```ruby
# config/initializers/neeto_email_prefixer.rb
NeetoEmailPrefixer.configure do |config|
  config.builder = lambda do
    '**MyEmailPrefix** '
  end
end
```
