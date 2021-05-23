require_relative '../shared/plugin-imports'

test = ExtraConfigPlugin.new 'test'
test.extends = 'arpa-jwt-validator'
test.config = { "cache" => false }
test.key = "chiave-completamente-diversa"

KrakendConfigPlugins.register(test)
