class ChangeTablePosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.remove :author
  		t.references :user, index: true, foreign_key: true
  	end
  end
end
