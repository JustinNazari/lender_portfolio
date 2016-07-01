class User < ApplicationRecord
  has_many :loans, foreign_key: "investor_id"
end
