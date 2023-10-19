class AuthorsController < ApplicationController

	def index
		@author = Author.all
    end
  
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

    def edit
		@author = Author.find_by(id: params[:id])
	end


	def update
		@author = Author.find_by(id: params[:id])
		if @author.update(author_params)
			flash[:notice] = "Book Updated successful!"
			redirect_to authors_path
		else
          render 'edit'
	  end
	end   

	def show
	   @author = Author.find(params[:id])
	end

	def destroy
		@author = Author.find(params[:id])
		@author.destroy
		redirect_to authors_path	
	end

    private

    def author_params
    	params.require(:author).permit(:first_name, :last_name, :date_of_birth)
    end

end
