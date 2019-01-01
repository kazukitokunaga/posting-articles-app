# -*- encoding: utf-8 -*-
# stub: rubocop-rails 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-rails".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Toshimaru".freeze]
  s.date = "2018-07-09"
  s.description = "RuboCop configuration which has the same code style checking as official Ruby on Rails".freeze
  s.email = "me@toshimaru.net".freeze
  s.homepage = "https://github.com/toshimaru/rubocop-rails".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "rubocop-rails is renamed to rubocop-rails_config. To migrate to new gem, install rubocop-rails_config instead of rubocop-rails.\n\ngem \"rubocop-rails_config\"\n\nThen, run update command.\n\n$ bundle exec rails generate rubocop_rails_config:update\n".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "3.0.1".freeze
  s.summary = "RuboCop configuration which has the same code style checking as official Ruby on Rails".freeze

  s.installed_by_version = "3.0.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 0.53"])
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.53"])
      s.add_dependency(%q<railties>.freeze, [">= 3.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.53"])
    s.add_dependency(%q<railties>.freeze, [">= 3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
