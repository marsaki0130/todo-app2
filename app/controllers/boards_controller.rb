class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def New
        @board = current_user.boards.build
    end
end