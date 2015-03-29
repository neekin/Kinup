class PhotoController < ApplicationController
  def uploadphoto
    render plain:params[:Filedata].inspect
  end
end
