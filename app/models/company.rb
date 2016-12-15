class Company < ActiveRecord::Base
  ROLES = %w[company].freeze
  STATES = %w[Nuevo Progreso Retrasado Terminado].freeze
  STAGE = %w[Prealta Alta Diagnóstico Analisis Reporte].freeze
  
  belongs_to :sector, class_name: 'Sector'
  belongs_to :agent, class_name: 'User'
  belongs_to :emprered, class_name: 'User'
  belongs_to :user_login, class_name: 'User'
  belongs_to :survey_analysis, class_name: 'SurveyAnalysis'
  belongs_to :municipio, class_name: 'Municipio'

  validates :company_name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :sector, presence: true
  validates :email_user, presence: true
  validates :name, presence: true
  has_attached_file :image_logo, styles: { medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :image_logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  

  def self.search(search)
    where("company_name LIKE ?", "%#{search}%")
  end
  
end
