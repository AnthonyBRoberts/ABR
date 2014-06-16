require 'spec_helper'

describe "Video pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "video creation" do
    before { visit "/videos/new" }

    describe "with invalid information" do

      it "should not create a video" do
        expect { click_button "Create Video" }.not_to change(Video, :count)
      end

      describe "error messages" do
        before { click_button "Create Video" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'video_link', with: "https://www.youtube.com/watch?v=Pv-Do30-P8A" }
      it "should create a video" do
        expect { click_button "Create Video" }.to change(Video, :count).by(1)
      end
    end
  end

  describe "video destruction" do
    before { FactoryGirl.create(:video) }
    before { visit "/videos" }

    it "should delete a video" do
      expect { click_link "delete" }.to change(Video, :count).by(-1)
    end
  end
end