class Skill < ApplicationRecord
	validates_presence_of :title, :daily_percent_skill
end
