FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description, :state] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :expired_at do
    Date.new
  end
end
