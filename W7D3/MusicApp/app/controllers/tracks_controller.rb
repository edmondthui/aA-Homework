class TracksController < ApplicationController

    before_action :ensure_logged_in

    def new
        render :new
    end

    def create
        track = Track.new(track_params)
        if track.save
            redirect_to track_url(track)
        else
            flash.now[:error] = ["Invalid Track"]
            render :new
        end
    end

    def edit
        @track = Track.find(params[:id])
        render :edit
    end

    def show
        @track = Track.find(params[:id])
        render :show
    end

    def update
        track = Track.find(params[:id])
        if track.update(track_params)
            redirect_to track_url(track)
        else
            flash.now[:error] = ["Invalid Track"]
            render :new
        end
    end

    def destroy
        track = Track.find(params[:id])
        track.destroy
        redirect_to album_url(track.album_id)
    end
    
    private

    def track_params
        params.require(:track).permit(:title, :album_id, :ord, :bonus, :lyrics)
    end
end