class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find(email: @user.email).any?
      flash[:notice] = "User already exists. Please log in"
    else
      if @user.save
        flash[:notice] = "User successfully created"
      else
        render current_path
      end
    end
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
                                 :notes)
  end
end
