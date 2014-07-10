class Booking < ActiveRecord::Base
  include AASM
  belongs_to :bookable, polymorphic: true

  validates :starts_at, presence: true
  validate :starts_in_future
  validate :timeslot_not_taken

  aasm :column => 'booking_state', :whiny_transitions => false do
    state :request, :initial => true
    state :booked, :before_enter => :update_booked_at
    state :cancelled, :before_enter => :update_cancelled_at
    state :postponed

    event :book, :after => Proc.new { perform_notification(:booked) } do
      transitions :from => :request, :to => :booked
    end

    event :cancel, :after => Proc.new { perform_notification(:cancelled) } do
      transitions :from => :booked, :to => :cancelled
    end

    event :postpone, :after => Proc.new { perform_notification(:postponed) } do
      transitions :from => :booked, :to => :postponed
    end
  end

  private

  def update_booked_at
    self.booked_at = Time.now
  end

  def update_cancelled_at
    self.cancelled_at = Time.now
  end

  def starts_in_future
    if self.starts_at and self.starts_at < 15.minutes.from_now
      errors.add(:starts_at, 'must be at least 15 minutes from now')
    end
  end

  def timeslot_not_taken
    table_name = self.class.table_name
    if self.starts_at and self.ends_at
      if self.class.where("#{table_name}.starts_at <= ? AND #{table_name}.ends_at IS NULL OR #{table_name}.ends_at >= ?", self.starts_at, self.ends_at).any?
        errors.add(:base, "another #{self.class.to_s.downcase} has already been booked for the times you requested")
      end
    elsif self.starts_at
      if self.class.where("#{table_name}.starts_at <= ?", self.starts_at).any?
        errors.add(:base, "another #{self.class.to_s.downcase} has already been booked for the time you requested")
      end
    end
  end

  def perform_notification(notification_type)
    ActiveSupport::Notifications.instrument("#{self.class.table_name.to_s.downcase}.#{notification_type}", :object => self)
  end
end
