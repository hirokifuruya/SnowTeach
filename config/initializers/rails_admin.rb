RailsAdmin.config do |config|
  config.asset_source = :webpacker

  ### Popular gems integration

  ## == Devise ==
    config.authenticate_with do
      warden.authenticate! scope: :user
    end
    config.current_user_method(&:current_user)

  ## == CancanCan ==
    config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'Favorite' do
    label 'お気に入り'
  end

  config.model 'Label' do
    label 'ラベル'
  end

  config.model 'Labeling' do
    label 'ラベリング'
  end

  config.model 'Recruit' do
    label '募集'
  end

  config.model 'Request' do
    label 'リクエスト'
  end

  config.model 'Role' do
    label 'ロール'
  end

  config.model 'Skiresort' do
    label 'スキー場'
  end

  config.model 'User' do
    label 'ユーザー'
  end
end
