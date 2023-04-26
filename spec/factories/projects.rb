FactoryBot.define do
  # 継承を使うと class: Project の指定もなくすことができる
  # 入れ子構造
  # factory :project do
  #   sequence(:name) { |n| "Project#{n}" }
  #   description { "A test project." }
  #   due_on { 1.week.from_now }
  #   association :owner

  #   # 昨日が締め切りのプロジェクト
  #   factory :project_due_yesterday do
  #     due_on { 1.day.ago }
  #   end

  #   # 昨日が締め切りのプロジェクト
  #   factory :project_due_today do
  #     due_on { Date.current.in_time_zone }
  #   end

  #   #明日が締切のプロジェクト
  #   factory :project_due_tomorrow do
  #     due_on { 1.day.from_now}
  #   end
  # end

  # トレイトを使う場合
  # その場合はspecの書き方を変更する必要がある
  factory :project do
    sequence(:name) { |n| "Project#{n}" }
    description { "A test project." }
    due_on { 1.week.from_now }
    association :owner

    #メモ付きのプロジェクト
    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end

    # 昨日が締め切りのプロジェクト
    trait :due_yesterday do
      due_on { 1.day.ago }
    end

    # 昨日が締め切りのプロジェクト
    trait :due_today do
      due_on { Date.current.in_time_zone }
    end

    #明日が締切のプロジェクト
    trait :due_tomorrow do
      due_on { 1.day.from_now}
    end

    #無効な属性値のプロジェクト
    trait :invalid do
      name { nil }
    end
  end
end
