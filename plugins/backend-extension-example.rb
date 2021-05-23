require_relative '../shared/plugin-imports'

_be2 = Backend.new
_be2.method = 'POST'

my_backend_plugin2 = BackendPlugin.new 'my-backend-2'
my_backend_plugin2.extends = 'my-backend'
my_backend_plugin2.backend = _be2

KrakendConfigPlugins.register(my_backend_plugin2)
