require 'github_ssh_keys_for/get_keys'

module GithubSshKeysFor
  describe GetKeys do
    context 'opening a network connection' do
      it 'attempts to get the file at https://api.github.com/users/spadin/keys' do
        expect_any_instance_of(described_class).to receive(:open_uri).and_return("{}")
        described_class.new("spadin").execute
      end
    end

    context 'network connections mocked' do
      let(:key_1) { "ssh-rsa key-1"}
      let(:key_2) { "ssh-rsa key-2"}
      let(:key_3) { "ssh-rsa key-3"}
      let(:json) {[
        {
          "id"  => 00001,
          "key" => key_1
        },
        {
          "id"  => 00002,
          "key" => key_2
        },
        {
          "id"  => 00003,
          "key" => key_3
        }
      ]}

      it 'returns an array with the ssh keys only' do
        allow_any_instance_of(described_class)
          .to receive(:open_json_uri).and_return(json)

        execute = described_class.new("spadin").execute

        expect(execute).to include(key_1, key_2, key_3)
      end

    end
  end
end
