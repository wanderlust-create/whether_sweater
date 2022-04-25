require 'rails_helper'
RSpec.describe UnsplashBackgroundPhoto do
  it 'exists with attributes' do
    photo_data = {
      "total": 10_000,
      "total_pages": 10_000,
      "results": [
        {
          "id": 'uILhNE1VcwA',
          "urls": {
            "raw": 'https://images.unsplash.com/photo-1465256410760-10640339c72c?ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1',
            "full": 'https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=85',
            "regular": 'https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=80&w=1080',
            "small": 'https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=80&w=400',
            "thumb": 'https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=80&w=200',
            "small_s3": 'https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1465256410760-10640339c72c'
          },
          "links": {
            "self": 'https://api.unsplash.com/photos/uILhNE1VcwA',
            "html": 'https://unsplash.com/photos/uILhNE1VcwA',
            "download": 'https://unsplash.com/photos/uILhNE1VcwA/download?ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA',
            "download_location": 'https://api.unsplash.com/photos/uILhNE1VcwA/download?ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA'
          },
          "categories": [],
          "likes": 1410,
          "liked_by_user": false,
          "current_user_collections": [],
          "topic_submissions": {
            "wallpapers": {
              "status": 'approved',
              "approved_on": '2020-06-22T08:26:25-04:00'
            },
            "nature": {
              "status": 'approved',
              "approved_on": '2020-04-06T10:20:13-04:00'
            }
          },
          "user": {
            "id": '5hhfGTLfkZg',
            "updated_at": '2022-04-22T16:40:06-04:00',
            "username": 'sanzolome',
            "name": 'Andrés Sanz',
            "first_name": 'Andrés',
            "last_name": 'Sanz',
            "twitter_username": 'sanzolome',
            "location": 'México',
            "links": {
              "self": 'https://api.unsplash.com/users/sanzolome',
              "html": 'https://unsplash.com/@sanzolome',
              "photos": 'https://api.unsplash.com/users/sanzolome/photos',
              "likes": 'https://api.unsplash.com/users/sanzolome/likes',
              "portfolio": 'https://api.unsplash.com/users/sanzolome/portfolio',
              "following": 'https://api.unsplash.com/users/sanzolome/following',
              "followers": 'https://api.unsplash.com/users/sanzolome/followers'
            }
          }
        }
      ]
    }

    photo = UnsplashBackgroundPhoto.new(photo_data)
    expect(photo).to be_a UnsplashBackgroundPhoto
    expect(photo.id).to eq('uILhNE1VcwA')
    expect(photo.url).to eq('https://images.unsplash.com/photo-1465256410760-10640339c72c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxtZXhpY28lMjBsYW5kc2NhcGV8ZW58MHwwfHx8MTY1MDg0Nzc4MA&ixlib=rb-1.2.1&q=85')
    expect(photo.artist).to eq('Andrés Sanz')
    expect(photo.portfolio).to eq('https://api.unsplash.com/users/sanzolome/portfolio')
  end
end
