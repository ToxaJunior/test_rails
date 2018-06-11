class IpApiService

  def get_countries_ips(params)

    queue = Queue.new
    threads = []
    results = []

    params.each{|address| queue.push address }

    10.times do
      threads << Thread.new do
        until queue.empty?
          address = queue.pop(true) rescue nil
          if address
            res = JSON.parse(open("http://ip-api.com/json/#{address}").read)
            if res['status'] == 'fail'
              nil
            else
              results << { ip: res['query'], country: res['country'] }
            end
          end
        end
      end
    end

    threads.each(&:join)
    results
  end
end