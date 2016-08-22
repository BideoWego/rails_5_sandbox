FactoryGirl.define do
  factory(:widget) do
    sequence(:name) { |n| "Widget No. #{n}" }
  end
end

