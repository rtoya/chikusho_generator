class HomeController < ApplicationController

  def adjust_photo
    # fidというパラメータでフレームの識別IDが飛んでくる
    # このIDは、CHIKUSHO_FLAMESという定数（配列）のインデックス
    # CHIKUSHO_FLAMES[params[:fid].to_i]
    # => こんな感じでフレーム画像ファイル名が取り出せる
  end

  def create_photo
    # 画像作成用のアクション
  end

  def download_photo
    send_file "#{Rails.root}/app/assets/images/aono.png", filename: 'aono.png', type: 'image/png'

    # 動的なファイルの生成はsend_dataメソッドを使用。レシピブックp.78参照
  end

  def show_gallery
  end

end
