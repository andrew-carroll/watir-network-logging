require 'webrick/httpproxy'
require 'oj'

# proxy server code heavily inspired by https://web.archive.org/web/20110202071609/http://altentee.com/blogs/2008/httpwatch-a-free-alternative-using-ruby/
module Watir::NetworkLogging
  class ProxyServer < WEBrick::HTTPProxyServer
    def initialize(port)
      options = {
        Port: port,
        AccessLog: [],
        ProxyContentHandler: ->(req, res) do
          require 'pry'; binding.pry
          puts json_output(req, res)
          puts "REQ_RES_SEPARATOR\n"
        end
      }
      super options
    end
    
    def self.start(port)
      server = new(port)
      trap("INT") { server.shutdown }
      server.start
    end
    
    private
    
    def json_output(req, res)
      formatted_output = {
        'request' => {
          'request_line' => req.request_line.chomp,
          'headers' => req.header
        },
        'response' => {
          'headers' => res.header,
          'cookies' => res.cookies,
          'body' => parse_body(res)
        }
      }
      Oj.dump(formatted_output)
    end
    
    def parse_body(res)
      case res.header['content-encoding']
      when 'gzip'
        Zlib::GzipReader.new(StringIO.new(res.body), encoding: 'ASCII-8BIT').read
      when 'deflate'
        Zlib::Inflate.inflate(res.body)
      else
        res.body
      end
    end
  end
end
