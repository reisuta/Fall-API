# Category
[
    '英語',
    '金融',
    '文学',
    'プログラミング',
  ].each do |name|
    Category.create!(
      { name: name }
    )
  end
# Aim
[
   ['FP3級', '最低限の金融リテラシーを磨くきっかけのため', '金融系の最低限のリテラシー', 1, [Category.find_by(name: '金融').id]],
   ['美しい言葉辞典', '良い言葉をためる場所が欲しい', '言語リテラシーを取り戻すのと、容易に思い出せるために', 0,
[Category.find_by(name: '文学').id, Category.find_by(name: 'プログラミング').id]],
 ].each do |title, reason, advantage, difficulty, category_ids|
   Aim.create!(
     { title: title, reason: reason, advantage: advantage, difficulty: difficulty, category_ids: category_ids }
   )
 end

# Book
[
    ['人間失格', '太宰治', 900, false, Date.today, Date.today, Date.today.next_month],
    ['鴎', '太宰治', 900, false, Date.today, Date.today, Date.today.next_month],
    ['斜陽', '太宰治', 900, false, Date.today, Date.today, Date.today.next_month],
    ['キリギリス', '太宰治', 900, false, Date.today, Date.today, Date.today.next_month],
  ].each do |title, author, amount, is_library, bought_at, started_at, ended_at|
    Book.create!(
      { title: title, author: author, amount: amount, is_library: is_library, bought_at: bought_at, started_at: started_at,
ended_at: ended_at }
    )
  end

# Subscription
[
    ['Netflix', 900, 'Amazon Prime'],
    ['iPhone12 mini', 3000, 'OPPO Reno 3A'],
    ['Apple Music', 900, 'Amazon Prime'],
  ].each do |name, month_cost, alternative|
    Subscription.create!(
      { name: name, month_cost: month_cost, alternative: alternative }
    )
  end

# MobileContract
[
  ['楽天モバイル', 980, 10000, 'エリアによってつながりにくい'],
  ['ahamo', 3000, 10000, '大容量で安心'],
  ['UQモバイル', 2100, 10000, '中途半端'],
].each do |company_name, month_cost, cancel_cost, contract_detail|
  MobileContract.create!(
    { company_name: company_name, month_cost: month_cost, cancel_cost: cancel_cost, contract_detail: contract_detail }
  )
end
