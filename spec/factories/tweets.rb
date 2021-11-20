FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    title { '提出物を出す。' }
    tantou { '上田' }
    body { '今度の月曜までに書類をまとめて' }
  end
  factory :untweet, class: Tweet do
    association :user, factory: :user
    title { '' }
    tantou { '斎藤' }
    body { '' }
  end
  factory :untweet2, class: Tweet do
    association :user, factory: :user
    title { 'テストを書いて' }
    tantou { '' }
    body { '' }
  end
end
