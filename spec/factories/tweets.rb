FactoryGirl.define do
  factory :tweet do
    external_id "123"
    content "abc"
    username "xyz"
    avatar "awesome_url"
    tweeted_at Time.now
  end
end
