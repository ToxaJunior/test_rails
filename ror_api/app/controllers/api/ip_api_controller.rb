class Api::IpApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_countries
    addresses = IpApiService.new.get_countries_ips(params[:addresses])

    # there is caching for example, but in this case it doesn't make sense,
    # because i don't save or attach to response key of cache
    key = SecureRandom.urlsafe_base64
    Rails.cache.fetch(key, expires_in: 12.hours) {addresses}

    render json: addresses.compact
  end
end
