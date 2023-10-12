class Question < ApplicationRecord
  has_many :choices

  attr_accessor :selected_choice
end
