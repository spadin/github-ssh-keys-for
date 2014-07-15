require 'open-uri'
require 'json'

module GithubSshKeysFor
  class GetKeys
    def initialize(username)
      @username = username
    end

    def execute
      response = open_json_uri(uri)
      response.map do |item|
        item["key"]
      end
    end

    private

    attr_reader :username

    def uri
      "https://api.github.com/users/#{username}/keys"
    end

    def open_uri(uri)
      OpenURI::open_uri(uri).read
    end

    def open_json_uri(uri)
      response = open_uri(uri)
      JSON.parse(response)
    end
  end
end
