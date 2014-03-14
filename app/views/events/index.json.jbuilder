json.array! @events do |event|
	#json.end_at event.end_at
	#json.name event.name
	json.(event, :name, :description, :start_at, :end_at)

	json.user do 
	json.email event.user.mail
    end
    #json puede implimentarse como nosotros queramos
    #podemos modificar en funcion de como queramos customizar
    #Sintaxis de jbuilder:
    #json.(nombre propiedad) (valor que queremos devolver)
    #json.value event.name
    #json.id event.id
end