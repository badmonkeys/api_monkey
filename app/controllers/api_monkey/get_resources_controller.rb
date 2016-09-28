module ApiMonkey
  class GetResourcesController < ::ApiMonkey::Controller
    def show_sub_resource
      render json: sub_resource
    end

    def index_sub_resource
      render json: sub_resource_class.all
    end

    def show_resource
      render json: resource
    end

    def index_resource
      render json: resource_class.all
    end
  end
end
