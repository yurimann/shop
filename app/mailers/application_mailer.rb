class ApplicationMailer < ActionMailer::Base
  default from: 'bitmakersandbox@gmail.com'
  layout 'mailer'

  def order_email(user, order)
   @user = user
   @order = order
   mail(to: @user.email, bcc: "bitmakersandbox@gmail.com", subject: 'Thank you for ordering')

 end

end
