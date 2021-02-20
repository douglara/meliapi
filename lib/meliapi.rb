# frozen_string_literal: true

require_relative "meliapi/version"
require_relative "meliapi/requests"

class Meliapi
  def initialize(args={})
    @app_key = args[:app_key]
    @app_secret = args[:app_secret]
    @callback_url = args[:callback_url]
    @access_token = args[:access_token]

    if args.key?(:endpoint_url)
      @endpoint_url = args[:endpoint_url]
    else
      @endpoint_url = 'https://api.mercadolibre.com'
    end

    if args.key?(:auth_url)
      @auth_url = args[:auth_url]
    else
      @auth_url = 'https://auth.mercadolibre.com.ar'
    end

    @site = args[:site]

    args.key?(:retry_timeouts_delay) ? @retry_timeouts_delay = args[:retry_timeouts_delay] : @retry_timeouts_delay = 15
    args.key?(:retry_timeouts_limit) ? @retry_timeouts_limit = args[:retry_timeouts_limit] : @retry_timeouts_limit = 5
    args.key?(:retry_timeouts) ? @retry_timeouts = args[:retry_timeouts] : @retry_timeouts = false
  end
end
