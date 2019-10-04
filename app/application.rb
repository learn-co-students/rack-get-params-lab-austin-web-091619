class Application

  @@cart = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/)
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/cart/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Your cart is empty"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@cart.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
