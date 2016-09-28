module ApiMonkey
  class PostResourcesController < ::ApiMonkey::Controller
    def create_sub_resource
      render_resource(sub_resource_class.create(sub_resource_params[:attributes]))
    end

    def create_resource
      render_resource(resource_class.create(resource_params[:attributes]))
    end
  end
end
