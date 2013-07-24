require_relative 'test_helper'
require 'minitest/mock'

module Resque::SMTP

  describe EmailJob do

    let(:encoded_mail) { "some encoded email" }
    let(:mail) { MiniTest::Mock.new }
    let(:smtp_delivery_method) { MiniTest::Mock.new }

    describe 'running the job' do

      it 'creates a new email with smtp as delivery method and delivers it' do
        Mail.stub(:new, mail) do
          mail.expect(:delivery_method, smtp_delivery_method, [:smtp, Hash])
          mail.expect(:delivery_method, smtp_delivery_method)
          smtp_delivery_method.expect(:deliver!, true, [mail])

          EmailJob.perform("some encoded email")

          smtp_delivery_method.verify
          mail.verify
        end
      end

    end

  end

end

