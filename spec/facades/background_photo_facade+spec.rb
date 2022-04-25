require 'rails_helper'
RSpec.describe BackgroundPhotoFacade, :vcr do
  describe 'class methods' do
    describe '#photo' do
      it 'will return a background photo url' do

        photo = BackgroundPhotoFacade.photo('Mexico City')
        expect(photo).to be_a UnsplashBackgroundPhoto
        expect(photo.url).to_not be_nil
      end
    end
  end
end
