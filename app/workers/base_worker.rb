class BaseWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'take_off_processing'
end
