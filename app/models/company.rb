class Company < ActiveRecord::Base
  ROLES = %w[company].freeze
  STATES = %w[Nuevo Progreso Retrasado Terminado].freeze
  STAGE = %w[Prealta Alta Diagnóstico Analisis Reporte].freeze
  
  belongs_to :sector, class_name: 'Sector'
  belongs_to :agent, class_name: 'User'
  belongs_to :emprered, class_name: 'User'
  belongs_to :user_login, class_name: 'User'

  validates :company_name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :sector, presence: true
  validates :email_user, presence: true
  validates :name, presence: true

  def self.search(search)
    where("company_name LIKE ?", "%#{search}%")
  end
  
end
