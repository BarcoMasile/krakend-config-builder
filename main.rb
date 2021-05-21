require_relative 'requirements'

KrakendConfigPlugins.init()

$parser.parse!

k = KrakendConfigBuilder.new($args)
k.build
