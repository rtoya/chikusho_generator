class ImagesController < ApplicationController
  # before_action :set_image, only: [:show, :edit, :update, :destroy]

  def upload
    @image = Image.new(image_params)

    if @image.save
      redirect_to adjust_photo_path(id: @image.id)
    else
      render action: 'new'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #    def set_image
  #      @image = Image.find(params[:id])
  #    end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:public_flg, :input)
  end

end
