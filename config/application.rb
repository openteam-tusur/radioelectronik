require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Radioelectronik
  class Application < Rails::Application
    config.time_zone = 'Novosibirsk'
    config.i18n.default_locale = :ru
    config.active_record.raise_in_transactional_callbacks = true
  end
end
