class ApiService
  base uri('https://content.osu.edu/v2')

  def courses(search_params)
    HTTParty.get('/classes/search', query: search_params)
  end
end
