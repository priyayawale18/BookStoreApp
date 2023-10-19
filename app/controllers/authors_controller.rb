class AuthorsController < ApplicationController
  
  def new
		@author =Author.new
	end	

	def create
    	@author = Author.new(author_params)
        if @author.save
    		 flash[:success] = "Author Added Successfully"
        	 redirect_to authors_path
    	else
    		render 'new'
        
    	end	
    end

    private

    def author_params
    	params.require(:author).permit(:first_name, :last_name, :date_of_birth)
    end

end
