require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cloudsdale < OmniAuth::Strategies::OAuth2

      option :name, :cloudsdale

      option :client_options, {
        :site =>          "https://www.cloudsdale.org/",
        :authorize_url => "https://www.cloudsdale.org/oauth/authorize",
        :token_url =>     "https://www.cloudsdale.org/oauth/token"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get("https://api.cloudsdale.org/v1/me.json").parsed
      end
    end
  end
end
