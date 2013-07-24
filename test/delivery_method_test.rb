require_relative 'test_helper'
require 'mail'

module Resque::SMTP

  describe DeliveryMethod do

    before do
      @mail = Mail.new do
        from "someone@somewhere.com"
        to   "someone_else@somewhere.com"
        body "Some text"
        delivery_method Resque::SMTP::DeliveryMethod
      end
    end

    describe '#deliver' do
      it 'enqueues a new email job with the encoded mail' do
        @mail.deliver

        assert_queued EmailJob, [@mail.encoded]
      end
    end

  end

end
