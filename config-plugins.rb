
class KrakendConfigPlugins
  @@plugins = {}

  def self.init(folder = 'plugins')
    Dir.glob(folder + '/*.rb').each do |file|
      puts "require " + file
      require "./#{file}"
    end
  end

  def self.register(id:, plugin:)
    @@plugins[plugin.type] ||= {}
    @@plugins[plugin.type][id] = plugin
  end

  def self.get(plugin_type, plugin_id)
    return nil if plugin_id.nil? || plugin_type.nil?
    @@plugins[plugin_type][plugin_id]
  end

  def self.plugins
    @@plugins
  end
end

class Plugin
  def type
    self.class.name.downcase.to_sym
  end

  def build
    Hash.new
  end
end

class EndpointPlugin < Plugin
end

class BackendPlugin < Plugin
end

class ExtraConfigPlugin < Plugin
  attr_accessor :key

  def build_for_service()
    self.key = self.key.gsub('.','_')
    build()
  end
end
