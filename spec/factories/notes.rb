FactoryBot.define do
  #このアソシエションでは、プロジェクトのユーザーとユーザーのユーザーが作られてしまう
  # factory :note do
  #   message { "My important note." }
  #   association :project
  #   association :user
  # end

  factory :note do
    # このアソシエションでは、ユーザーはプロジェクトのオーナーになる
    message { "My important note." }
    association :project
    user { project.owner }
  end
end
