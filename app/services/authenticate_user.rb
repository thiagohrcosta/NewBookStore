class AuthenticateUser
  def self.call(email:, password:)
    user = User.find_for_database_authentication(email: email)
    return nil unless user&.valid_password?(password)

    user
  end
end