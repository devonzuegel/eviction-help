module VisitorsHelper
  def is_advice(question)
    return (question.response1.blank? and question.response2.blank?)
  end
end