class ApiService
  include HTTParty
  base uri('https://content.osu.edu/v2')

  def courses(search_params)
    self.class.get('/classes/search', query: search_params)
  end
end
