class BandsController < ApplicationController
    def index
        @bands = Band.all 
        render :index
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            flash[:errors] = ["Band has been added"]
            redirect_to band_url(@band.id)
        else
            flash.now[:errors] = ["Unsucesssful save"]
            render :new
        end
    end

    def edit
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])

        if @band.update(band_params)
            redirect_to band_url(@band.id)
        else
            render :edit
        end
    end

    def destroy
        @band = Band.find_by(params[:name])
        @band.destroy
        redirect_to bands_url
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
