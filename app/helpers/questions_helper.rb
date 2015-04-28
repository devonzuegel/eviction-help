module QuestionsHelper
  def val_or_na(val)
    val.blank? ? "n/a" : val
  end

  def active_class(val)
    val.blank? ? 'inactive' : nil
  end
end