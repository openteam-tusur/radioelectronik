Rails.application.config.session_store :redis_session_store, :serializer => :json, :redis => Settings['session_store'].to_hash, :domain => Settings['app.domain']
