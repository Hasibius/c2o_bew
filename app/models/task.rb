class Task < ApplicationRecord

  before_create :set_position
  after_destroy :update_positions

  def set_position
    max_postion = Task.maximum('position')
    self.position = max_postion.to_i + 1
  end

  def update_positions
    Task.where("position > #{self.position}").update_all('position = position - 1')
  end
end
