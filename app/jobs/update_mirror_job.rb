class UpdateMirrorJob < ActiveJob::Base
  queue_as :default

  def perform(mirror_id)
    mirror = Mirror.find mirror_id

    pusher_client.trigger(mirror.id, 'update', {})
  end

  private

  def pusher_client
    @pusher_client ||= Pusher::Client.from_env
  end
end
