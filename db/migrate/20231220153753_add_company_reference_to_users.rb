class AddCompanyReferenceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :company, null: true, foreign_key: { on_delete: :cascade }, index: false
  end
end
