# == Schema Information
#
# Table name: master_contacts
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
#  visibility           :string           default("PUBLIC")
#  lastmodifieddatetime :string
#  contact_id           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class MasterContact < ApplicationRecord
end
