class TasksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
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
        @comments = @task.comments
    end

    def edit
        @task = Task.find(params[:board_id])
        @board = @task.board
    end

    def update
        @task = Task.find(params[:board_id])
        @board = @task.board
        if @task.update(task_params)
            redirect_to board_path(@board.id), notice: '更新できました'
        else
            flash.now[:error] = '失敗しました'
            render :edit
        end
    end

    def destroy
        task = Task.find(params[:id])
        @board = task.board
        task.destroy!
        redirect_to root_path, notice: '削除に成功しました'
    end


    private
    def task_params
        params.require(:task).permit(:title, :content, :eyecatch, :deadline)
    end
end