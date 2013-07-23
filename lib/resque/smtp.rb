require "resque/smtp/version"

module Resque
  module SMTP
    autoload :EmailJob,       "resque/smtp/email_job"
    autoload :DeliveryMethod, "resque/smtp/delivery_method"

    class << self
      attr_accessor :smtp_settings
    end

  end
end

require 'resque/smtp/railtie' if defined? Rails
