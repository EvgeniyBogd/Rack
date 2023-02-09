require_relative 'format'

class App

  def call (env)
   @req = Rack::Request.new(env)
   @res = Rack::Response.new

   app_start(Format.new(@req.params["format"]))
   
  end  

  private

    def app_start(params)
      if params.success?
        send_response(200, "#{params.result}\n")
      else
        send_response(400, "Unknown time format #{params.unknown_formats}\n")
      end
    end  
    
    def send_response(status, body)
      @res.status = status
      @res.write "#{body}"
      @res.finish
    end  
end
