class ImageUploader < CarrierWave::Uploader::Base
# リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

# 保存形式をJPGにする
  process :convert => 'jpg'

# 画像の上限
  process :resize_to_limit => [400, 400]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

# 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

# サムネイルを生成する設定
  version :thumb do
    process :resize_to_fill => [40, 40, gravity = ::Magick::CenterGravity]
  end

# 許可する画像の拡張子
  def extension_white_list
    %w(jpg jpeg gif png)
  end

# 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end
end
