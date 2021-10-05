class BoardsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end


  def show
    @board = Board.find(params[:id])
    # /boards/:id(.:format)
  end

  def edit
    # /boards/:id/edit(.:format)
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice:'更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice:'削除できました'
  end


  private

  def board_params
    params.require(:board).permit(:name, :description, :eyecatch)
  end
end