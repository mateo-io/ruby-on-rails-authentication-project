class RemoveAuthoridFromPosts < ActiveRecord::Migration
  def change
  	  	change_table :posts do |t|
  		t.remove :author_id
  		
  	end
  end
end
