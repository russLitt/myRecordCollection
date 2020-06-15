class WishlistAlbumsController < ApplicationController
    def index
      @wishlist_albums = WishlistAlbum.all
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
          redirect_to @wishlist_album
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

end
