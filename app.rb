require_relative 'format'

class App

  def call (env)
   @req = Rack::Request.new(env)
   @res = Rack::Response.new

    if @req.path_info == "/time"
      app_start(Format.new(@req.params["format"]))
    else
      send_response(404, "Unknown resource")
    end 
  end  

  private

    def app_start(params)
      if params.unknown_formats.empty?
        send_response(200, "#{params.result}\n")
      else
        send_response(400, "Unknown time format #{params.unknown_formats}\n")
      end
    end  
    
    def send_response(status, body)
      @res.status = status
      @res.write "#{body}"
      @res.headers['Content-Type'] = 'text/plain'
      @res.finish
    end  
end