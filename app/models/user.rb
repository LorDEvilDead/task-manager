class User < ApplicationRecord
  # вопрос и факт: бинг немного отупел и сгенерил чушь, типа: "^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}"
  #  на сколько важно уметь самому составлять регулярные выражения, если можно попросить нейронку или взять напросторах интернета гоотовую?
  # Ведь большинство регулярок - уже давно составлены.
  VALID_EMAIL_REGEX = /\A[\w.+-]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :my_tasks, class_name: 'Task', foreign_key: :assignee_id

  validates :first_name, length: { minimum: 2 }, presence: true
  validates :last_name, length: { minimum: 2 }, presence: true
  # теперь тут вопрос, на сколько это корректно и как можно запись сделать подругому? На это я наткнулся на стэковерфлоу.
  # в доке, которая прикреплена к заданию говорится только о format :email with: регулярка, сообщение: "сообщение с текстом"
  #  а не validates_format_of
  # немного переживаю, что наткнулся на стэковерлоу, а не сам написал
  # так же, нам не нужно ли прописывать здесь дополнительно проверку перед записью в бд?
  #  и ошибки, нужно прописать, для вывода или это будет позже?
  validates_uniqueness_of :email, presence: true
  validates_format_of :email, with: VALID_EMAIL_REGEX

  has_secure_password
end
