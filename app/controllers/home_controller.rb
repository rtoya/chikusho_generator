class HomeController < ApplicationController

  def adjust_photo
    # fidというパラメータでフレームの識別IDが飛んでくる
    # このIDは、CHIKUSHO_FLAMESという定数（配列）のインデックス
    # CHIKUSHO_FLAMES[params[:fid].to_i]
    # => こんな感じでフレーム画像ファイル名が取り出せる
  end

  def show_gallery
  end

end
