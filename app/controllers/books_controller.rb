class BooksController < ApplicationController
	def index
		@book = Book.all
	end
	
	def new
		@book =Book.new
	end	

	def create
    	@book = Book.new(book_params)
        if @book.save
    		 flash[:success] = "Book Added Successfully"
        	 redirect_to books_path
    	else
    		render 'new'
        
    	end	
    end

    def edit
		@book = Book.find_by(id: params[:id])
	end


	def update
		@book = Book.find_by(id: params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book Updated successful!"
			redirect_to books_path
		else
          render 'edit'
	  end
	end   

	def show
	   @book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path	
	end

    private

    def book_params
    	params.require(:book).permit(:book_title, author_ids: [])
    end

end


