require 'open-uri'
require 'json'

module GithubSshKeysFor
  class GetKeys
    def initialize(username)
      @username = username
    end

    def execute
      json_response.map { |i| i["key"] }
    end

    private

    attr_reader :username

    def uri
      "https://api.github.com/users/#{username}/keys"
    end

    def response
      OpenURI::open_uri(uri).read
    end

    def json_response
      JSON.parse(response)
    end
  end
end
