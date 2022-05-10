class AlbumsController < ApplicationController
    def index
        @album = Album.all
        render :index
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.create(album_params)

        if @album.save
            flash[:sucess] = ["Successfully logged!"]
            redirect_to album_url(@album.id)
        else
            flash.now[:error] = @album.errors.full_messages
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy
    end

    private
    def album_params
        params.require(:album).permit(:band_id, :year, :title, :live)
    end
end
