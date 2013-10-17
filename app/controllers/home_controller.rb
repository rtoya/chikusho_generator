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
      @random_hash = original_image.random_hash
      return @random_hash
    end
  rescue
    redirect_to select_flame_and_upload_path
  end

  def download_photo
    image = Image.find_by(random_hash: params[:random_hash])
    send_data(image.output_data, type: 'image/png', filename: "#{image.input_file_name.split('.')[0]}_chikusho.png")
  end

  def show_gallery
    @images = Image.is_public_ok.select('random_hash').page(params[:page])
  end

  def show_photo
    @random_hash = params[:random_hash]
  end

end
