class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(current_user, order)
    @user = current_user
    @order = order
    mail(to: @user.email, subject: "Your Jungle Order: #{@order.id}")
  end
end
