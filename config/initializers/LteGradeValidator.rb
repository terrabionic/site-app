class LteGradeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value > record.question.grade
      record.errors[attribute] << (options[:message] || "can't be greater than question grade")
    end
  end
end

