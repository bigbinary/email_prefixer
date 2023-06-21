# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in neeto-email-prefixer.gemspec
gemspec

group :development, :test do
  gem "rubocop"

  gem "byebug"

  source "https://O6Ts9-SVDaUZpHMRs2CpJp22RwbETDE@gems.neeto.com" do

    # neeto-commons-backend gem for methods and modules that are used across all neeto products.
    gem "neeto-commons-backend"

    # For neeto audit
    gem "neeto-compliance"
  end
end

# adds unique constraints to sidekiq jobs
gem "sidekiq-unique-jobs"
