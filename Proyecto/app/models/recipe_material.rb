class RecipeMaterial 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps # will give model created_at and updated_at timestamp

  # after_create :add_cost_to_recipe
  before_update :update_cost_to_recipe
  before_destroy :remove_cost_to_recipe

  property :quantity, type: Float

  # Relations
  has_one :out, :recipe, type: :has_recipe
  has_one :out, :raw, type: :has_raw
  
  # def add_cost_to_recipe
  #   value = self.recipe.cost
  #   value += (self.raw.cost * self.quantity)
  #   self.recipe.update cost: value
  # end

  private

  def update_cost_to_recipe
    value = self.recipe.cost
    value -= (self.raw.cost * self.quantity_was)
    value += (self.raw.cost * self.quantity)
    self.recipe.update cost: value
  end

  def remove_cost_to_recipe
    value = self.recipe.cost    
    value -= (self.raw.cost * self.quantity)
    self.recipe.update cost: value
  end

end
