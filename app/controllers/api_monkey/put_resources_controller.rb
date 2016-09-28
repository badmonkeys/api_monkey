module ApiMonkey
  class PutResourcesController < ::ApiMonkey::Controller
    def update_sub_resource
      sub_resource.update(sub_resource_params[:attributes])
      render_resource(sub_resource)
    end

    def update_resource
      resource.update(resource_params[:attributes])
      render_resource(resource)
    end
  end
end
