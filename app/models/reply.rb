class Reply < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  belongs_to :user, class_name: 'User'

  accepts_nested_attributes_for :answers

  def score
  	total = 0.0
  	self.answers.each do |answer|
  		total = total + answer.grade.to_f
  	end
  	return total
  end

  def score_category categories
    category_score = []
    categories[:categories].each do |category|
    	total = 0.0
    	self.answers.each do |answer|
    		if answer.question.category.id == category.id
    			total = total + answer.grade.to_f
    		end
    	end
    	category_score.push( [category.title, total ] )
    end
    return category_score
  end

end
