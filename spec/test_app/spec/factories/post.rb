FactoryGirl.define do
  factory :post do
    sequence(:title) {|n| "Post Number #{n}" }
    sequence(:body)  {|n| "This is the long body of Post #{n}" }

    user { FactoryGirl.create(:user) }
  end
end
