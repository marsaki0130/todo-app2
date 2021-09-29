class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def show
    end

    def new
        @board = current_user.boards.build
    end

    def create
        @board = Board.new(board_params)
    end


    private
    def board_params
        params.require(:board).permit(:name, :description) 
    end
end