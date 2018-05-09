class ForceCreateRawTypeIndex < Neo4j::Migrations::Base
  def up
    add_index :Raw, :type, force: true
  end

  def down
    drop_index :Raw, :type
  end
end
