# frozen_string_literal: true

class TenantsController < ApplicationController
  def show
    tenant = Tenant.find(params[:id])
    @tenant_presenter = TenantPresenter.new(tenant)
  end
end
