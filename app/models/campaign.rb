class Campaign < ApplicationRecord
  has_many :loans
  has_many :investors, through: :loans, class_name: "User" 
end
