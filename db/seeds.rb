products = [
  ['エスプレッソ', 560, false],
  ['抹茶ラテ', 670, false],
  ['カフェラテ', 580, false],
  ['カプチーノ', 580, false],
  ['アイスコーヒー', 500, false],
  ['インスタントコーヒー', 500, true],
  ['インド産コーヒー豆', 500, true],
  ['コロンビア産コーヒー豆', 500, true],
  ['ブラジル産コーヒー豆', 550, true],
  ['モカコーヒー豆', 600, true],
  ['ドリッパー', 1100, true],
  ['フレンチプレス', 1500, true],
]

users = %w[
  山田太郎
  鈴木花子
  佐藤一郎
  田中次郎
]

stores = %w[
  S珈琲恵比寿店
  M&W恵比寿店
]

products.each do |name, price, is_ec|
  Product.create(name:, price:, is_ec:) unless Product.find_by(name:)
end

users.each do |name|
  User.create(name:) unless User.find_by(name:)
end

stores.each do |name|
  Store.create(name:) unless Store.find_by(name:)
end
