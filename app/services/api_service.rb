class ApiService
  def courses(search_params)
    HTTParty.get('https://content.osu.edu/v2/classes/search', query: search_params)
  end
end
