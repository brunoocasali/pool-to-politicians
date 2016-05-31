class MailerJob < ProgressJob::Base
  def initialize(delivery, progress_max)
    super progress_max: progress_max

    @delivery = delivery
  end

  def perform
    binding.pry
    @delivery.leads.each do |lead|
      BaseMailer.just_email(@delivery, lead).deliver!

      update_progress
    end
  end
end
