# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  private
  def validate_title_and_content_length
    char_count = self.title.length + self.content.length
    unless char_count > 100
      errors.add(:content, '100文字以上で')
    end
  end
end
