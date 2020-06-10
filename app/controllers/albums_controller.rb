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

    def edit
        @album = Album.find(params[:id])
    end

    def create
        @album = Album.new(album_params)
 
        if @album.save
        redirect_to @album
        else 
            render 'new'
        end
    end

    def update
        @album = Album.find(params[:id])
       
        if @album.update(album_params)
          redirect_to @album
        else
          render 'edit'
        end
      end

    private
        def album_params
        params.require(:album).permit(:artist, :album_title, :year_released, :genre)
  end
end
