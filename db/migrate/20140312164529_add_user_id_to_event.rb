class AddUserIdToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :user_id, :integer
  	#es bueno agregar un indice cuando relacionamos dos objetos 
  	#para que las querys les sea facil su busqueda
  	add_index :events, :user_id
  end
end
