class CreateRaw < Neo4j::Migrations::Base
  def up
    add_constraint :Raw, :uuid
  end

  def down
    drop_constraint :Raw, :uuid
  end
end
