require 'resque/smtp'

module Resque::SMTP

  class Railtie < Rails::Railtie
    initializer "resque-smtp.action_mailer" do

      ActiveSupport.on_load(:action_mailer) do

        ActionMailer::Base.add_delivery_method :resque_smtp, Resque::SMTP::DeliveryMethod

        Resque::SMTP.smtp_settings = ActionMailer::Base.smtp_settings

      end

    end
  end

end
