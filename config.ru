#Files that use Rack have the .ru extension because they're normally loaded up with a command called rackup
require 'rack'
require 'pry'

class App
    def call(env)
        #binding.pry
        path = env["PATH_INFO"]

        if path == "/"
            # returns [status code, headers hash, response body]
            [200, {"Content-Type" => "text/html"}, ["<h2>Hello <em>YOU</em>!</h2>"]]
        elsif path == "/potato"
            [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
        else
            [404, { "Content-Type" => "text/html" }, ["Page not found"]]
        end

    end
end

run App.new