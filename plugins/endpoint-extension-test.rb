require_relative '../shared/plugin-imports'

_end2 = Endpoint.new
_end2.output_encoding = 'xml'
_end2.method = 'POST'
_end2.backend = ['my-backend-2']
_end2.extra_config = ['test']
_end2.endpoint = '/api/estesa'

mep2 = EndpointPlugin.new 'my-endpoint-2'
mep2.extends = 'my-endpoint'
mep2.endpoint = _end2
KrakendConfigPlugins.register(mep2)
