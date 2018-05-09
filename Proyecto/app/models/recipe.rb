class Recipe 
  include Neo4j::ActiveNode
  property :name, type: String
  property :quantity, type: Float
  property :measure, type: String
  property :cost, type: Float, default: 0.0

  # before_create :add_materials_cost
  before_validation :add_materials_cost, on: :create

  # scope :available_products, :products -> { where(:expired => false)}
  # Ex:- scope :active, -> {where(:active => true)}

  # Relations
  has_many :in, :recipe_materials, origin: :recipe, dependent: :destroy
  has_many :in, :products, origin: :recipe, dependent: :destroy  

  # def available_products
  #   available_products = []
  #   self.products.each do |p|
  #     p.expired == false ? available_products << p : next
  #   end
  #   available_products
  # end

  # Nested raw_materials
  def recipe_materials_attributes=(attributes)
    @recipe_materials ||= []
    attributes.each do |i, material_params|
      if material_params["_destroy"] == '1' && !material_params["id"].nil?
        # Delete relation
        RecipeMaterial.find(material_params["id"]).destroy
      elsif material_params["_destroy"] == '0'
        material_params.delete "_destroy" 
        # puts material_params
        if material_params["id"].nil?
          # New relation
          material_params.delete "id"  
          material = RecipeMaterial.create(quantity: material_params["quantity"])

          raw = Raw.find(material_params["raw_id"])
          material.raw = raw

          if !self.cost.nil?
            value = self.cost
            value += (material.quantity * material.raw.cost)
            self.update cost: value
          end

          self.recipe_materials << material
        else
          # Update relation
          RecipeMaterial.find(material_params["id"]).update(quantity: material_params["quantity"])
        end
      end
    end
  end


  private

  def add_materials_cost
    value = 0.0
    self.recipe_materials.each do |m| 
      value += (m.quantity * m.raw.cost)
    end
    self.cost = value
  end

end
