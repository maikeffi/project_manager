class Person < ActiveRecord::Base
  
  has_many :roles
  has_many :projects, :through => :roles
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  before_save :clean_up
  
  
  def name
    "#{first_name} #{last_name}"
  end
  
  private 
  
  def clean_up
    self[:first_name] = self[:first_name].capitalize
  end
  
end
