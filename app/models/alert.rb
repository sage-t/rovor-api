class Alert < ApplicationRecord
  has_many :deals

  # determines if a deal has been found and goes from there
  def new_deal_routine
    return if self.state == 0

    deal = Deal.order(:price).first
    if deal.price <= self.price_limit || self.auto_alert?
      
      self.update(state: 0)
      # delete deal
    end
  end

  # returns true if the alert should be activated
  def auto_alert?
    return false
  end

  def email_best_deal

  end

end
