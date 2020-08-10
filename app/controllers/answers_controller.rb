class AnswersController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @answer = Answer.new
    @answer.image.attach(params[:answer][:image])
    
    if @answer.update(answer_params)
      flash[:success] = "Answer created!"
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])  
    @answer=@post.answers.find(params[:id])
    @answer.destroy
    
    flash[:success] = "Answer deleted"
    redirect_to request.referrer || post_answer_url
  end
  
  private

  def answer_params
    params.require(:answer).permit(:name,:comment,:image,:post_id)
  end
end
