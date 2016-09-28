module ApiMonkey
  class Controller < ApiMonkey.parent_controller.constantize
    protect_from_forgery with: nil

    def render_resource(resource, opt={})
      if resource.respond_to?(:errors) && resource.errors.any?
        render json: resource,
          status: :unprocessable_entity,
          serializer: ActiveModel::Serializer::ErrorSerializer
      else
        render json: resource,
          status: opt[:status] || :ok
      end
    end

    #rescue_from NameError do |e|
    #  render json: { errors: [{ detail: "#{params[:resource]} is not a valid resource name"}] }, status: :not_found
    #end

    #rescue_from ActiveRecord::RecordNotFound do |e|
    #  render json: { errors: [{
    #    source: {
    #      pointer: 'data/id'
    #    },
    #    detail: e.message
    #  }]}
    #end

    protected

    def resource
      @resource ||= resource_class.find(params[:resource_id])
    end

    def sub_resource
      @sub_resource ||= sub_resource_class.find(params[:sub_resource_id])
    end

    def resource_class
      @resource_class ||= params[:resource].classify.constantize
    end

    def sub_resource_class
      @sub_resource_class ||= params[:sub_resource].classify.constantize
    end

    def resource_params
      params.require(:data).permit(:type, attributes: resource_class.accept_fields)
    end

    def sub_resource_params
      params.require(:data).permit(:type, attributes: sub_resource_class.accept_fields)
    end
  end
end
