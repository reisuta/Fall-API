class MobileContract < ApplicationRecord
  validates :company_name, presence: true
  validates :month_cost, presence: true
  validates :contract_detail, presence: true
  validate :ended_at_validation
end

def ended_at_validation
  errors.add(:ended_at, '終了日時は開始日時よりも後を設定してください') if started_at.present? && ended_at.present? && started_at > ended_at
end
