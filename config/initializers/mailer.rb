if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => Rails.application.secrets.smtp_address,
    :port           => '587',
    :authentication => :plain,
    :user_name      => Rails.application.secrets.smtp_username,
    :password       => Rails.application.secrets.smtp_password,
    :domain         => Rails.application.secrets.smtp_domain,
  }

  ActionMailer::Base.default_url_options = { host: Rails.application.secrets.mailer_host }
end
