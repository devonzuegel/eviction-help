class Question < ActiveRecord::Base
  belongs_to :prev,  class_name: "Question"
  belongs_to :next1, class_name: "Question"
  belongs_to :next2, class_name: "Question"
end