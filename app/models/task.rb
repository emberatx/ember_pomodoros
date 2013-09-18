class Task < ActiveRecord::Base

  before_save :check_completed_status

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

  def completed?
    completed_at.present?
  end

  private
  def check_completed_status
    if self.status_changed?
      if self.status == "completed"
        self.completed_at = Time.now
      else
        self.completed_at = nil
      end
    end
  end
end
