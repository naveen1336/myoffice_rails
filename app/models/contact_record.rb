# == Schema Information
#
# Table name: contact_records
#
#  id         :integer          not null, primary key
#  contact_id :text
#  master_id  :text
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactRecord < ApplicationRecord
end
