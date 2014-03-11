class Event < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 60 }
	validates :description, length: { minimum: 100 }, allow_blank: true
	validate :start_at_is_present
	validate :date_in_order


	scope :start_at_today, lambda {
	where (["start_at = ?", Date.today]) }

	def self.next_events
		where (["start_at > ?", Date.today])
	end

	def self.location
		#en forma de argumentos de un array
		where (["address = 'Madrid'"])
		#otra opcion, no permite comparaciones, es menos poderosas
		#where(start_at: Date.today, end_at: 1.day.from_now, description: ["hi", "hello"])
	end

	private

	def start_at_is_present
	  if start_at.blank?
	    errors.add(:start_at, "must enter start date") 
	  end
	end

	def date_in_order
	  if start_at.present? && end_at.present?
	    if start_at > end_at
	     errors.add(:start_at, "must be before the end date") 
	    end
	  end
	end


	#unless start_date < end_date
	#validates :description, length: { minimum: 100, if: description_presence? } 
	#hay que crear un metodo privado
	#private

	#def description_present?
	#description_present
	#end
end
