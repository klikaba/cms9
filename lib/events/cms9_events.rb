module Cms9
  class Cms9Events

    def create_event(event_type, event_id, action, user, del_name)
      post_definition_id = nil
      post_id = nil

      user_info = [ user.id, user.email ? user.email : nil ]

      case event_type
        when 'post_definition'
          post_definition_id = event_id
        when 'post'
          post_id = event_id
      end

      @event = Event.new({
        'user': user_info,
        'action': action,
        'post_definition_id': post_definition_id,
        'post_id': post_id,
        'deleted_field': del_name
      })

      if @event.save
        if del_name != nil
          if event_type == 'post_definition'
            Event.where(post_definition_id: post_definition_id).update_all(deleted_field: del_name)
          elsif event_type == 'post'
            Event.where(post_id: post_id).each do |event|
              event.update(deleted_field: del_name)
            end
          end
        end
      end
    end

    def get_title_value_for_post(post_id)
      return @post = Cms9::Field.where(post_id: post_id)[0]
    end

    def timeline_events
      Event.order('created_at desc').limit(20)
    end
  end
end
