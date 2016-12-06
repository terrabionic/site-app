class SurveyAnalysis < ActiveRecord::Base
	belongs_to :company, class_name: 'Company'
	belongs_to :agente, class_name: 'User'
	belongs_to :user_company, class_name: 'User'
	belongs_to :reply, class_name: 'Reply'
	
	
	def completed
	if self.num_company.to_s.length > 0 && self.num_jobs.to_s.length > 0 && self.create_jobs.to_s.length > 0 && self.num_emprered.to_s.length > 0 && self.num_electronic_kiosk.to_s.length > 0 && self.organizational.to_s.length > 0 && self.innovation_management.to_s.length > 0 && self.innovation.to_s.length > 0 && self.guilds.to_s.length > 0  && self.copetential.to_s.length > 0
		return true
	end
	return false
	end
	
end
