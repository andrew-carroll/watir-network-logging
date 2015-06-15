require 'watir-webdriver'

module Watir::NetworkLogging
  class ProxiedBrowser < Watir::Browser
    def initialize(port)
      proxy_address = "localhost:#{port}"
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.proxy = Selenium::WebDriver::Proxy.new(
        http: proxy_address,
        ftp: proxy_address,
        ssl: proxy_address
      )
      super :firefox, profile: profile
    end
  end
end
