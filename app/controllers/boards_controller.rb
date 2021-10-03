class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
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


  private

  def board_params
    params.require(:board).permit(:name, :description)
  end
end