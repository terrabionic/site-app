class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  ROLES = %w[admin agent emprered].freeze
                                                                                                                                                                            
  has_many :companies, :class_name => 'Company', :foreign_key => 'agent_id'

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
