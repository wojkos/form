class FormreciverController < ApplicationController
  def new
    @user = User.new
    @address = Address.new
  end

  def create
    @user = User.new
    @address = Address.new

    @user.name = params['name']
    @user.email = params['email']
    ActiveRecord::Base.transaction do
      if @user.save
        @address.user_id = @user.id
        @address.city = params['city']
        @address.street_name = params['street_name']
        @address.street_name_number = params['street_name_number']
        if @address.save
          redirect_to users_path, notice: 'Form was successfully created.'
        else
          render :new
          raise ActiveRecord::Rollback
        end
      else
        render :new
      end
    end
  end
end
