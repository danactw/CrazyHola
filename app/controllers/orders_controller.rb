class OrdersController < ApplicationController
  before_action :authenticate!
  def create
    # render html:params
    @course = Course.find(params[:course_id])

    # 以課程購買
    @order = @course.orders.build(order_params)
    @order = @course.prepare_order(order_params)

    if @order.save
      # 刷卡
      gateway = Braintree::Gateway.new(
        :environment => :sandbox,
        :merchant_id => 'v2226jhc6xqf4jss',
        :public_key => '6k96p6cxwpdbg67y',
        :private_key => '24f7c9159027fa7ef57c3290ec22fde2',
      )

      result = gateway.transaction.sale(
        :amount => @order.amount,
        :payment_method_nonce => params[:nonce]
      )

      if result.success?
        redirect_to root_path, notice: "課程購買成功"
      else
        redirect_to root_path, notice: '付款過程發生問題'
      end
    else

    end
    
    # 以使用者購買
    # @order = current_user.orders.build(order_params)
    # @order.course = @course
  end


  private
  def order_params
    params.require(:order).permit(:recipient, :address).merge(user: current_user)
  end
end
