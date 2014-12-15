class Texto < ActiveRecord::Base
	belongs_to :tweet
	has_many :texto_palabra
end
