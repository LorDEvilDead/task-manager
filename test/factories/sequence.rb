FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description, :state, :avatar] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :expired_at do
    Date.current+1.week
  end
end
