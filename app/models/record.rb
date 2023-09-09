class Record < ApplicationRecord
  belongs_to :reminder

  validates :implementation_record, presence: true
end
