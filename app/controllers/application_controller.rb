class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

    get '/bakeries' do
       # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
    end

    get '/bakeries/:id' do

    bakery = Bakery.find(params[:id])

    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.order(price: :desc )

    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.order(:price)

    most_expensive = baked_goods.last

    most_expensive.to_json
  end
end
