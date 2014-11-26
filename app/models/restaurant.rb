class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  extend Enumerize
  enumerize :category, in: ['French', 'Belgian', 'Chinese', 'Italian', 'Japanese']
end
