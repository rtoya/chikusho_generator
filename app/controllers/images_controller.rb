class ImagesController < ApplicationController
  # before_action :set_image, only: [:show, :edit, :update, :destroy]

  def upload
    @image = Image.new(image_params)
    @image.random_hash = SecureRandom.hex[0, 9]

    if @image.save
      redirect_to "/adjust_photo/#{@image.random_hash}?id=#{@image.id}&?fid=#{@image.flame_id}"
    else
      flash[:error] = "写真がアップロードされていない、もしくはファイルの種類・サイズが不正です"
      render '/home/select_flame_and_upload'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #    def set_image
  #      @image = Image.find(params[:id])
  #    end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:public_flg, :input, :random_hash)
  end

end
