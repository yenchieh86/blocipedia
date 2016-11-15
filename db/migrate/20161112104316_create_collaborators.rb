class CreateCollaborators < ActiveRecord::Migration
  def change
        
    create_table :wikis do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :collaborators do |t|
      t.references :user, index: true, foreign_key: true
      t.references :wiki, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
