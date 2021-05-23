require_relative '../shared/plugin-imports'

my_backend_plugin = BackendPlugin.new 'my-backend'

_be = Backend.new
# :deny, :allow, :group, :mapping
_be.url_pattern = '/api/v1/prova-be'
_be.host = ["http://localhost:8080"]
_be.encoding = 'json'
_be.method = 'GET'
_be.extra_config = ['arpa-jwt-validator']

_be.target = 'data'
_be.deny = ['prova', 'prova2']
_be.allow = ["allow1", "allow2"]
_be.group = "marco-group"
_be.mapping = {
  "mapping1"=> "value1"
}

my_backend_plugin.backend = _be

KrakendConfigPlugins.register(my_backend_plugin)
