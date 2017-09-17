class Deal < ApplicationRecord
  belongs_to :alerts, optional: true
end
