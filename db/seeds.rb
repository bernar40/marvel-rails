# frozen_string_literal: true

Comic.destroy_all

require 'open-uri'
require 'json'
require 'digest/md5'

timestamp = 1.to_s
digest = Digest::MD5.hexdigest(timestamp + ENV['MARVEL_PRIVATE_KEY'] + ENV['MARVEL_PUBLIC_KEY'])

@base_url = 'https://gateway.marvel.com:443/v1/public/'
@authorization = "ts=#{timestamp}&apikey=#{ENV['MARVEL_PUBLIC_KEY']}&hash=#{digest}"

def marvel_fetch(url)
  HTTParty.get(url)['data']['results']
end

# Populate the Comic database
require_relative 'comics_seed'
require_relative 'characters_seed'
require_relative 'character_comics_seed'
