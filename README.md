# Resque::SMTP

This gem allows you to do the mail delivery inside a Resque job.

What's the difference with other gems that send the email in Resque jobs?

The other gems aim to render and deliver the mail inside the job. Resque::SMTP only handles the deliver, this allows you to have workers that don't have all your dependencies (eg. Rails mailers), but can be retried if your mail provider fails.

## Installation

Add this line to your application's Gemfile:

    gem 'resque-smtp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-smtp

## Usage

### Rails users

1. Configure wich mails you want to use resque-smtp.
   This can be done to all your emails with in your `application.rb` (or in a per environment basis)

   ```ruby
   config.action_mailer.delivery_method = :resque_smtp
   ```

2. The default Resque queue name is: `mailing`, this can be changed with:

   ```ruby
   config.action_mailer.resque_smtp_settings = { queue: "default" }
   ```

3. Done!

resque-smtp will use the `action_mailer.smtp_settings` to send the mails in the queue.

### Mail gem users

1. Configure your smtp settings in `Resque::SMTP.smtp_settings`
   eg.

    ```ruby
    Resque::SMTP.smtp_settings = { :address              => "smtp.me.com",
                                   :port                 => 587,
                                   :domain               => 'your.host.name',
                                   :user_name            => '<username>',
                                   :password             => '<password>',
                                   :authentication       => 'plain',
                                   :enable_starttls_auto => true  }
    ```
2. Configure Mail defaults to use Resque::SMTP (the queue parameter is optional, it defaults
   to `"mailing"`)
  eg.

    ```ruby
    Mail.defaults do
      delivery_method Resque::SMTP::DeliveryMethod, queue: "default"
    end
    ```

3. Done!

## TODO

* Write some tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
