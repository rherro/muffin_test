class Muffin
  HEADERS = {:content_type => :json}

  def initialize(server = 'localhost:8080')
    @server = server
    @url = "http://#{server}/muffins"
  end

  def create(type, owner, purchaser)
    RestClient.post(@url, body(type, owner, purchaser), HEADERS)
  end

  def running?
    RestClient.get("http://#{@server}").code == 200
  end

  def body(type, owner, purchaser)
    "{\"muffins\":{\"type\":\"#{type}\",\"owner\":\"#{owner}\",\"purchaser\":\"#{purchaser}\"}}"
  end

end