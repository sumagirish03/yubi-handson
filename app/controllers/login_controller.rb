require 'bcrypt'

class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render html: "index"
    end
    def create
        usr = User.find_by('email': params[:email])
        if (usr.nil?)
            render json: "User account does not exist"
        else
            if(usr.authenticate(param[:password]))
                session[:current_user_id] = usr.id

                render json: "logged in successfully"
            else
                render json: "invalid password"
            end
            
        end
    end
end
def destroy{
    # session.delete(:current_user_id)
    render json : "Logged of successfully"