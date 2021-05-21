require_relative '../config-plugins'

arpaJwtValidator = ExtraConfigPlugin.new

KrakendConfigPlugins.register(id: 'arpa-jwt-validator', plugin: arpaJwtValidator)
