require 'twitter'
require './configure'
user = Hash.new
screen_name = ARGV[0] || 'unline91'
iteracion = ARGV[1] || '3'


a_user = Twitter.user(screen_name)

puts "Username   : #{a_user.screen_name}"


#guardar todas las ids de las personas que sigue
friends = Twitter.friend_ids(screen_name)

contador = 0 

#recorrer el hash friends 
friends.ids.each do |fid|
    if (contador < iteracion.to_i)  #contador de nº de usuarios que quiers que salgan en pantalla
    
		f = Twitter.user(fid)

		if (f.protected.to_s != "true")  #si usuario no esta protegido
		  user[f.screen_name.to_s] = f.followers_count #introducir en hash user
			contador += 1
		end
	end

end

var = 0

usuarios = user.sort_by {|k,v| -v} #guardamos en usuarios el hash user ordenado por nº de seguidores

usuarios.each do |user,count|
	if (var > iteracion.to_i)
		break
	end
	puts "#{user},#{count}"
	var +=1
end


