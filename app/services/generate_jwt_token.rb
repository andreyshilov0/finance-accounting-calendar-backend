class GenerateJwtToken
  def self.generate_token(payload)
    JWT.encode(payload, ENV['HMAC_SECRET'], ENV['HMAC_ALGORITHM'])
  rescue StandardError => e
    Rails.logger.error "Failed to generate JWT token: #{e.message}"
    nil
  end
end
