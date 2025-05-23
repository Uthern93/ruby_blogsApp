class CommentController < ApplicationController

    def create 
        @blog = Blog.find_by(id: params[:id])
        @comment = @blog.comments.build(comment_params) 
        @comment.user = Current.user

        if @comment.save
            redirect_to "/blogs/#{@blog.id}", notice: "Comment added!"
        else
            redirect_to "/blogs/#{@blog.id}", alert: "Failed to add comment."
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
      
        if @comment&.destroy
          redirect_to "/blogs/#{@comment.blog.id}", notice: "Comment deleted"
        else
          redirect_to "/blogs/#{@comment.blog.id}", alert: "Failed to remove the comment"
        end
    end

    private

    def comment_params
    params.require(:comment).permit(:content)
    end

end
