class Contact < ApplicationRecord
include PgSearch
  pg_search_scope :search_by_title, :against => :contact_email

end
