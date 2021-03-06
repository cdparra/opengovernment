class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.references :person, :null => false
      t.references :state
      t.references :district
      t.references :chamber
      t.references :session
      t.integer :senate_class
      t.string :party
      t.date :start_date
      t.date :end_date
      t.timestamps
    end

    execute "ALTER TABLE roles
      ADD CONSTRAINT role_person_fk
      FOREIGN KEY (person_id) REFERENCES people (id);"

    execute "ALTER TABLE roles
      ADD CONSTRAINT role_state_fk
      FOREIGN KEY (state_id) REFERENCES states (id);"

    execute "ALTER TABLE roles
      ADD CONSTRAINT role_district_fk
      FOREIGN KEY (district_id) REFERENCES districts (id);"

    execute "ALTER TABLE roles
      ADD CONSTRAINT role_chamber_fk
      FOREIGN KEY (chamber_id) REFERENCES chambers (id);"

    execute "ALTER TABLE roles
      ADD CONSTRAINT role_session_fk
      FOREIGN KEY (session_id) REFERENCES sessions (id);"

  end

  def self.down
    execute "ALTER TABLE roles DROP CONSTRAINT role_session_fk;"
    execute "ALTER TABLE roles DROP CONSTRAINT role_chamber_fk;"
    execute "ALTER TABLE roles DROP CONSTRAINT role_district_fk;"
    execute "ALTER TABLE roles DROP CONSTRAINT role_state_fk;"
    execute "ALTER TABLE roles DROP CONSTRAINT role_person_fk;"
    execute "ALTER TABLE roles DROP CONSTRAINT place_xor;"

    drop_table :roles
  end
end
