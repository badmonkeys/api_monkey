require 'requests_helper'

describe 'Posts requests' do
  let(:post_object) { FactoryGirl.create(:post) }
  let(:title) { 'Test Title' }
  let(:body)  { 'Test Body' }

  describe 'GET /posts' do
    let!(:post_list) { FactoryGirl.create_list(:post, 2) }

    before { get '/posts', as: :json }

    it 'should return all posts' do
      expect(json.count).to eq post_list.count
    end
  end

  describe 'GET /posts/:id' do
    it 'should return the post' do
      get "/posts/#{post_object.id}", as: :json
      expect(json['id']).to eq    post_object.id
      expect(json['title']).to eq post_object.title
      expect(json['body']).to eq  post_object.body
    end
  end

  describe 'POST /post' do
    let(:user) { FactoryGirl.create(:user) }
    let(:post_params) do
      {
        params: {
          data: {
            type: 'posts',
            attributes: {
              title: title,
              body:  body,
              user_id: user.id
            }
          }
        },
        as: :json
      }
    end

    it 'should create a new post' do
      expect{ post '/posts', post_params }.to change{ Post.count }
      expect(json['id']).to eq Post.last.id
    end

    it 'should set title' do
      post '/posts', post_params
      expect(json['title']).to eq title
    end

    it 'should set body' do
      post '/posts', post_params
      expect(json['body']).to eq body
    end
  end

  describe 'PUT /post/:id' do
    let(:put_params) do
      {
        params: {
          data: {
            id: post_object.id,
            type: 'posts',
            attributes: {
              title: 'my new titles',
              body:  'my new body'
            }
          }
        }, as: :json
      }
    end

    it 'should change the title' do
      expect{ put "/posts/#{post_object.id}", put_params }.to change{ post_object.reload.title }
    end

    it 'should change the body' do
      expect{ put "/posts/#{post_object.id}", put_params }.to change{ post_object.reload.body }
    end
  end

  describe 'DELETE /post/:id' do
    before { post_object }

    it 'should delete the post' do
      expect{ delete "/posts/#{post_object.id}" }.to change{ Post.count }.by(-1)
    end

  end
end
