require 'sinatra/base'
require 'mail'

Mail.defaults do
  delivery_method :smtp, { 
    :address => 'smtp.gmail.com',
    :port => '587',
    :user_name => ENV['GMAIL_SMTP_USER'],
    :password => ENV['GMAIL_SMTP_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

class TheApp < Sinatra::Base

  get '/contact' do
    mail = Mail.new do
      from     'me@mydomain.com'
      to       'me@mydomain.com'
      subject  'Here is the image you wanted'
      body     'Message here'
    end

    mail.deliver!
  end

end

