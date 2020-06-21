class AlbumsController < ApplicationController
  helper_method :sort_column, :sort_direction

    def index
      @albums = Album.order(sort_column + " " + sort_direction)
      @albums = current_user.albums
    end

    def show
      
      @album = Album.find(params[:id])
    end

    def new
      @album = current_user.albums.new
    end

    def edit
      @album = Album.find(params[:id])
    end

    def create
      @album = Album.new(album_params.merge(user_id: current_user.id))
 
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
        flash[:alert] = "Error: Please enter an artist!"
        redirect_to :albums
      else 
        album_params = params[:search].downcase  
        @albums = Album.all.where("lower(artist) LIKE :search", search: album_params)
        # flash[:notice] = "no artist"
        # redirect_to search_page
      # else 
      #   album_params = params[:search].exists?
      #   puts 'got to else'
      #   @albums = Album.all.where("lower(artist) LIKE :search", search: album_params).exists? == false
      #   flash[:notice] = "no artist"
      #   redirect_to :albums
      end  
    end

    def move
      @album = WishlistAlbum.find(params[:id])
      
      @album = Album.new(wishlist_album_params)

      @wishlist_album = WishlistAlbum.find(params[:id])
      @wishlist_album.destroy
    end

    private
      def album_params
        params.require(:album).permit(:artist, :album_title, :year_released, :genre, :grade, :notes)
      end

      def wishlist_album_params
        params.permit(:wishlist_album).permit(:artist, :album_title)
      end
  
      def sort_column
        Album.column_names.include?(params[:sort]) ? params[:sort] : "artist"
      end
  
      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
    end
