class ToppagesController < ApplicationController
  def index
    if logged_in?
      @diarypost = current_user.diaryposts.build
    end
  end
end
