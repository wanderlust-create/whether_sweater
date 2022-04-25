require 'rails_helper'
RSpec.describe UnsplashBackgroundPhoto do
  it 'exists with attributes' do
    photo_data = {
                "raw": "https://images.unsplash.com/photo-1465256410760-10640339c72c?ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=80&w=200",
                "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1465256410760-10640339c72c"
            }

    photo = UnsplashBackgroundPhoto.new(photo_data)
    expect(photo).to be_a UnsplashBackgroundPhoto
    expect(photo.url).to eq("https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=85")
  end
end
