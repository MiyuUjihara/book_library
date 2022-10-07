require "omniauth"
require "omniauth-google-oauth2/version"
require "omniauth/strategies/google_oauth2"

module OmniAuth
  module Strategies
    autoload :GoogleOauth2,  'omniauth/strategies/google_oauth2'
  end
end