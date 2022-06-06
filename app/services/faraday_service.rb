class FaradayService

  def self.get_url(url, query = nil)
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params[:query] = query unless query.nil?
    end
    response = conn.get(url)
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
