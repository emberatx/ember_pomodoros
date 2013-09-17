class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.string :status
      t.integer :task_id
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
