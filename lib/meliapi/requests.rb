# frozen_string_literal: true

require 'faraday'

class Meliapi
  def get_request(action, params={}, headers={})
    headers = make_headers(headers)

    begin
      retries ||= 0
      request = Faraday.get "#{@endpoint_url}/#{action}", params, headers
      return {error: (JSON.parse(request.body) rescue request.body), request: request} if (request.status == 403)
      return {ok: (JSON.parse(request.body) rescue request.body), request: request}
    rescue Exception => e
      if (@retry_timeouts == true && e.response.code != 401)
        sleep(@retry_timeouts_delay)
        retry if (retries += 1) < @retry_timeouts_limit
      end
      return {error: e}
    end
  end

  def post_request(action, params={}, headers={})
    headers = make_headers(headers)

    begin
      retries ||= 0
      request = Faraday.post "#{@endpoint_url}/#{action}", params, headers
      return {error: (JSON.parse(request.body) rescue request.body), request: request} if (request.status == 403)
      return {ok: (JSON.parse(request.body) rescue request.body), request: request}
    rescue Exception => e
      if (@retry_timeouts == true && e.response.code != 401)
        sleep(@retry_timeouts_delay)
        retry if (retries += 1) < @retry_timeouts_limit
      end
      return {error: e}
    end
  end

  def put_request(action, params={}, headers={})
    headers = make_headers(headers)

    begin
      retries ||= 0
      request = Faraday.put "#{@endpoint_url}/#{action}", params, headers
      return {error: (JSON.parse(request.body) rescue request.body), request: request} if (request.status == 403)
      return {ok: (JSON.parse(request.body) rescue request.body), request: request}
    rescue Exception => e
      if (@retry_timeouts == true && e.response.code != 401)
        sleep(@retry_timeouts_delay)
        retry if (retries += 1) < @retry_timeouts_limit
      end
      return {error: e}
    end
  end

  def path_request(action, params={}, headers={})
    headers = make_headers(headers)

    begin
      retries ||= 0
      request = Faraday.patch "#{@endpoint_url}/#{action}", params, headers
      return {error: (JSON.parse(request.body) rescue request.body), request: request} if (request.status == 403)
      return {ok: (JSON.parse(request.body) rescue request.body), request: request}
    rescue Exception => e
      if (@retry_timeouts == true && e.response.code != 401)
        sleep(@retry_timeouts_delay)
        retry if (retries += 1) < @retry_timeouts_limit
      end
      return {error: e}
    end
  end

  def delete_request(action, params={}, headers={})
    headers = make_headers(headers)

    begin
      retries ||= 0
      request = Faraday.delete "#{@endpoint_url}/#{action}", params, headers
      return {error: (JSON.parse(request.body) rescue request.body), request: request} if (request.status == 403)
      return {ok: (JSON.parse(request.body) rescue request.body), request: request}
    rescue Exception => e
      if (@retry_timeouts == true && e.response.code != 401)
        sleep(@retry_timeouts_delay)
        retry if (retries += 1) < @retry_timeouts_limit
      end
      return {error: e}
    end
  end

  private

  def make_headers(headers)
    headers.merge({ 'Authorization': "Bearer #{@access_token}", 'Content-Type': "application/json" })
  end

end
