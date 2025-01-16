class DeleteTableKeycloakService < ActiveRecord::Migration[7.1]
  def change
    drop_table :keycloak_services
  end
end
