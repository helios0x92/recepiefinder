ENV['FOOD2FORK_KEY'] = 'e6da08f8d77e4779dfc31024ed37490f'

class Recipe < ActiveRecord::Base
  include HTTParty

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for term
    get('/search', query: {q: term})['recipes']
  end

end
