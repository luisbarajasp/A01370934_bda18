class Product 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  property :expired_at, type: Date
  property :expired, type: Boolean, default: false  
  
  validate :validates_inventories
  before_create :create_product
  before_save :check_expiring

  scope :available, -> { where(:expired => false)}
  # Ex:- scope :active, -> {where(:active => true)}

  # Relations
  has_one :out, :recipe, type: :has_recipe
  has_many :out, :raw_inventories, type: :has_inventory

  def check_expiring
    if self.expired_at < Date.today && !self.expired
      self.expired = true
    end
  end

  private
  def validates_inventories
    self.recipe.recipe_materials.each do |material|
      remaining = material.quantity
      material.raw.inventories_asc.each do |inventory|
        left = inventory.quantity_left - remaining
        if left > 0 
          # There is more than enough to fulfill
          remaining = 0
          break
        elsif left == 0
          # There is exactly enough to fulfill
          remaining = 0
          break
        else 
          # There is less thna enough to fulfill
          remaining = -left
        end
      end
      if remaining > 0
        errors.add(:base, "You do not have enough inventory of #{material.raw.name} for this recipe")
      end
    end
  end

  def create_product
    self.recipe.recipe_materials.each do |material|
      remaining = material.quantity
      material.raw.inventories_asc.each do |inventory|
        left = inventory.quantity_left - remaining
        if left > 0 
          # There is more than enough to fulfill
          self.raw_inventories << inventory
          inventory.update quantity_left: left
          remaining = 0
          break
        elsif left == 0
          # There is exactly enough to fulfill
          self.raw_inventories << inventory
          inventory.update quantity_left: left
          remaining = 0
          break
        else 
          # There is less thna enough to fulfill
          self.raw_inventories << inventory
          inventory.update quantity_left: 0
          remaining = -left
        end
      end
    end
  end
end
