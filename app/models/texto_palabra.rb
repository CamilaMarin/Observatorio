class TextoPalabra < ActiveRecord::Base
	belongs_to :texto
	belongs_to :palabra_bolsa
end