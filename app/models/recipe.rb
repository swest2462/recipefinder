class Recipe < ActiveRecord::Base
  include HTTParty
  key_value = ENV['FOOD2FORK_KEY'] || '1805e728325047a23755b19d8114fe1d'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  base_uri "http://food2fork.com/api"
  default_params key: key_value
  format :json

  def self.for term
    get("/search", query: {q: term})["recipes"]
  end
end