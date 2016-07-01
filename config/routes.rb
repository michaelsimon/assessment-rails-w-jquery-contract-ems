Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :acts
  resources :contracts do
    resources :documents, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  resources :performances
  scope 'admin' do
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :venues

  post 'approvals/:id/approve' => 'approvals#approve', as: :contract_apvl_approve
  post 'approvals/:id/reject' => 'approvals#reject', as: :contract_apvl_reject
  post 'approvals/:id/cancel' => 'approvals#cancel', as: :contract_apvl_cancel
  root 'general#welcome'
end
