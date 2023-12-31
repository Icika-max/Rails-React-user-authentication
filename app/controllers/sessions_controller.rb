class SessionsController < ApplicationController
    include CurrentUserConcern  
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user
        }
      else
        render json: { status: 401 }
      end
    end
  
    def login
      # Logic for logging in the user
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {
          status: :ok,
          logged_in: true,
          user: user
        }
      else
        render json: {
          status: 401,
          logged_in: false,
          error: "Invalid credentials"
        }
      end
    end
  
    def logged_in
        if @current_user
          render json: {
            logged_in: true,
            user: @current_user
          }
        else
          render json: {
            logged_in: false
          }
        end
      end
      
  
    def logout
      reset_session
      render json: {
        status: 200,
        logged_out: true
      }
    end
  end
  