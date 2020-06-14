class AlbumsController < ApplicationController
  helper_method :sort_column, :sort_direction

    def index
      @albums = Album.order(sort_column + " " + sort_direction)
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

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
       
        redirect_to albums_path
    end

    def search
      if params[:search].blank?  
        flash[:notice] = "Error: Please enter an artist!"
        redirect_to :albums
      else  
        album_params = params[:search].downcase  
        @albums = Album.all.where("lower(artist) LIKE :search", search: album_params) 
      end  
    end

    private
      def album_params
        params.require(:album).permit(:artist, :album_title, :year_released, :genre, :grade, :notes)
      end
  
      def sort_column
        Album.column_names.include?(params[:sort]) ? params[:sort] : "artist"
      end
  
      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
    end
