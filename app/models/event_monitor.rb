class EventMonitor < ActiveRecord::Base
	validates :title, presence: true
	validates :start_at, presence: true
	validates :end_at, presence: true
	validates :address, presence: true
	validates :website, presence: true


	def self.between(start_time, end_time)
		where('start_at > :lo and start_at < :up',
			:lo => EventMonitor.format_date(start_time),
			:up => EventMonitor.format_date(end_time)
		)
	end

	def self.format_date(date_time)
		Time.at(date_time.to_i).to_formatted_s(:db)
	end

	def as_json(options = {})
		{
			:id => self.id,
			:title => self.title,
			:start => start_at.rfc822,
			:end => end_at.rfc822,
			:allDay => allDay,
			:user_name => self.address,
			:url => Rails.application.routes.url_helpers.event_monitors_path(id),
			:color => "green",
			:website => self.website.parameterize
		}
	end

end
