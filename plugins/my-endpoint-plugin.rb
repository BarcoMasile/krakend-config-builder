require_relative '../shared/plugin-imports'

my_endpoint_plugin = EndpointPlugin.new 'my-endpoint'

_end = Endpoint.new
_end.endpoint = "/be-prova-1"
_end.output_encoding = 'json'
_end.method = 'GET'
_end.headers_to_pass = ['*']
_end.extra_config = ['arpa-jwt-validator']
_end.backend = ['my-backend']

my_endpoint_plugin.endpoint = _end

KrakendConfigPlugins.register(my_endpoint_plugin)
