foods = [
  { name: '鶏むね肉', allergy: nil, freezed: true },
  { name: '白米', allergy: nil, freezed: false },
  { name: '鮭', allergy: '魚介類', freezed: true },
  { name: '豆腐', allergy: '大豆', freezed: false },
  { name: 'アーモンド', allergy: 'ナッツ類', freezed: false },
  { name: '牛乳', allergy: '乳製品', freezed: false },
  { name: '卵', allergy: '卵', freezed: false },
  { name: '食パン', allergy: '小麦', freezed: false },
  { name: '牛ひき肉', allergy: nil, freezed: true },
  { name: 'ほうれん草', allergy: nil, freezed: false },
]

foods.each do |food_attributes|
  Food.create!(food_attributes)
end
