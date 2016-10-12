module Cms9
  class PostFieldsController < Cms9::ApplicationController
    def new
      @field = PostField.new
      @field.post_definition_id = params[:post_definition_id]
    end

    def create
      @field = PostField.new(post_field_params)

      if PostField.where(name: @field[:name], post_definition_id: @field[:post_definition_id]).blank?
        if @field[:field_type] == 'select_single' || @field[:field_type] == 'select_multiple'
          @field.metadata = ''
          values = params[:multi_values]

          values.each_with_index do |value, index|
            if value != ''
              if index == 0
                @field.metadata = value
              elsif
                @field.metadata = @field.metadata + ',' + value
              end
            end
          end
        elsif @field[:field_type] != 'select_single' && @field[:field_type] != 'select_multiple' && @field[:field_type] != 'image'
          @field.metadata = nil
        end

        if @field.save
          redirect_to edit_post_definition_path(id: @field.post_definition_id)
        else
          render :new
        end
      else
        @field.errors.add(:name, "of field already exist")
        render :new
      end
    end

    def edit
      @field = PostField.find(params[:id])
      @post_name = params[:post]

      if PostField.all_types.index(params[:type]) != nil
        @field.field_type = params[:type]
      end

      if params[:field_name] != nil
        @field.name = params[:field_name]
      end
    end

    def update
      @field = PostField.find(params[:id])
      field = PostField.where(name: post_field_params[:name], post_definition_id: @field[:post_definition_id])

      if field.blank? || field.pluck(:id)[0].to_s == params[:id]
        if @field[:field_type] == 'select_single' || @field[:field_type] == 'select_multiple'
          @field.metadata = ''
          values = params[:multi_values]

          values.each_with_index do |value, index|
            if value != ''
              if index == 0
                @field.metadata = value
              elsif
                @field.metadata = @field.metadata + ',' + value
              end
            end
          end

          params[:post_field][:metadata] = @field.metadata

        elsif @field[:field_type] != 'select_single' && @field[:field_type] != 'select_multiple' && @field[:field_type] != 'image'
          @field.metadata = nil
        end

        if @field.update(post_field_params)
          redirect_to edit_post_definition_path(id: @field.post_definition_id)
        else
          render :edit
        end
      else
        @field.errors.add(:name, "of field already exist")
        render :edit
      end
    end

    def destroy
      @field = PostField.find(params[:id])
      @field.destroy

      redirect_to request.referrer
    end

    private
      def post_field_params
        params.require(:post_field).permit(:name, :field_type, :post_definition_id, :required, :metadata)
      end
  end
end
