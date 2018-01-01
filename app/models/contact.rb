# == Schema Information
#
# Table name: contacts
#
#  id                   :integer          not null, primary key
#  contact_firstname    :string
#  contact_lastname     :string
#  contact_email        :string
#  birthday             :string
#  displayname          :string
#  initials             :string
#  middlename           :string
#  nickname             :string
#  title                :string
#  generation           :string
#  companyname          :string
#  department           :string
#  officelocation       :string
#  profession           :string
#  businesshomepage     :string
#  assistantname        :string
#  manager              :string
#  homephones           :string
#  mobilephone          :string
#  businessphones       :string
#  homeaddress          :string
#  businessaddress      :string
#  otheraddress         :string
#  outlook_user_id      :string
#  visibility           :string           default("true")
#  lastmodifieddatetime :string
#  contact_id           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Contact < ApplicationRecord
include PgSearch
  pg_search_scope :search_by_title, :against => :contact_email, using: { tsearch: { any_word: true } }
  # [:contact_email, :contact_firstname,:contact_lastname]

end
