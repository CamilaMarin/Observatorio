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
    #tabla de Hashtags
    @tabla2 = Hashtag.all()
    #Seleccion de la columna de los nombres de los hashtags
    @hashtags = @tabla2.select("nombre_hashtag")
    #Seleccion de la columna de los nombres de las palabras claves
    @palabras_clave = @tabla.select("nombre_palabra_clave")
    cont = 0
    #Se guardan en topics los hashtag y los nombres de las palabras claves
    @topics = []
    @hashtags.each do |h|
      @topics[cont] = h.nombre_hashtag
      cont += 1
    end
    @palabras_clave.each do |p|
      @topics[cont] = p.nombre_palabra_clave
      cont += 1 
    end
    #tabla de la bolsa de palabras
    @tabla1 = PalabraBolsa.all()
    #contador correspondiente a los id
  	contador = 0
    contador1 = 0
   	@topics.each do |t|
      #Busca tweet asociados a las palabras claves
    	@search = $client.search(t, :include_rts => false, :lang => "es").take(1).collect
  	 	@search.each do |tweets| 
        contadorCla=0
  		   @texto = Texto.new({id_tweet: tweets.id, id_texto: contador,texto: tweets.text}); 
  		   if Texto.where(id_tweet: @texto.id_tweet).count > 0 #si ya existe el tweet no lo agrega
  		   else
            #guarda el texto
  			    @texto.save();
            #crea y guarda el id del usuario y el nombre de la cuenta
  			    @usuario = Usuario.create({id_usuario: tweets.user.id, cuenta: tweets.user.name})
            #busca el id del actor asociado al tweet
            @palabras_clave.each do |pl|
              if t == pl.nombre_palabra_clave
                @id__actor = @tabla.select("id_actor").where(nombre_palabra_clave: t).limit(1)
              end
            end
            @hashtags.each do |ht|
              if t == ht.nombre_hashtag
                @id__actor = @tabla2.select("id_actor").where(nombre_hashtag: t).limit(1) 
              end
            end
            @id__actor.each do |a|
              id_actor_a = a.id_actor
              #crea y guarda el id del actor-tweet, el id del actor y el id del tweet
              @actor = ActorTweet.create({id_at: contador, id_actor: id_actor_a, id_tweet: tweets.id})
            end

            str=tweets.text
            arreglo_texto=str.split(" ")
            @tabla1.each do |t1|
              if arreglo_texto.index t1.nombre_palabra
                @palabra_bolsa=TextoPalabra.create({id_tp: contador1, id_texto: contador, id_palabrab: t1.id_palabrab})
                contador1+=1
                contadorCla+=t1.puntaje
              end
            end
             #crea y guarda el id del tweet, id del texto, id del usuario, la region(si la tiene) y la fecha de cración del tweet
            @tweet = Tweet.create({id_tweet: tweets.id, id_texto: contador,id_usuario: tweets.user.id, region: tweets.user.location, fecha: tweets.created_at, clasificacion: contadorCla})
  		   		contador += 1
  		    end
  		end
	  end
  end
end
