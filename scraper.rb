#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require "capybara"
require "capybara/dsl"
require "capybara-webkit"

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://www.foreveryoungapartments.com"

module Test
  class Google
    include Capybara::DSL

    def get_results
      visit('/alquiler/estudio-madrid-ciudad-forever-young-apartments-zurbano-182210.html')
      button = find '#more-rates-button'
      table = find '#rates-table'
      3.times { button.click }
      # table growed catched by #text from table
    end
  end
end

spider = Test::Google.new
spider.get_results
