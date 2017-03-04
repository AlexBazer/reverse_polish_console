#!/usr/bin/env ruby
require 'json'
require 'uri'
require 'net/http'


def main()
    num, expressions = parse_expressions

    to_send = {"expressions" => expressions}
    response = make_request(to_send)

    if response.code == '200'
        data = JSON.parse(response.body)
        data['results'].each do |result|
            print "#{ result['result']} #{ result['time']} \n"
        end
    elsif response.code == '400'
        data = JSON.parse(response.body)
        print data['msg'] + "\n"
    else
        print "You have error in you stdin data\n"
    end
end


def parse_expressions()
    num = 0
    expressions = []
    lines = ARGF.readlines
    lines.each_index do |i|
        striped = lines[i].delete("\n")
        if i == 0
            num = Integer(striped)
        else
            if striped.length > 0
                expressions.push(striped)
            end
        end
    end
    return num, expressions

end

def make_request(data)
    uri = URI.parse("http://127.0.0.1:8000/")
    header = {'Content-Type' => 'application/json'}
    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = data.to_json

    # Send the request
    response = http.request(request)
    return response
end

if __FILE__ == $0
    main
end
