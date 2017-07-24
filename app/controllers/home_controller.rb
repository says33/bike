class HomeController < ApplicationController

    def index
        respond_to do |format|
            format.html { redirect_to welcome_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

end
