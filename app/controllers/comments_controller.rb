class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def new
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to board_task_path(board_id: @task.board_id, id: @task.id), notice:'コメント追加'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end


    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end