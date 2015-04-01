class PhotobookController < ApplicationController
  def showphotobooklist
      @photobooklist = Photobook.all.reverse
  end
  def createphotobook
      photobook = Photobook.new
      photobook.bookname = params[:bookname]
      photobook.save
    redirect_to :photos
  end
  def showphotos
      @photobook = Photobook.find_by_id(params[:photobook_id])
      @photolist = Photo.where(:photobook_id=>params[:photobook_id])
      respond_to do |format|
        format.js { render}
        format.html
      end
  end
  def createphotobookxml
    x = Builder::XmlMarkup.new(:target=> $stduot,:indent =>1)
    x.instruct!
    Photobook.all.each do |p|
      x.data{
        x.i("name" => p.bookname,"data"=>p.id){
        }
      }
    end
      File.open("public/CSPHOTO/menuDatarb.xml","wb") do |f|
        f.write(x)
      end
  end
end
