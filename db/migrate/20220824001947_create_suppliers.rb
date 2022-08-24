class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :nit
      t.string :contact_name
      t.string :contact_num
      t.string :bank_name
      t.string :bank_account

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
