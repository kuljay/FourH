class Post < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :body, :publish_date, :title, :excerpt, :category_ids

  validates_presence_of :body, :publish_date, :title,:excerpt, :user_id

  belongs_to :user
  has_and_belongs_to_many :categories

  scope :published, lambda{ where(['publish_date <= ?',Date.today])}
  scope :by_user_id, lambda{ |uid| where(:user_id => uid)}
  scope :by_category_id, lambda{ |cid| joins(:categories).where(['categories.id =?',cid])}

  # def is_owner(owner)
  # 	return @Post(owner) if current_user.has_role? [:admin] && current_user.id [:user_id]? end
  # end

end
