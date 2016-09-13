# application_controller.rb

class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # Set folder templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running test
  configure :production, :development do
    enable :logging
  end
end
