module Cms9
  # Events for every action in administration part
  class Cms9Events
    def create_event(event_type, event_id, action, user, del_name)
      @post_definition_id = nil
      @post_id = nil

      check_event_type(event_type, event_id)

      @event = Event.new(
        user: [user.id, user.email ? user.email : nil], action: action,
        post_definition_id: @post_definition_id, post_id: @post_id,
        deleted_field: del_name
      )

      after_save(event_type) if @event.save && !del_name.nil?
    end

    def get_title_value_for_post(post_id)
      @post = Cms9::Field.where(post_id: post_id)[0]
    end

    def timeline_events(limit)
      if limit != 'all'
        Event.order('created_at desc').limit(limit)
      else
        Event.order('created_at desc')
      end
    end

    def after_save(event_type)
      if event_type == 'post_definition'
        Event.where(post_definition_id: @post_definition_id)
             .update_all(deleted_field: @event.deleted_field)
      elsif event_type == 'post'
        Event.where(post_id: @post_id)
             .update_all(deleted_field: @event.deleted_field)
      end
    end

    def check_event_type(event_type, event_id)
      case event_type
      when 'post_definition'
        @post_definition_id = event_id
      when 'post'
        @post_id = event_id
      end
    end
  end
end
