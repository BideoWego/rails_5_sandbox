require 'rails_helper'

describe WidgetsController do
  let(:widget) { create(:widget) }


  before do
    request.env["HTTP_REFERER"] = root_url
  end


  describe 'GET #index' do
    it 'returns status of 200' do
      process :index
      expect(response.status).to eq(200)
    end
  end


  describe 'GET #show' do
    context 'the widget exists' do
      before do
        widget
      end


      it 'returns a status of 200' do
        process :show, :params => { :id => widget.id }
        expect(response.status).to eq(200)
      end
    end


    context 'the widget does not exist' do
      it 'redirects to back' do
        process :show, :params => { :id => 0 }
        expect(response).to redirect_to(root_url)
      end
    end
  end
end






