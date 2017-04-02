module Cms9
  # post fields controller
  class PostFieldsController < Cms9::ApplicationController
    def new
      @field = PostField.new
      @field.post_definition_id = params[:post_definition_id]
    end

    # rubocop:disable all
    def create
      @field = PostField.new(post_field_params)
      @field.user_id = current_user.id

      if PostField.where(name: @field[:name],
                         post_definition_id: @field[:post_definition_id]).blank?
        if %w(select_single select_multiple).include?(@field[:field_type])
          @field.metadata = ''
          values = params[:multi_values]

          values.each_with_index do |value, index|
            if value != '' && index.zero?
              @field.metadata = value
            elsif !index.zero?
              @field.metadata = @field.metadata + ',' + value
            end
          end
        elsif !%w(select_single select_multiple image)
              .include?(@field[:field_type])
          @field.metadata = nil
        end

        if @field.save
          create_post_field_event
          redirect_to edit_post_definition_path(id: @field.post_definition_id)
        else
          render :new
        end
      else
        @field.errors.add(:name, 'of field already exist')
        render :new
      end
    end

    def edit
      @field = PostField.find(params[:id])
      @post_name = params[:post]
      @field.field_type = params[:type] unless PostField.all_types
                                                        .index(params[:type])
                                                        .nil?
      @field.name = params[:field_name] unless params[:field_name].nil?
    end

    def update
      @field = PostField.find(params[:id])
      @field.user_id = current_user.id
      field = PostField.where(name: post_field_params[:name],
                              post_definition_id: @field[:post_definition_id])

      if field.blank? || field.pluck(:id)[0].to_s == params[:id]
        check_selectors
        if @field.update(post_field_params)
          create_post_field_event
          redirect_to edit_post_definition_path(id: @field.post_definition_id)
        else
          render :edit
        end
      else
        @field.errors.add(:name, 'of field already exist')
        render :edit
      end
    end

    def destroy
      @field = PostField.find(params[:id])
      @field.destroy
      create_post_field_event
      redirect_to request.referrer
    end

    private

    def create_post_field_event
      Cms9Events.new.create_event('post_definition',
                                  @field[:post_definition_id], 'update',
                                  current_user, nil)
    end

    def check_selectors
      if check_single_multiple
        @field.metadata = ''
        params[:multi_values].each_with_index do |value, index|
          if value != '' && index.zero?
            @field.metadata = value
          elsif !index.zero?
            @field.metadata = @field.metadata + ',' + value
          end
        end
        params[:post_field][:metadata] = @field.metadata
      elsif check_select_image
        @field.metadata = nil
      end
    end

    def check_single_multiple
      ['select_single', 'select_multiple'].include?(@field[:field_type])
    end

    def check_select_image
      !['select_single', 'select_multiple', 'image'].include?(@field[:field_type])
    end

    def post_field_params
      params.require(:post_field).permit(:name, :field_type,
                                         :post_definition_id,
                                         :required, :metadata)
    end
  end
end
