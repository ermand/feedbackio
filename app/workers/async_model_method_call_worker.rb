class AsyncModelMethodCallWorker
  include Sidekiq::Worker

  def perform(model, entity_id, method, *args)
    model = model.camelize.constantize
    resource = model.find(entity_id)
    resource.send(method.to_s, *args)
  end
end