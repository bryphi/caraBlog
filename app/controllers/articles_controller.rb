class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy] 
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
   
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end 
    
    def new 
        @article = Article.new 
    end 
    
    def edit
        
    end 
    
    
    def update
        
        if @article.update(article_params)
            flash[:success] = "Post was successfully updated!"
            redirect_to article_path(@article)
        else 
            render 'edit'
        end 
    end 
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
           flash[:success] = "Post was successfully created!" 
           redirect_to article_path(@article)
        else
            render 'new'
        end 
    end 
    
    def show
        
    end 
    
    def searchPage
       
    end
    
    
    def destroy
        
        @article.destroy
        flash[:danger] = "Post was deleted!"
        redirect_to articles_path 
    end 
    
    def search
        @articles = Article.search(params[:search_param])
        
        if @articles
            render partial: 'lookup'
        else
            render status: :not_found, nothing: true
        end
    end 
    
    private
        def set_article
          @article = Article.find(params[:id])  
        end
        
        def require_same_user
            if current_user != @article.user and !current_user.admin?
                flash[:danger] = "You can only edit or delete your own posts."
                redirect_to root_path
            end
        end 
        
        def article_params
                params.require(:article).permit(:title, :description, :date, :tags)
        end 
    
end 