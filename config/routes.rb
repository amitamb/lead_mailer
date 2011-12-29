LeadMailer::Application.routes.draw do
  resources :lead_mails do
    collection do
      match :event
    end
  end
  root :to => "lead_mails#index"
end
