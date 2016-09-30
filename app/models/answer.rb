class Answer < ActiveRecord::Base
  belongs_to :reply
  belongs_to :question

  def title
    self.question.possible_answers.find(self.possible_answer_id).title
  end

  def grade
    self.question.possible_answers.find(self.possible_answer_id).grade
  end

end
