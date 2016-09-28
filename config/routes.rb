ApiMonkey::Engine.routes.draw do
  get '/:resource/:resource_id/:sub_resource/:sub_resource_id', to: 'get_resources#show_sub_resource'
  get '/:resource/:resource_id/:sub_resource',                  to: 'get_resources#index_sub_resource'
  get '/:resource/:resource_id',                                to: 'get_resources#show_resource'
  get '/:resource',                                             to: 'get_resources#index_resource'

  post '/:resource/:resource_id/:sub_resource', to: 'post_resources#create_sub_resource'
  post '/:resource',                            to: 'post_resources#create_resource'

  put '/:resource/:resource_id/:sub_resource/:sub_resource_id', to: 'put_resources#update_sub_resource'
  put '/:resource/:resource_id',                                to: 'put_resources#update_resource'

  delete '/:resource/:resource_id/:sub_resource/:sub_resource_id', to: 'delete_resources#destroy_sub_resource'
  delete '/:resource/:resource_id',                                to: 'delete_resources#destroy_resource'
end
