class CreateRawInventory < Neo4j::Migrations::Base
  def up
    add_constraint :RawInventory, :uuid
  end

  def down
    drop_constraint :RawInventory, :uuid
  end
end
