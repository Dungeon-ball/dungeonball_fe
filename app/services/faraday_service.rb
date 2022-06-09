class FaradayService

  def self.get_url(url, params = {})
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params = params
    end
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_url(url, params = {})
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params = params
    end
    response = conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
