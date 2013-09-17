class Task < ActiveRecord::Base
  STATUSES = {
    not_started: "not_started",
    in_progress: "in_progress",
    completed: "completed",
    archived: "archived"
  }

  has_many :pomodoros
  validates :status, inclusion: {in: STATUSES.values}

  def self.visible
    where.not(status: STATUSES[:archived])
  end

  def self.completed_poms
    pomodoros.where(status: Pomodoro::STATUSES[:completed])
  end

  def self.interruptions
    pomodoros.where(status: Pomodoro::STATUSES[:abandoned])
  end

  def increment_estimate!
    self.estimate += 1
    self.save!
  end

  def decrement_estimate!
    self.estimate -= 1
    self.save!
  end

  def completed?
    completed_at.present?
  end

  def complete
    self.completed_at = Time.now
    self.status = STATUSES[:completed]
    self.save
  end

  def archive!
    self.status = STATUSES[:archived]
    self.save!
  end
end
