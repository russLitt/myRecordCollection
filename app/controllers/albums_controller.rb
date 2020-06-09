class AlbumsController < ApplicationController
    def index
        @albums = Album.all
    end

    def show
        @album = Album.find(params[:id])
    end

    def new
        @album = Album.new
    end

    def create
        @album = Album.new(album_params)
 
        if @album.save
        redirect_to @album
        else 
            render 'new'
        end
    end

    private
        def album_params
        params.require(:album).permit(:artist, :album_title, :year_released, :genre)
  end
end
