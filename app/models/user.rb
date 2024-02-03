class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w.+-]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assignee_tasks, class_name: 'Task', foreign_key: :assignee_id

  validates :first_name, length: { minimum: 2 }, presence: true
  validates :last_name, length: { minimum: 2 }, presence: true
  validates_uniqueness_of :email, presence: true
  validates_format_of :email, with: VALID_EMAIL_REGEX

  has_secure_password
end
