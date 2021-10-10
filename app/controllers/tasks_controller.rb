class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
        @task.user_id = current_user.id
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to board_path(board), notice: 'タスクを追加'
        else
            flash.now[:eroor] = '更新できませんでした'
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
        @board = @task.board
        # @task.user_id = current_user.id
    end


    private
    def task_params
        params.require(:task).permit(:title, :content, :eyecatch, :deadline)
    end
end