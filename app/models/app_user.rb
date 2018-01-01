# == Schema Information
#
# Table name: app_users
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AppUser < ApplicationRecord
end
