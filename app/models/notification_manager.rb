class NotificationManager < ActiveRecord::Base
  belongs_to :event, class_name: 'EventMonitor'
  belongs_to :notice
  belongs_to :sector

  validates :title, presence: true
  validates :sector, presence: true

  validate :event_xor_notice

  private 

  	def event_xor_notice
      unless event.blank? ^ notice.blank?
        errors.add(:base, "Solo se puede seleccionar noticia o evento pero no ambos")
      end
    end

end
