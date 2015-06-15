# watir-network-logging
A network logging module for watir-webdriver.

## Usage
Included in `lib` are `proxy_server.rb` and `proxied_browser.rb`, which are presently designed to be used in separate processes. Require `lib/proxy_server.rb` and call `Watir::NetworkLogging::ProxyServer.start(20001)` to start a proxy server on port 20001; this will output all traffic to stdout in JSON format, with each new request/response separated by a string "REQ_RES_SEPARATOR".

Require `lib/proxied_browser.rb` and spawn a browser with `browser = Watir::NetworkLogging::ProxiedBrowser.new(20001)`. This browser works exactly like a normal browser driven by watir-webdriver, except it's configured to use as a proxy `localhost:20001`.

## TODO
Currently traffic is output to stdout in JSON format. This is unwieldy and will be changed in the future to write traffic to a database instead.

Additionally, starting two separate processes for proxy server and browser is undesirable. This will be changed to use one process with separate threads at some point.
