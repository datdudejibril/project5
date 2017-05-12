class ReplyTweetsController < ApplicationController

  def index
    # grab all tweets
    @searches = Search.where(replied: [false, nil]).all
    # puts @searches
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "qAdOydT3JrhsQbQSKvf69TV6P"
      config.consumer_secret     = "XEZGASLs9lQ9J5IgzWqFoNpoUaifv1PqNxJQM8FHjPSXdkewZW"
      config.access_token        = "105933959-rvPjo0oPEKfPXk5kP1d1v94Jdxp7ykvFMpqu2Sj0"
      config.access_token_secret = "AnrbAqcTze22tc2t0VrWFSdzg89RS5emrz9QvBC37nm3V"
    end
    @searches.each do |search|
      search_tweets(search.search_text,client)
    end

  end

  def search_tweets(text,client)
    puts text
    client.search(text, result_type: "recent").take(3).each do |tweet|
      puts tweet.text
      puts " Twitter Id: #{tweet.id}"
    end
  end
end
