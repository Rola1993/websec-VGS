Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/data' => 'example#curl_data', via: :post
  match '/send' => 'example#curl_send', via: :post
end
