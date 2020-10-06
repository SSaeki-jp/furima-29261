Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only: [:index, :create]
  end
  # 商品購入のときに使用？
  # 「member」とは、「resources以外のメソッドを任意の名前で追加したい（アクションを一つだけ追加したい）」且つ「id情報を伴うURIを生成したい」時に使用
  # resources :items, only: :order do
  #   post 'order', on: :member
  # end

end
