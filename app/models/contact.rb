class Contact < ApplicationRecord
include PgSearch
  pg_search_scope :search_by_title, :against => :contact_email, using: { tsearch: { any_word: true } }
  # [:contact_email, :contact_firstname,:contact_lastname]

end
