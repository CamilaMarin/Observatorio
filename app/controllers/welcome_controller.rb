class WelcomeController < ApplicationController
  def index
   $client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "6B9I6tnf8HVFenutUSNpfwmMk"
      config.consumer_secret     = "VJ8tRme5LRsn33pPKjsP7obOkL4To6g8zq8zjnX6NLDwIJRjlm"
      config.access_token        = "524309920-sctPPH0nSCihN00BBoUZKkycTBIMSb2h6tOS4bWv"
      config.access_token_secret = "ekrwNLiRSxxGnoHxGECw8KiVAmH9rhD4WXO9PaR6JaRfE"
    end 
#    @topics = ["VTRsoporte lag","VTRsoporte internet","VTRsoporte modem","VTRsoporte conexion","VTRsoporte router","VTRsoporte pagina","VTRsoporte wifi","VTRsoporte wi-fi","VTRsoporte pc","VTRsoporte computador","VTRsoporte navegador","VTRsoporte navegando","VTRsoporte web","AyudaMovistarCL lag","AyudaMovistarCL internet","AyudaMovistarCL modem","AyudaMovistarCL conexion","AyudaMovistarCL router","AyudaMovistarCL pagina","AyudaMovistarCL wifi","AyudaMovistarCL wi-fi","AyudaMovistarCL pc","AyudaMovistarCL computador","AyudaMovistarCL navegador","AyudaMovistarCL navegando","AyudaMovistarCL web","clarochile_cl lag","clarochile_cl internet","clarochile_cl modem","clarochile_cl conexion","clarochile_cl router","clarochile_cl pagina","clarochile_cl wifi","clarochile_cl wi-fi","clarochile_cl pc","clarochile_cl computador","clarochile_cl navegador","clarochile_cl navegando","clarochile_cl web","MovistarChile lag","MovistarChile internet","MovistarChile modem","MovistarChile conexion","MovistarChile router","MovistarChile pagina","MovistarChile wifi","MovistarChile wi-fi","MovistarChile pc","MovistarChile computador","MovistarChile navegador","MovistarChile navegando","MovistarChile web","VTRChile lag","VTRChile internet","VTRChile modem","VTRChile conexion","VTRChile router","VTRChile pagina","VTRChile wifi","VTRChile wi-fi","VTRChile pc","VTRChile computador","VTRChile navegador","VTRChile navegando","VTRChile web"]
    
    @tabla = PalabraClave.all()
    @topics = @tabla.select("nombre_palabra_clave")
  	contador = 0
    id__actor = 0
   	@topics.each do |t|
    	@search = $client.search(t.nombre_palabra_clave, :include_rts => false, :lang => "es").take(1).collect  
  	 	@search.each do |tweets| 
  		   @texto = Texto.new({id_tweet: tweets.id, id_texto: contador,texto: tweets.text}); 
  		   if Texto.where(id_tweet: @texto.id_tweet).count > 0
  		   else
  			    @texto.save();
  			    @usuario = Usuario.create({id_usuario: tweets.user.id, cuenta: tweets.user.name})
  			   	@tweet = Tweet.create({id_tweet: tweets.id, id_texto: contador,id_usuario: tweets.user.id, region: tweets.user.location, fecha: tweets.created_at})
            @id__actor = @tabla.select("id_actor").where(nombre_palabra_clave: t.nombre_palabra_clave).limit(1)
            @id__actor.each do |a|
              id_actor_a = a.id_actor
              @actor = ActorTweet.create({id_at: contador, id_actor: id_actor_a, id_tweet: tweets.id})
            end
  		   		contador += 1
  		    end
  		end
	  end
  end
end
