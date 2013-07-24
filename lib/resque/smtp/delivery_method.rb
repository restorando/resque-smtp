require 'resque/smtp'
require 'resque'

module Resque::SMTP

  # Enqueues emails in Resque.
  #
  # Just set action_mailer delivery method to :resque_smtp and all
  # emails will be enqueued.
  #
  # Delivery settings are not used as they are extracted from RCore.config
  # at the moment emails are really delivered.
  #
  # If you want to have dedicated settings for this method you can set
  # config.action_mailer.smtp_resque_settings in the application config.
  #
  class DeliveryMethod

    def initialize(settings)
      @settings = settings
      EmailJob.queue = settings[:queue] if settings[:queue]
    end

    def deliver!(mail)
      # Enqueue email dumped as string
      Resque.enqueue(EmailJob, mail.encoded)
    end

  end
end
