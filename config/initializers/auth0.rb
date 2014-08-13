Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'W5OqSKypRQRMZChFkHyhXUc1Bd6YxEWj',
    '7a3KzR1g2Tc_jFc7Nh0zD40WvoO3IKXlByFVAcAXx4Ne7JYtCI0lTrZMfn1Mb4ic',
    'dhurls99.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end