Rails.application.routes.draw do
  resources :patients do
    collection do
      post :process_csv
      get :upload
      get :stats
    end
  end
  root "patients#upload"
  get 'migration_logs', to: 'migration_logs#index', as: 'migration_logs'
end
