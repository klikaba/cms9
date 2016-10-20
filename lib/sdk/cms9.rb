# module Cms9

#   class Cms9Decorator
#     def initialize(model)
#       @db_model = model
#     end

#     def model
#       @db_model
#     end

#     def id
#       @db_model.id
#     end

#     def created_at
#       @db_model.created_at
#     end

#     def updated_at
#       @db_model.updated_at
#     end
#   end

#   class FieldDefinitionModel < Cms9Decorator
#     def name
#       @db_model.name
#     end

#     def required?
#       @db_model.required
#     end

#     def type
#       @db_model.field_type
#     end

#     # TODO - Implement multi-values as custom data - make hierarchy based on fieldType
#   end

#   class PostDefinitionModel < Cms9Decorator

#     # Get Definition name
#     def name
#       model.name
#     end

#     # List all fields
#     def fields()
#       if @cache_fields.nil?
#         @cache_fields = model.post_fields.map { |field| FieldDefinitionModel.new(field) }
#                                          .map { |field| [field.name, field] }
#                                          .to_h
#       end

#       @cache_fields.values
#     end


#     # Get field by name
#     def field(name)
#       fields()
#       @cache_fields[name]
#     end

#     def posts()
#       model.posts.map { |post_model| PostModel.new(post_model, self) }
#     end

#     # Get all post definitions
#     def self.all()
#       Cms9::PostDefinition.all.map { |model| PostDefinitionModel.new(model) }
#     end

#     # Get post definition by name
#     def self.by_name(name)
#       model = Cms9::PostDefinition.where(name: name).first
#       model.nil? ? nil : PostDefinitionModel.new(model)
#     end

#     # Get post definition by name
#     def self.find(id)
#       model = Cms9::PostDefinition.where(id: id).first
#       model.nil? ? nil : PostDefinitionModel.new(model)
#     end
#   end

#   class FieldModel < Cms9Decorator

#     def initialize(model, field_definition_model)
#       super(model)
#       @field_definition_model = field_definition_model
#     end

#     def field_definition
#       @field_definition_model
#     end

#     def type
#       model.type
#     end

#   end


#   class PostModel < Cms9Decorator
#     def initialize(post, post_definition_model)
#       @cache_fields = nil
#       @post_definition_model = post_definition_model
#       super(post)
#     end

#     def fields()
#         # TODO - Make it more clear
#         @cache_fields ||=  model.fields
#                                 .joins(:post_field).includes(:post_field)
#                                 .map { |field| [field.post_field.name, FieldModel.new(field, field.post_field) ] }
#                                 .to_h
#       end
#       @cache_fields.values
#     end

#     def field(name)
#       fields()
#       @cache_fields[name]
#     end

#     def self.find(id)
#       PostModel.new(Cms9::Post.find(id))
#     end

#     def self.all()
#       Cms9::Post.include(fields: :post_fields).all.map { |model| PostModel.new(model) }
#     end
#   end


# end
