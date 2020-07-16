FactoryBot.define do
  factory :like do
    association :post, factory: :post # postというファクトリを、Likeモデルに定義されたpostという名前の関連を生成する
    user { post.user } # 上記で既にuserデータが生成されているため、association :userとするとuserデータが二つ作られてしまう
  end
end
