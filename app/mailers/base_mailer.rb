class BaseMailer < ApplicationMailer
  default from: 'no-reply@pooliticos.com'

  def just_email(delivery, leads)
    @delivery = delivery

    mail(to: leads.map(&:email), subject: @delivery.title)
  end
end
