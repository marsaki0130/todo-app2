class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar_image
    'default-avatar.png'
  end

  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
