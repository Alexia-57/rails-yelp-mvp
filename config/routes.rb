Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create, :new] ## :index ## :show  ##:new,
  end
end

### restaurant_reviews    GET  /restaurants/:restaurant_id/reviews(.:format)      reviews#index
# restaurant_reviews    POST /restaurants/:restaurant_id/reviews(.:format)      reviews#create
### new_restaurant_review GET  /restaurants/:restaurant_id/reviews/new(.:format)  reviews#new
### restaurant_review     GET  /restaurants/:restaurant_id/reviews/:id(.:format)  reviews#show
# restaurants           GET  /restaurants(.:format)                             restaurants#index
#                       POST /restaurants(.:format)                             restaurants#create
# new_restaurant        GET  /restaurants/new(.:format)                         restaurants#new
# restaurant            GET  /restaurants/:id(.:format)                         restaurants#show
