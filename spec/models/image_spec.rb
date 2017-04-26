require 'spec_helper'
require 'rails_helper'

RSpec.describe Image, type: :model do
     it "image require a title" do
          image = FactoryGirl.build(:image, :title => nil)
   	expect(image).to_not be_valid
     end

     it "image require a title of atleast 2 characters" do
     	image = FactoryGirl.build(:image, :title => "a")
   	expect(image).to_not be_valid
     end

     it "image require a title of atleast 2 characters" do
     	image = FactoryGirl.build(:image, :title => "ab")
   	expect(image).to be_valid
     end

     it "image require artist_name" do
          image = FactoryGirl.build(:image, :artist_name => nil)
     expect(image).to_not be_valid
     end

     it "image require a title of atleast 2 characters" do
          image = FactoryGirl.build(:image, :artist_name => "a")
     expect(image).to_not be_valid
     end

     it "image require artist_name of atleast 2 characters" do
     image = FactoryGirl.build(:image, :artist_name => "ab")
   	expect(image).to be_valid
     end

     it "image require artist_age" do
          image = FactoryGirl.build(:image, :artist_age => nil)
     expect(image).to_not be_valid
     end


     it "image require artist_age should not be 0" do
     image = FactoryGirl.build(:image, :artist_age => 0)
     expect(image).to_not be_valid
     end

     it "image require artist_age should not be negative integer" do
     image = FactoryGirl.build(:image, :artist_age => -12)
   	expect(image).to_not be_valid
     end

     it "image require artist_age should not be 0" do
     image = FactoryGirl.build(:image, :artist_age => 0)
   	expect(image).to_not be_valid
     end

     it "image belongs to a user" do
     image = FactoryGirl.build(:image, :user_id => nil)
     expect(image).to_not be_valid
     end

end
     # Image = FactoryGirl.create(:image)
# describe Image, 'validation' do
#
#   it { should ensure_length_of(:title).is_at_least(2) }
#   it { should validate_presence_of(:title) }
#   it { should validate_uniqueness_of(:title) }
#
#   it { should ensure_length_of(:artist_name).is_at_least(2) }
#   it { should validate_presence_of(:artist_name) }
#
#   it { should ensure_length_of(:artist_age).is_at_least(1) }
#   it { should validate_presence_of(:artist_age) }
#
#   it { should ensure_length_of(:artist_country).is_at_least(2) }
#   it { should validate_presence_of(:artist_country) }
#
#   # it { should belong_to(:user) }
# end
