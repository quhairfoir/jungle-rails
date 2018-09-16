class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(user, order)
    @user = user
    @order = order
    mail(to: @user, subject: "Your Jungle Order: #{@order.id}")
  end
end
