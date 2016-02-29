require 'addressable'
require 'rest-client'
require 'byebug'


# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s


def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { user: { name: "Gizmo", email: 'cat@cat.com' } }
    )
  rescue RestClient::Exception => e
    puts e.message
  end

end
#create_user

def update
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/4.json'
  ).to_s
  puts RestClient.put(url, user: {name: 'Sennacy'})
  #User.all.first.update(name: 'Spot')
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/6.json'
  ).to_s
  begin
    puts RestClient.delete(url)
  rescue RestClient::Exception => e
    puts e.message
  end
end

destroy_user
