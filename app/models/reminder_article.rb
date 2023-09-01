class ReminderArticle < ApplicationRecord
  belongs_to :reminder
  belongs_to :article
end
