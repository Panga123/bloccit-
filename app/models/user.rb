class User < ApplicationRecord

  # #before_save { self.email = email.downcase if -> {email.present?} }
  # #before_save { self.email = email.downcase if email.present? }
  # #before_save { self.email = email.downcase if email.present? }
  # before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_save { self.email = email.downcase if email.present? }
  #new
  # before_save { self.name = ApplicationHelper::format_name(self.name) if name.present? }
  before_save { self.role ||= :member }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true


  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest?

  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 254 }

  has_secure_password

  #new
  enum role: [:member, :admin, :moderator]

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

#tests for new factory element
  # def has_posts?
  #   posts.count > 0
  # end
  #
  # def has_comments?
  #   comments.count > 0
  # end
  #
  # def has_favorites?
  #   favorites.count > 0
  # end

end
