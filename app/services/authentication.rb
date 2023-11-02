class Authentication
  def self.authenticate_request(token)
    return nil unless token.present?

    split_token = token.split(' ').last
    decoded_token = JWT.decode(split_token, ENV['HMAC_SECRET'], true, { algorithm: ENV['HMAC_ALGORITHM'] })
    
    user_id = decoded_token[0]['user_id'] # предполагая, что вы помещаете id пользователя как 'user_id'
    User.find_by(id: user_id)
  rescue JWT::DecodeError
    nil
  end
end
