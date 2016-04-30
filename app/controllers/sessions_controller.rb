class SessionsController < ApplicationController
    
    def new 
        
    end 
    
    def create
        user = User.find_by(username: params[:session] [:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
           flash[:success] = "You are now logged in." 
           redirect_to articles_path
        else 
            flash.now[:danger] = "Your username and/or password were incorrect."
            render 'new'
        end 
    end 
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have been logged out."
        redirect_to root_path
    end 

end