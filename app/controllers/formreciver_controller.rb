class FormreciverController < ApplicationController
  def new
    @user = User.new
    @address = Address.new
  end

  def create
    puts params
    @user = User.new
    @address = Address.new
    
    @user.name = params['name']
    @user.email = params['email']
    if @user.save
      @address.user_id = @user.id
      @address.city = params['city']
      @address.street_name = params['street_name']
      @address.street_name_number = params['street_name_number']
      if @address.save
        head 201
      else
        render :new, notice: 'wrong address'
      end
    else
      render :new, notice: 'wrong user data'
    end
  end
end
