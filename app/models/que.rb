class Que < ActiveRecord::Base
  validates :name, presence: true

  def display_name
    "Mr. #{name}"
  end

  include Workflow
  workflow do
    state :new do
      event :nick_visit, transitions_to: :in_progress
    end
    state :in_progress do
      event :nick_leave, transitions_to: :completed
    end
    state :completed
  end  
end
