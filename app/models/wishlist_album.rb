class WishlistAlbum < ApplicationRecord
    belongs_to :user
    
    validates :artist, presence: true,
                length: {minimum: 1}
    validates :album_title, presence: true,
                length: {minimum: 1}
end
