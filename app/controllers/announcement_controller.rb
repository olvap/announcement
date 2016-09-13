# announcement_controller.rb

class AnnouncementController < ApplicationController
  get '/' do
    # my index at announcement application
    @title = "announcement"
    erb :"announcement/index"
  end

  get '/:announcement' do
    # this is information about the announcement
    "ok #{@params[:announcement]}"
  end
end
