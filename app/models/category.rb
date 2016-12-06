class Category < ActiveRecord::Base
  has_many :questions, :dependent => :restrict_with_error

  validates :title, presence: true
  has_attached_file :icon, styles: { medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def grade_total
  	grade = 0.0
  	self.questions.each do |question|
  		grade = grade + question.grade
  	end
  	return grade
  end

  def grade_obtained reply_id
  	grade = 0.0
  	@reply = Reply.find(reply_id[:reply])
  	@reply.answers.each do |answer|
  		if answer.question.category.id == self.id
  			grade = grade + answer.grade
  		end
  	end
  	return grade
  end


end
