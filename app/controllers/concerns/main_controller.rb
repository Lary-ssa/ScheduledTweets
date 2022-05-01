class MainController < ApplicationController
    def index
        flash.now[:notice] = "Logged in sucessfully"
        flash.now[:alert] = "Invalid email or password"
    end
end        