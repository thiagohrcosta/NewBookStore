config.jwt do |jwt|
  jwt.secret = Rails.application.credentials.devise_jwt_secret_key || ENV['DEVISE_JWT_SECRET_KEY']

  jwt.dispatch_requests = [
    ['POST', %r{^/api/login$}]
  ]

  jwt.revocation_requests = [
    ['DELETE', %r{^/api/logout$}]
  ]

  jwt.expiration_time = 1.day.to_i
end
