class Pagefeed < ActiveRecord::Base
  belongs_to :sector
  validates :title, presence: true
  validates :link, presence: true
  validates :sector, presence: true
end
