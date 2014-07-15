module GithubSshKeysFor
  class PrintKeys
    def initialize(keys)
      @keys = keys
    end

    def execute
      puts keys.join("\n")
    end

    private

    attr_reader :keys
  end
end
