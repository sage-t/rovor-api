class AlertMailer < ApplicationMailer
  default from: 'notifications@example.com'  

  def deal_found(alert, deal)
    mail(to: alert.email, subject: 'Deal Found!')
  end

end
