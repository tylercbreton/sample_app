require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = '204a4086c025d89fa0b89731c3603c350092c8d94afbdb0c53a1c26e69456ae1d6d49ec756982cf0b747df8f6ec01b1add97fa3bd336c80763bd86f8daf3fe5b'
