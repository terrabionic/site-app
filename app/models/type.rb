class Type < ActiveRecord::Base
	belongs_to :subbranch
	validates :name, presence: true
	validates :code, presence: true
	validates :subbranch, presence: true
	has_and_belongs_to_many :companies

	def code_id
		#@type = Type.find(params[self.id])
		if self.code > 0
			str_code = self.code.to_s
			if str_code.length > 3
				return str_code[0,3]
			else
				return false
			end
		else
		  return false
		end
	end
end