class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  ROLES = %w[admin agent emprered].freeze
                                                                                                                                                                            
  has_many :companies, :class_name => 'Company', :foreign_key => 'agent_id'
  has_many :companies, :class_name => 'Company', :foreign_key => 'emprered_id'

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def account_active?
    return self.active
  end

  def active_for_authentication?
        # Uncomment the below debug statement to view the properties of the returned self model values.
        # logger.debug self.to_yaml
        super && account_active?
      end
end
