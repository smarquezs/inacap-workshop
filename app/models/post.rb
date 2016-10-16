class Post < ActiveRecord::Base

  validates :title, :body, presence: true

  def words
    return 0 unless body?
    body.split.count
  end

  def paragraphs
    return on unless body?
    body.split(/\r\n\r\n/).count
  end
end
