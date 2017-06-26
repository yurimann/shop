class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @order = current_order
    user = User.find_by(email: @user.email)
    @order_items = @order.order_items
    # if user
    #   user.destroy
    # end
    if @user.save
      flash[:notice] = "User successfully created"
    else
      render current_path
    end
    byebug
    UserMailer.order_email(@user, @order_items).deliver_now
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :apartment_number,
                                 :street,
                                 :city,
                                 :postal_code,
                                 :delivery_street,
                                 :delivery_city,
                                 :delivery_postal_code,
                                 :phone,
                                 :email,
                                 :contact,
                                 :contact_number,
                                 :notes,
                                 :delivery_apartment_number)
  end
end
