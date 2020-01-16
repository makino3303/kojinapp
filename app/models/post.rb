class Post < ApplicationRecord
  belongs_to :user
  belongs_to :work
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: {message: "タイトルを入力してください"}
  validates :rate, presence: {message: "選択してください"}
  validates :content, presence: {message: "レビュー内容を記入してください"}


  class << self #average_rateをクラスメソッドにするため、「class << self 〜 end」で囲む
    def average_rate(posts)
      sum_of_rate = 0
      posts.each do |post|
        sum_of_rate = sum_of_rate + post.rate
      end
      sum_of_rate / posts.length
    end
  end

end
