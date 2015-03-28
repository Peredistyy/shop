class Order < ActiveRecord::Base

  PENDING = 1
  ON_ROAD = 2
  CLOSED = 3
  LOCKED = 4

  STATUSES = {
    PENDING => 'pending',
    ON_ROAD => 'on_road',
    CLOSED => 'closed',
    LOCKED => 'locked'
  }

  validates :contact_info, presence: true

  validates_inclusion_of :status, :in => STATUSES.keys,
                         :message => "{{value}} must be in #{STATUSES.values.join ','}"

  belongs_to :user
  has_many :order_items

  def status_name
    STATUSES[status]
  end

end
