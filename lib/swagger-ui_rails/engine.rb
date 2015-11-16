module Swagger
  class Engine < ::Rails::Engine

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w{ swagger-ui.js }
      Rails.application.config.assets.paths << root.join("app", "assets")
    end

  end
end
