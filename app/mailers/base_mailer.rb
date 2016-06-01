class BaseMailer < ApplicationMailer
  def just_email(delivery, leads)
    @delivery = delivery

    mail(to: leads.map(&:email), subject: @delivery.title)
  end
end
