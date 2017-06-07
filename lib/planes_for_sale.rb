require_relative "planes_for_sale/version"

require "bundler/setup"

require 'nokogiri'
require 'pry'
require_relative './planes_for_sale/cli'
require_relative './planes_for_sale/plane'
require_relative './planes_for_sale/scraper'
