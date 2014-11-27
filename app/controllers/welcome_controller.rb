class WelcomeController < ApplicationController
  def index
   $client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "r7sHXi9zhFVHZVvF0792PCB43"
      config.consumer_secret     = "mjg0JsPRuYRRsDIaGLSZnZJhlnKAX8VsdjW2xSpoetg3yFESVk"
      config.access_token        = "524309920-1DiElCh5nt0zSAtWru7xNEk2zuVqas9riRt9p7UL"
      config.access_token_secret = "nBUehmEW66gyb2hgQl6hWn43nTWqxrJpqoFJ4hbIAc1We"
    end 
    @topics = ["VTRsoporte lag","VTRsoporte internet","VTRsoporte modem","VTRsoporte conexion","VTRsoporte router","VTRsoporte pagina","VTRsoporte wifi","VTRsoporte wi-fi","VTRsoporte pc","VTRsoporte computador","VTRsoporte navegador","VTRsoporte navegando","VTRsoporte web","AyudaMovistarCL lag","AyudaMovistarCL internet","AyudaMovistarCL modem","AyudaMovistarCL conexion","AyudaMovistarCL router","AyudaMovistarCL pagina","AyudaMovistarCL wifi","AyudaMovistarCL wi-fi","AyudaMovistarCL pc","AyudaMovistarCL computador","AyudaMovistarCL navegador","AyudaMovistarCL navegando","AyudaMovistarCL web","clarochile_cl lag","clarochile_cl internet","clarochile_cl modem","clarochile_cl conexion","clarochile_cl router","clarochile_cl pagina","clarochile_cl wifi","clarochile_cl wi-fi","clarochile_cl pc","clarochile_cl computador","clarochile_cl navegador","clarochile_cl navegando","clarochile_cl web","MovistarChile lag","MovistarChile internet","MovistarChile modem","MovistarChile conexion","MovistarChile router","MovistarChile pagina","MovistarChile wifi","MovistarChile wi-fi","MovistarChile pc","MovistarChile computador","MovistarChile navegador","MovistarChile navegando","MovistarChile web","VTRChile lag","VTRChile internet","VTRChile modem","VTRChile conexion","VTRChile router","VTRChile pagina","VTRChile wifi","VTRChile wi-fi","VTRChile pc","VTRChile computador","VTRChile navegador","VTRChile navegando","VTRChile web"]
    
    #@topics = PalabraClave.select("nombre_palabra_clave").all
   	contador = 0
   	@topics.each do |t|
  	@search = $client.search(t, :include_rts => false, :lang => "es").take(1).collect  
	 	@search.each do |tweets| 
		   @texto = Texto.new({id_tweet: tweets.id, id_texto: contador,texto: tweets.text}); 
		   if Texto.where(id_tweet: @texto.id_tweet).count > 0
		   else
			    @texto.save();
			    @usuario = Usuario.create({id_usuario: tweets.user.id, cuenta: tweets.user.name})
			   	@tweet = Tweet.create({id_tweet: tweets.id, id_texto: contador,id_usuario: tweets.user.id, region: tweets.user.location, fecha: tweets.created_at})
		   		@actor = ActorTweet.create({id_at: contador, id_tweet: tweets.id})
		   		contador += 1
		    end
		end
	end
  end
end
