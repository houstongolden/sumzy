module FeedsHelper


		def linkify(text)
		newtext = text.gsub(/\b((https?:\/\/|ftps?:\/\/|mailto:|www\.)([A-Za-z0-9\-_=%&@\?\.\/]+))\b/) {
		match = $1
		tail  = $3
			case match
				when /^www/     then  "<a href=\"http://#{match}\">#{match}</a>"
				when /^mailto/  then  "<a href=\"#{match}\">#{tail}</a>"
				# when /^@/		then "<a href"\"http://twitter.com/#{match}\">#{match}</a>"
				else 
				"<a href=\"#{match}\">#{match}</a>"
			end
		}
		newtext
	end	

end
