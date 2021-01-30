require 'rails_helper'
require 'spec_helper'

# RSpec.configure {|c| c.before { expect(controller).not_to be_nil }
# config.include Devise::Test::ControllerHelpers, type: :controller}
RSpec.configure do |config|
 config.include Devise::Test::ControllerHelpers, type: :controller
 
end

RSpec.describe UserEventsController, type: :controller do
	

describe "POST #Create" do
	before do
		@user = User.create(id:5 ,name: "aaaaaaaaa")
		@user_event = { name: "random", 
			description: "random des",
			location: "india", 
			start_date: "2021-01-10", 
			end_date: "2021-01-20",
			duration: "10",
			status: "D"}
		end
		
		it "should return http success" do
			post :create, :user_event => @user_event, :format => 'html'
			expect(flash[:notice]).to eql("User event was successfully updated.")
		end

	end


	describe "PUT #Update user event" do
    before do
      @user_event = Fabricate(:user_event)
    end

    it "should return http success" do
      put :update, id: @user_event.id, user_event: { name: "random", 
                       description: "wowwwww",
                       location: "india", 
                       start_date: "2021-01-10", 
											 end_date: "2021-01-20",
											 duration: "10",
											 status: "D"}
      expect(response).to be_success
    end
  end

end