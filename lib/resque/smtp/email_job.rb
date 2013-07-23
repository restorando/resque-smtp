require 'resque/smtp'
require 'mail'

module Resque::SMTP
  # Class for sending emails enqueued in Resque.
  #
  # If you want to enqueue emails to be delivered later by this class
  # you can do:
  #
  #   mail = Mail.new(to: 'cosme@example.com')
  #   Resque.enqueue(Resque::SMTP::EmailJob, mail.encoded)
  #
  class EmailJob

    class << self
      attr_accessor :queue
    end

    @queue = 'mailing'

    def self.perform(encoded_mail)

      mail = Mail.new(encoded_mail)
      mail.delivery_method :smtp, Resque::SMTP.smtp_settings

      # Send without informing observers and interceptors and bypass
      # checking perform_deliveries and raise_delivery_errors.
      mail.delivery_method.deliver! mail

    end

  end
end
