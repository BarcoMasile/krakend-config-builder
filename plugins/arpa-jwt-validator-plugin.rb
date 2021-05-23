require_relative '../shared/plugin-imports'

arpaJwtValidator = ExtraConfigPlugin.new 'arpa-jwt-validator'
arpaJwtValidator.key = "github.com/devopsfaith/krakend-jose/validator"
arpaJwtValidator.config = {
  "alg" => "RS256",
  "cache" => true,
  "cache_duration" => 60 * 30 ,
  "jwk-url" => "https://accessosicuro-trial.rete.toscana.it/auth/realms/arpa/protocol/openid-connect/certs"
}

KrakendConfigPlugins.register(arpaJwtValidator)
