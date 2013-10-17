require 'open-uri'

class HomeController < ApplicationController

  def select_flame_and_upload
    @image = Image.new
  end

  def adjust_photo
    @image = Image.find(params[:id])
    redirect_to root_path unless @image.random_hash == params[:random_hash]
  end

  def create_photo
    original_image = Image.find(params[:photo_id])
    org_img = Magick::Image.read("#{Rails.root}/public#{original_image.input.url}").first
    resize_img = org_img.crop(params[:coords_x].to_i, params[:coords_y].to_i, params[:coords_w].to_i, params[:coords_h].to_i).resize_to_fit(300, 250)
    flame = Magick::Image.read("#{Rails.root}/app/assets/images/#{CHIKUSHO_FLAMES[params[:flame_id].to_i]}").first
    result = resize_img.composite(flame, 0, 0, Magick::OverCompositeOp)

    original_image.output_data = result.to_blob
    if original_image.save
      @id = original_image.id
      return @id
    end
#    result.write("hoge.png")
  end

  def download_photo
    send_file "#{Rails.root}/app/assets/images/aono.png", filename: 'aono.png', type: 'image/png'

    # 動的なファイルの生成はsend_dataメソッドを使用。Railsレシピブックp.78参照
  end

  def show_gallery
    @images = Image.is_public_ok
  end

  def show_photo
    #@photo = Hoge.find(params[:id])
  end

end
