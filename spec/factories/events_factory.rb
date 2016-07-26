FactoryGirl.define do

  sequence :org do |n|
    "TestOrg#{n}"
  end

  sequence :hostname do |n|
    "TestHostname#{n}"
  end

  factory :event1, class: Event do
    org { generate(:org) }
    hostname { generate(:hostname) }
    description "This is a test event"
  end

  factory :eventSameOrg, class: Event do
    org "SameOrg"
    hostname { generate(:hostname) }
    description "This is a test event"
  end

end
