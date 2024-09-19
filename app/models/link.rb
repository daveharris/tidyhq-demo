class Link < ApplicationRecord

  validates :url, :code, presence: true, uniqueness: true
  validates_format_of :url, with: URI::regexp(%w(http https))

end
