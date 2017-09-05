class ContentsController < ApplicationController
    before_action :set_content, only: [:edit,:update,:show,:like]
    before_action :require_user, except: [:show,:index]
    before_action :require_same_user, only: [:edit,:update]
	def index
        

		@contents = Content.paginate(page: params[:page], per_page: 5)
       
	end
	def show
		    
	end

	def new
		@content = Content.new
	end
	def create
    @content = Content.new(content_params)
    @content.user = current_user

    if @content.save
    	flash[:success]="succesfully posted"
    	redirect_to contents_path 
    else
    	render :new
	end
    end
    def edit
    	
    end
    def update
    	
    	if @content.update(content_params)
    		flash[:success]="content is updated"
    		redirect_to content_path(@content)
    	else
    		render :edit
    end
end
 def like
   
   like = Like.create(like: params[:like], user: current_user, content: @content)
   if like.valid?
   flash[:success] = "your selection was succesfull"
   redirect_back fallback_location: content_path(@content)
 else
    flash[:danger] = "you can only like or dislike once"
    redirect_back fallback_location: content_path(@content)
 end
end

	private
		def content_params
			params.require(:content).permit(:name,:summary,:description,:picture)
		end

    def set_content
        @content = Content.find(params[:id])
    end
    def require_same_user
        if current_user != @content.user
            flash[:danger]= "you can only edit your own content"
            redirect_to contents_path
    end
    end

end