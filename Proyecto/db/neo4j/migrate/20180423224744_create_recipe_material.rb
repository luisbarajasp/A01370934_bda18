class CreateRecipeMaterial < Neo4j::Migrations::Base
  def up
    add_constraint :RecipeMaterial, :uuid
  end

  def down
    drop_constraint :RecipeMaterial, :uuid
  end
end
