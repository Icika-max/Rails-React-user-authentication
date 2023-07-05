class RegistrationsController < ApplicationController
    def create
      user = User.create!(
        email: params["email"],
        password: params["password"],
        password_confirmation: params["registration"]["password_confirmation"]
      )
      if user
        session[:user_id] = user.id
        render json: {
          status: :created,
          user: user
        }
      else
        render json: { status: 500 }
      end
    end
  
    def index
      users = User.all
      render json: {
        status: :ok,
        users: users
      }
    end
  end
  