
class KrakendConfigPlugins
  @@plugins = {}

  def self.init(folder = './plugins')
    Dir.glob(folder + '/*.rb').each do |file|
      require_relative "../#{file}"
    end
  end

  def self.register(plugin)
    @@plugins[plugin.type] ||= {}
    @@plugins[plugin.type][plugin.id] = plugin
  end

  def self.get_endpoint(plugin_id)
    self.get(:endpoint, plugin_id)
  end

  def self.get_backend(plugin_id)
    self.get(:backend, plugin_id)
  end

  def self.get_extra_conf(plugin_id)
    self.get(:extraconfig, plugin_id)
  end

  def self.get(plugin_type, plugin_id)
    return nil if plugin_id.nil? || plugin_type.nil?
    @@plugins[plugin_type] ||= {}
    @@plugins[plugin_type][plugin_id]
  end

  def self.plugins
    @@plugins
  end
end

class Plugin
  attr_accessor :id, :extends

  def initialize(id)
    @id = id
    @extends = nil
  end

  def type
    self.class.name.downcase.gsub('plugin','').to_sym
  end

  def build
    Hash.new
  end

  def build_extension
    plugin = KrakendConfigPlugins.get(self.type, @extends) if @extends
    h = plugin.nil? ? {} : plugin.build
    h
  end
end

class ConfigPlugin < Plugin

  def build_extra_config(wrapper)
    (wrapper.extra_config || []).inject({}) do |dict, plugin_id|
      plugin = KrakendConfigPlugins.get_extra_conf(plugin_id)
      dict = dict.merge plugin.build
      dict
    end
  end
end

class EndpointPlugin < ConfigPlugin
  attr_accessor :endpoint

  def build
    h = @endpoint.to_hash
    h[:backend] = build_backends(@endpoint)
    h[:extra_config] = build_extra_config(@endpoint)

    ext = build_extension()

    if h[:backend].empty?
      h.delete(:backend)
    end

    if h[:extra_config].empty?
      h.delete(:extra_config)
    end

    ext.merge h
  end

  private

  def build_backends(wrapper)
    (wrapper.backend || [])
      .map {|plugin_name| KrakendConfigPlugins.get_backend plugin_name }
      .map {|plugin| plugin.build }
  end


end

class BackendPlugin < ConfigPlugin
  attr_accessor :backend

  def build
    h = @backend.to_hash
    h[:extra_config] = build_extra_config(@backend)
    ext = build_extension()

    if h[:extra_config].empty?
      h.delete(:extra_config)
    end

    ext.merge h
  end
end

class ExtraConfigPlugin < Plugin
  attr_accessor :key, :config

  def build_for_service()
    self.key = self.key.gsub('.','_')
    build()
  end

  def build
    h = Hash.new
    config = @config

    ext = build_extension()
    value = ext.values.first
    config = value.merge config if value

    h[@key] = config
    h
  end
end
