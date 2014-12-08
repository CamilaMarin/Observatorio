class Usuario < ActiveRecord::Base
	has_many :tweets
end
