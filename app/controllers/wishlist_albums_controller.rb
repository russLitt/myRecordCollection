class WishlistAlbumsController < ApplicationController
  helper_method :sort_column, :sort_direction

    def index
      @wishlist_albums = WishlistAlbum.order(sort_column + " " + sort_direction)
    end

    def show
      @wishlist_album = WishlistAlbum.find(params[:id])
    end

    def new
      @wishlist_album = WishlistAlbum.new
    end

    def edit
      @wishlist_album = WishlistAlbum.find(params[:id])
    end

    def create
      @wishlist_album = WishlistAlbum.new(wishlist_album_params)
       
        if @wishlist_album.save
          redirect_to action: 'index'
        else
          render 'new'
        end
    end

    def update
      @wishlist_album = WishlistAlbum.find(params[:id])

      if @wishlist_album.update(wishlist_album_params)
        redirect_to @wishlist_album
      else
        render 'edit'
      end
    end

    def destroy
      @wishlist_album = WishlistAlbum.find(params[:id])
      @wishlist_album.destroy

      redirect_to wishlist_albums_path
    end

    private
    def wishlist_album_params
      params.require(:wishlist_album).permit(:artist, :album_title)
    end

    def sort_column
      Album.column_names.include?(params[:sort]) ? params[:sort] : "artist"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
