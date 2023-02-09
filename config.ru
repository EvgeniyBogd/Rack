require_relative 'app'
use Rack::ContentType, "text/plain"


ROUTES = {
  '/time' => App.new
}

run Rack::URLMap.new(ROUTES)
