# frozen_string_literal: true

class AddAuthenticatableReferencesToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts,
                  :authenticatable,
                  polymorphic: true,
                  index: true,
                  null: false
  end
end
