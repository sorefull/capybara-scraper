#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require "capybara"
require "capybara/dsl"
require "capybara-webkit"
require "pry"

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://www.google.com/"

module Test
  class Google
    include Capybara::DSL

    def get_results
      visit('/')
      fill_in "q", :with => "Capybara"
      click_button "Google Search"
#      binding.pry
      all(:xpath, "//li[@class='g']/h3/a").each { |a| puts a[:href] }

    end
  end
end

spider = Test::Google.new
spider.get_results
