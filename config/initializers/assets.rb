# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( ie10-viewport-bug-workaround.css )
Rails.application.config.assets.precompile += %w( navbar.css )
Rails.application.config.assets.precompile += %w( ie-emulation-modes-warning.js )
Rails.application.config.assets.precompile += %w( jquery-2.1.4.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( ie10-viewport-bug-workaround.js )
Rails.application.config.assets.precompile += %w( signin.css )
Rails.application.config.assets.precompile += %w( pagination.css )