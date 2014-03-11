
FactoryGirl.define do
  factory :event do
  	name "event"
  	description "a"*101
  	address "Plaza Mayor"
  	start_at 1.days.from_now
  	end_at 2.days.from_now
  end
end


