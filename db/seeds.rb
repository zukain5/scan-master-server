products = [
  ['エスプレッソ', 560],
  ['抹茶ラテ', 670],
  ['カフェラテ', 580],
  ['カプチーノ', 580],
  ['アイスコーヒー', 500],
  ['インスタントコーヒー', 500],
  ['インド産コーヒー豆', 500],
]

users = %w[
  山田太郎
  鈴木花子
  佐藤一郎
  田中次郎
]

stores = %w[
  S珈琲 恵比寿店
  M&W 恵比寿店
]

products.each do |name, price|
  Product.create(name:, price:)
end

users.each do |name|
  User.create(name:)
end

stores.each do |name|
  Store.create(name:)
end
