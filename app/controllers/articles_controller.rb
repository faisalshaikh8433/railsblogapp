class ArticlesController < ApplicationController

	require 'date'

	def datefrmt
		d = DateTime.now
		newdate = d.strftime('%d-%m-%Y')
		return newdate
	end
	
	# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article]["title"].inspect
		@article = Article.new(article_params)
		@article.ddiff_date = datefrmt
		if @article.save
			redirect_to @article
     	else
     		render 'new'
     	end	

		# render plain: params[:article].inspect

	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
	  @article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.ddiff_date = datefrmt
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	
	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end


	private
	  	def article_params
	  	  params.require(:article).permit(:title, :body)
	  	end

end
