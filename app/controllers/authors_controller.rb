class AuthorsController < ApplicationController
  
  def new
		@author =Author.new
	end	

	def create
    	@author = Author.new(book_params)
        if @auhtor.save
    		 flash[:success] = "Author Added Successfully"
        	 redirect_to authors_path
    	else
    		render 'new'
        
    	end	
    end

end
