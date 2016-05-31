class BaseMailer < ApplicationMailer
  default from: 'no-reply@pooliticos.com'

  def just_email(delivery, user)
    @delivery = delivery
    @user = user

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
