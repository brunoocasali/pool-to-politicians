class MailerJob < Struct.new(:content_id, :leads)
  def perform
    BaseMailer.just_email(DeliveryContent.find(content_id), leads).deliver!
  end
end
