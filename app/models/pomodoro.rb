class Pomodoro < ActiveRecord::Base
  STATUSES = {
    in_progress: "in_progress",
    completed: "completed",
    abandoned: "abandoned"
  }

  belongs_to :task
  validates :status, inclusion: {in: STATUSES.values}

  def self.completed_today
    where(status: STATUSES[:completed])
    .where(completed_at: Date.today.beginning_of_day .. Date.today.end_of_day)
  end

  def self.abandoned_today
    where(status: STATUSES[:abandoned])
    .where(completed_at: Date.today.beginning_of_day .. Date.today.end_of_day)
  end

  def completed?
    status == STATUSES[:completed]
  end

  def start!
    started_at = Time.now
    status = STATUSES[:in_progress]
    save!
  end

  def complete!
    completed_at = Time.now
    status = STATUSES[:completed]
    save!
  end

  def abandon!
    status = STATUSES[:abandoned]
    save!
  end
end
