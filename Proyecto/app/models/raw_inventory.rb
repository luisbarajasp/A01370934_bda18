class RawInventory 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp
  include Neo4j::ActiveBase # Get a new Query object

  before_create :set_quantity_left
  validate :update_quantity_left, on: :update

  scope :active, -> { where(expired: false).where("result_raw_inventories.quantity_left > 0")}
  scope :expired, -> { where(expired: true) }
  scope :used, -> { where("result_raw_inventories.quantity_left > 0") }
  
  # Ex:- scope :active, -> {where(:active => true)}
  
  before_save :check_expiring

  property :quantity, type: Float
  property :quantity_left, type: Float
  property :expired_at, type: Date
  property :expired, type: Boolean, default: false

  # Relations
  has_one :out, :raw, type: :raw
  
  has_many :in, :products, origin: :raw_inventory, unique: true  

  def check_expiring
    if self.expired_at < Date.today && !self.expired
      self.expired = true
    end
  end

  private
  
  def set_quantity_left
    self.quantity_left = self.quantity
  end

  def update_quantity_left
    diff = self.quantity - self.quantity_was
    value = self.quantity_left + diff
    if value < 0
      errors.add(:quantity, " invalid value") 
    end
    self.quantity_left = value
  end
end
