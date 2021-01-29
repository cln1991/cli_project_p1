# frozen_string_literal: true

require_relative "./yugis_card_shop/version"
require_relative "./yugis_card_shop/cli"
require_relative "./yugis_card_shop/card"
require_relative "./yugis_card_shop/yugi-api"

require 'open-uri'
require 'net/http'
require 'cgi'
require 'json'
require "pry"