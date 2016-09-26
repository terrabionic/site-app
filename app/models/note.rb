#todo place this class into its own file
class LteGradeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value > record.question.grade
      record.errors[attribute] << (options[:message] || "can't be greater than question grade")
    end
  end
end

class Note < ActiveRecord::Base
  belongs_to :question

  validates :title, presence: true
  validates :description, presence: true
  validates :points, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :question, presence: true

  validates :points, lte_grade: true
end
