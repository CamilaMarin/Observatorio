class WelcomeController < ApplicationController
  def index
   $client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "6B9I6tnf8HVFenutUSNpfwmMk"
      config.consumer_secret     = "VJ8tRme5LRsn33pPKjsP7obOkL4To6g8zq8zjnX6NLDwIJRjlm"
      config.access_token        = "524309920-sctPPH0nSCihN00BBoUZKkycTBIMSb2h6tOS4bWv"
      config.access_token_secret = "ekrwNLiRSxxGnoHxGECw8KiVAmH9rhD4WXO9PaR6JaRfE"
    end   
    #tabla de Palabras Claves
    @tabla = PalabraClave.all()
    #Seleccion de la columna de los nombres de las palabras claves
    @topics = @tabla.select("nombre_palabra_clave")
    #tabla de la bolsa de palabras
    @palabras_bolsa = PalabraBolsa.all()
    #Seleccion de la columna de los nombres de la bolsa de palabras
    @palabras = @palabras_bolsa.select("nombre_palabra")
    #contador correspondiente a los id
  	contador = 0000
   	@topics.each do |t|
      #Busca tweet asociados a las palabras claves
    	@search = $client.search(t.nombre_palabra_clave, :include_rts => false, :lang => "es").take(1).collect  
  	 	@search.each do |tweets| 
  		   @texto = Texto.new({id_tweet: tweets.id, id_texto: contador,texto: tweets.text}); 
  		   if Texto.where(id_tweet: @texto.id_tweet).count > 0 #si ya existe el tweet no lo agrega
  		   else
            #guarda el texto
  			    @texto.save();
            #crea y guarda el id del usuario y el nombre de la cuenta
  			    @usuario = Usuario.create({id_usuario: tweets.user.id, cuenta: tweets.user.name})
            #crea y guarda el id del tweet, id del texto, id del usuario, la region(si la tiene) y la fecha de cración del tweet
  			   	@tweet = Tweet.create({id_tweet: tweets.id, id_texto: contador,id_usuario: tweets.user.id, region: tweets.user.location, fecha: tweets.created_at})
            #busca el id del actor asociado al tweet
            @id__actor = @tabla.select("id_actor").where(nombre_palabra_clave: t.nombre_palabra_clave).limit(1)
            @id__actor.each do |a|
              id_actor_a = a.id_actor
              #crea y guarda el id del actor-tweet, el id del actor y el id del tweet
              @actor = ActorTweet.create({id_at: contador, id_actor: id_actor_a, id_tweet: tweets.id})
            end


  		   		contador += 1
  		    end
  		end
	  end
  end
end
