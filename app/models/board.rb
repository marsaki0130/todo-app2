class Board < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :user
    has_many :tasks, dependent: :destroy
end
