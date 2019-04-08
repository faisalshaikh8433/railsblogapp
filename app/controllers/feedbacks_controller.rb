class FeedbacksController < ApplicationController
    
    http_basic_authenticate_with name:'dhh', password:'secret', only: :destroy

    def create
        @article = Article.find(params[:article_id])
        @feedback = @article.feedbacks.create(feedback_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @feedback = @article.feedbacks.find(params[:id])
        @feedback.destroy
        redirect_to article_path(@article)
    end

    private
    def feedback_params
        params.require(:feedback).permit(:username,:body)
    end

end
