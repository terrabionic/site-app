class Survey < ActiveRecord::Base
  validates :title, presence: true

  has_many :questions, :dependent => :restrict_with_error
  has_many :replies, :dependent => :restrict_with_error

  def total_score
  	total = 0.0
  	self.questions.each do |question|
  		total = total + question.grade.to_f
  	end
  	return total
  end

  def categories
  	@categories = []
  	self.questions.each do |question|
  		unless @categories.include? question.category
  			@categories.push( question.category )
  		end
  	end
  	return @categories
  end

end
