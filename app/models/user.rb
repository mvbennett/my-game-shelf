class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # a user can like another user's profile
  acts_as_favoritor
  acts_as_favoritable

  has_many :reviews, dependent: :destroy
  has_many :shelf_games, dependent: :destroy
  has_many :games, through: :shelf_games
  has_one_attached :avatar

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
