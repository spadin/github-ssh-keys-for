require 'github_ssh_keys_for/print_keys'

module GithubSshKeysFor
  describe PrintKeys do
    it 'prints the items in the array one line a time' do
      keys = ['ssh_key key_1', 'ssh_key key_2']
      expect { described_class.new(keys).execute }.to output("ssh_key key_1\nssh_key key_2\n").to_stdout
    end
  end
end
