class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :role_id, presence: true

  ROLES = %w[admin agent emprered].freeze
                                                                                                                                                                            
  has_many :companies, :class_name => 'Company', :foreign_key => 'agent_id'
  has_many :companies, :class_name => 'Company', :foreign_key => 'emprered_id'
  has_many :replies, :class_name => 'Reply', :foreign_key => 'user_id'
  belongs_to :role, class_name: 'Role'

  def is?( requested_role )
    self.role.role == requested_role.to_s
  end

  def company
    @company_ids = Company.where("user_login_id = ?", self.id)
    if @company_ids.length > 0
      return @company_ids[0]
    else
      return false
    end
  end

  def account_active?
    return self.active
  end

  def active_for_authentication?
        # Uncomment the below debug statement to view the properties of the returned self model values.
        # logger.debug self.to_yaml
    super && account_active?
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
