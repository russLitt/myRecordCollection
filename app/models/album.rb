class Album < ApplicationRecord
    belongs_to :user
    has_one_attached :album_image
    
    validates :artist, presence: true,
                length: {minimum: 1}
    validates :album_title, presence: true,
                length: {minimum: 1}
    validates :year_released, 
                length: {minimum: 4, maximum: 4}
end
