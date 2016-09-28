module ApiMonkey
  class DeleteResourcesController < ::ApiMonkey::Controller
    def destroy_sub_resource
      render_resource sub_resource.destroy
    end

    def destroy_resource
      render_resource resource.destroy
    end
  end
end
