class Api::IpApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_countries
    threads = []
    results = []

    params[:addresses].each do |address|
      threads << Thread.new do
        res = JSON.parse(open("http://ip-api.com/json/#{address}").read)
        if res['status'] == 'fail'
          nil
        else
          results << { ip: res['query'], country: res['country'] }
        end
      end
    end

    threads.each(&:join)

    # there is caching for example, but in this case it doesn't make sense,
    # because i don't save or attach to response key of cache
    key = SecureRandom.urlsafe_base64
    Rails.cache.fetch(key, expires_in: 12.hours) {results}

    render :json => results.compact
  end
end