class PhotoController < ApplicationController
  def uploadphoto
    #render plain:params.inspect

    #time_now = Time.now
    file = params[:qqfile]
    qquuid = params[:qquuid]
    directory = "/photo/#{params[:photo_id]}"
    origName = file.original_filename
    baseName = File.basename(origName, ".*")  # 取得文件名字
    extName = File.extname(origName).downcase # 取得文件扩展名
    filename =qquuid+ extName

    absdir = File.join("public",directory)
    path = File.join(absdir,filename)
    #render plain:filename.inspect
    # if !File.exist(absdir)
    #  Dir.mkdir("public/photo/"+params[:photo_id])
    # end
    if !File.exist?(absdir)
      FileUtils.makedirs(absdir)
    end
   # render plain:Digest::MD5.hexdigest(file.read)
   if file
      File.open(path,"wb") do |f|
        f.write(file.read)
      end
       @photo=Photo.new
       @photo.photobook_id = params[:photo_id]
       @photo.filename = origName
       @photo.path = File.join(directory,filename)
       if @photo.save
         render json: { success: true,src:@photo.to_json }
       else
         render json: @photo.errors.to_json
       end
    end

  end

end
