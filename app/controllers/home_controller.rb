require 'open-uri'

class HomeController < ApplicationController

  def adjust_photo
    @image = Image.find(params[:id])
    redirect_to root_path unless @image.random_hash == params[:random_hash]
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

    # 動的なファイルの生成はsend_dataメソッドを使用。Railsレシピブックp.78参照
  end

  def show_gallery
    @photos = ActiveSupport::JSON.decode(URI("http://bjin.me/api/?type=rand&count=50&format=json").read)
    # 美女APIを叩いているので@photosは変更する
  end

  def show_photo
    #@photo = Hoge.find(params[:id])
  end

  def select_flame_and_upload
    @image = Image.new
  end

end
