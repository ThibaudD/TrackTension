class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :measures, dependent: :destroy

  MEASURE_SUBNISSIONS_NEEDED = 3

  def average_available?
    return measures.count >= MEASURE_SUBNISSIONS_NEEDED
  end

  def average_systolic
    if average_available?
      measures.average(:systolic).round(2)
    else
      nil
    end
  end

  def average_diastolic
    if average_available?
      measures.average(:diastolic).round(2)
    else
      nil
    end
  end

end
