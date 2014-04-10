class UsersController < ApplicationController

	def new
		@user = User.new
	end	

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user, 
						:notice => 'Cadastro criado com sucesso!'
		else
			render :new
		end						
	end	

	def show
		@user = User.find(id_params)
	end

	def edit
		@user = User.find(id_params)
	end	

	def update
		@user = User.find(id_params)

		if @user.update(user_params)
			redirect_to @user, 
						:notice => 'Cadastro atualizado com sucesso!'
		else
			render :update
		end		
	end	

	private 

	def user_params
		params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :bio, :location)
	end	

	 def id_params
       params.require(:id)
     end

end	