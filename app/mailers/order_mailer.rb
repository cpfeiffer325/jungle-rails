class OrderMailer < ApplicationMailer 
  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Order Confirmation')
  end
end
