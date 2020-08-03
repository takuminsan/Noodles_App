class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog # クラウドストレージサービスに画像を保存する
  else
    storage :file # ローカルのファイルシステムに画像を保存する
  end

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # 画像の上限
  process resize_to_limit: [715, 500]

  # 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 許可する画像の拡張子
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
