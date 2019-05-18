Rails.application.routes.draw do

	get 'welcome/index'

	resources :articles do
		resources :comments
		resources :feedbacks
	end

	resources :users do
		collection do
			post :import
		end
	end
	
	root 'welcome#index'  

end
