class ProfilesController < ApplicationController
    before_action :authenticate_user!


    def show
      @profile = current_user.profile #profile(単数)＝ model#profile.rbと紐づけられる
    end

    def edit
    end
end