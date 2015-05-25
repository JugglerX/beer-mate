require 'spec_helper'

describe 'index_controller' do

  describe 'GET /' do
    it "shows the home page" do
      get '/'
      expect(last_response).to be_ok
    end
  end

end


describe 'User' do
  it 'should have a password' do
    robbob = User.create(username: 'robbob', password: 'whatever')
    expect(robbob.password).to eq('whatever')
  end
end

describe 'Pour' do
  it 'should lookup a beer by name via the Brewery DB API and return a JSON package that includes that name' do
    p beer = Pour.lookup("Endeavour")
    p beer = beer["data"][0]["name"]
    expect(beer).to eq("Endeavour")
  end

  it 'should turn the JSON package into a Beer object in Activerecord' do
    beer = Pour.lookup("Endeavour")
    draft_beer = Pour.brew
    p draft_beer
    p draft_beer[:id]
    expect(Beer.find(draft_beer[:id])).to be true
  end
end
