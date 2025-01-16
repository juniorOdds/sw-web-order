class CreateKeycloakServices < ActiveRecord::Migration[7.1]
  def change
    create_table :keycloak_services do |t|

      t.timestamps
    end
  end
end
