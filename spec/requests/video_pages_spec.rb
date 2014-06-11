require 'spec_helper'

describe "Video pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "video creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a video" do
        expect { click_button "Post" }.not_to change(Video, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'video_content', with: "https://www.youtube.com/watch?v=Pv-Do30-P8A" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Video, :count).by(1)
      end
    end
  end
end