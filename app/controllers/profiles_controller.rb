class ProfilesController < ApplicationController
    before_action :authenticate_user!


    def show
      @profile = current_user.profile #profile(単数)＝ model#profile.rbと紐づけられる
    end

    def edit
      @profile = current_user.build_profile #has_oneの時はbuild_profileにする(#current_user.boards.buildはhas_manyのとき)
    end

    def update
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'プロフィールを更新しました'
      else
        flash.now[:error] = '更新に失敗しました'
        render :edit
      end
    end

    private
    def profile_params
      params.require(:profile).permit(:avatar, :nickname)
    end
end