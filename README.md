# KrakenD Configuration Builder
### Ruby utility to make your life easier when configuring [KrakenD](https://www.krakend.io/) API gateway

__krakend-config-builder__ provides a simple _plugin system_ to avoid repetition and error-prone cut&paste or cut&paste&edit operation when compiling the krakend.json comfiguration file.

Just write your plugin using the single import for the [plugin-imports.rb](https://github.com/BarcoMasile/krakend-config-builder/blob/master/shared/plugin-imports.rb) file and register it, and that's it, it's now available to use.

### Plugin types
- EndpointPlugin: defining a single krakend _endpoint_ entry
- BackendPlugin: defining a single krakend _backend_ entry
- ExtraConfigPlugin: to define a single krakend _extra_config_ entry (for any scope).

#### EndpointPlugin

#### BackendPlugin

#### ExtraConfigPlugin

### Writing your plugin
lorem ipsum

### Register your plugin
lorem ipsum

### Extending an existing plugin
lorem ipsum

### TODO
- Test the extension system
