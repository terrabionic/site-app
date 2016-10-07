class Company < ActiveRecord::Base
  ROLES = %w[company].freeze
  STATES = %w[Nuevo Progreso Retrasado Terminado].freeze
  
  belongs_to :sector, class_name: 'Sector'
  belongs_to :agent, class_name: 'User'
end
