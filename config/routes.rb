Rails.application.routes.draw do

	get 'welcome/index'

	resources :articles do
		resources :comments
		resources :feedbacks
	end
	
	root 'welcome#index'  

end
