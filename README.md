# KrakenD Configuration Builder
### Ruby utility to make your life easier when configuring [KrakenD](https://www.krakend.io/) API gateway

__krakend-config-builder__ provides a simple _plugin system_ to avoid repetition and error-prone cut&paste or cut&paste&edit operation when compiling the krakend.json comfiguration file.

Just write your plugin using the single import for the [plugin-imports.rb](https://github.com/BarcoMasile/krakend-config-builder/blob/master/shared/plugin-imports.rb) file and register it, and that's it, it's now available to use.

### Plugin types
- EndpointPlugin: defining a single krakend _endpoint_ entry
- BackendPlugin: defining a single krakend _backend_ entry
- ExtraConfigPlugin: to define a single krakend _extra_config_ entry (for any scope)

### Plugin Class
Every plugin has at least 2 properties:
- id: the id for the plugin (mandatory)
- extends: the id of the plugin extended by this plugin (optional)

#### EndpointPlugin
Other than the common Plugin Class properties, the setter __:endpoint__ is used to provide a custom [Endpoint](https://github.com/BarcoMasile/krakend-config-builder/blob/master/shared/endpoint.rb) to be injected in the config file.

#### BackendPlugin
The __:backend__ setter is used to inject an instance of [Backend](https://github.com/BarcoMasile/krakend-config-builder/blob/master/shared/backend.rb)

#### ExtraConfigPlugin
This plugin is a little different and is used to provide a key and a json object to populate the "extra_config" object at any scope in the krakend config file. Check out [this](https://github.com/BarcoMasile/krakend-config-builder/blob/master/plugins/arpa-jwt-validator-plugin.rb) example.

### Register your plugin
To register your newly implemented plugin you just need to call
```ruby
KrakendConfigPlugins.register(your_plugin_instance)
```

### Extending an existing plugin
You can extend an existing plugin by specifying the properties you want to diverge from the original just by implementing a new plugin with the properties you want to override and then set the __:extends__ property to the _id_ of the plugin you want to inherit from.
Check out [this example](https://github.com/BarcoMasile/krakend-config-builder/blob/master/plugins/endpoint-extension-test.rb).


### Roadmap
- allow other config file formats other than json
