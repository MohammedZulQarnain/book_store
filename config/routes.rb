Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sorted-books-publisher', to: 'books#sorted_books_publisher'
      get 'sorted-books-author', to: 'books#sorted_books_author'
      get 'total-price-books', to: 'books#total_price_of_all_books'
      get 'mla-citation-format', to: 'books#mla_citation_format'
      get 'cms-citation-format', to: 'books#cms_citation_format'
      resources :books, only: [:index, :show, :create, :destroy, :update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
