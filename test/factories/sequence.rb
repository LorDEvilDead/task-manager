FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description, :avatar] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :expired_at do
    Date.current + 2.week
  end

  sequence :state do
    ['new_task', 'in_qa', 'in_code_review', 'ready_for_release', 'released', 'archive'].sample
  end
end
