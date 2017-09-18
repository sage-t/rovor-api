class Deal < ApplicationRecord
  belongs_to :alerts, optional: true

  # Destroy all deals without an alert_id and over a day old
  def self.destroy_old_and_orphaned
    Deal.delete_all(["alert_id IS NULL AND updated_at < ?", 1.days.ago])
  end

  def self.destroy_old
    Deal.delete_all(["updated_at < ?", 1.days.ago])
  end

end
