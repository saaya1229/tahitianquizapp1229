class AddSelectedChoiceToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :selected_choice, :string
  end
end
