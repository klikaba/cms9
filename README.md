![Cms9 Logo](https://raw.githubusercontent.com/klikaba/cms9/master/app/assets/images/cms9/cms9_logo_readme.png)

# Cms9

Small CMS Admin module for developers.

[Demo Application](https://github.com/klikaba/cms9-demo) running on Cms9.

## What Is Cms9?

Cms9 is not standard CMS - it is targeted for developers to ease process of embedding CMS functionality to any site.

Cms9 provides admin dashboard where user can:
* Define different types of forms (News, BlogPost, Ads, Jobs, ...)
* Adding user defined fields to forms
* Currently we are supporting following field types
  * Text field
  * Text Area (WYSIWYG-ed text area using ckedit)
  * Number
  * Choose Single
  * Choose Multiple
  * Date
  * Time
  * Date & Time
  * Image
* Manage data for each form

Cms9 does not have any functionality regarding displaying content - it is firstly there to provide Admin dashboard where data can be defined and managed. On the other side it exposes simple interface to access that data.

### Features
* Rails 5+
* Automatic form validation
* Events history (record actions like create/update/delete on Post Types and their Posts)
* Authentication customizable (via [Devise](https://github.com/plataformatec/devise) or similar frameworks)
* [Dragonfly](https://github.com/markevans/dragonfly) for handling images and other attachments
* [Ckeditor](https://github.com/galetahub/ckeditor) as default WYSIWYG text editor
* Bootstrap 3+ with Admin LTE template


## Getting Started

Add Cms9 to your Gemfile:

```ruby
# Gemfile
gem "cms9"
```

Run the installer:

```bash
$ rails generate cms9:install [DEF_ROUTE]
```

Where [DEF_ROUTE] is optional and presents where your Cms9 route will be mounted, by default it's /cms9

Install generator will mount Cms9 route, add current_user configurator initializer and additional configuration for Ckeditor.

Then run:

```bash
$ rails db:migrate
```

Open http://localhost:3000/cms9 to see your new Cms9 dashboard in action.

## Managing Content
Content is managed by creating Post Types (aka Post Definitions). Post Type represents form for specific data - in case of news site it can be *News Form* that have multiple fields for *Title*, *Content*, *CoverImage*, *PublishedStatus*. Each of those fields can be created from Dashboard.

Once Post Type with specific name is created and all fields are added CMS9 Admin can start creating data (Posts) based on those Post Types.

Cms9 doesn't have any functionality to display content but exposes simple interface to retrieving data. E.g inside News app you can access all Posts with:

```html
<% @Cms9::Post.each do |post| %>
  <%= post.field('Title) %>
<% end %>
```

You can make any kind of layout for your posts and showed them however you want. Once you made a simple layout, you are ready to create as many posts as you want. It's that easy.


## Data Interface
All Data Interface classes are ActveRecord models.

**Cms9::PostDefinition** - Represents Form Defintion e.g. News, Jobs, Ads,
**Cms9::PostField** - each PostDefinition contains multiple fields that describes type of data
**Cms9::Post** - Represents post with data. Each Post belongs to one of PostDefinitions
**Cms9::Field** - Represents value for each field and belongs to Post


#### Cms9::PostDefinition
Methods:
fields() - returns list of fields that defines PostDefinition
field(name) - returns field by name

E.g. If user Created PostDefinition called 'News' with Title and Content fields we can retrieve it by:

Cms9::PostDefinition.all - returns all post definitions
Cms9::PostDefinition.all.first.fields() - returns all fields for this Post Type
Cms9::PostDefinition.all.first.field('Title') - returns field that describes field named 'Title'

#### Cms9::PostFields
Class represents definition of Post Type field. Each class have 'name' (unique in context of one PostDefintion), 'Type' and extra parameters depending on type. Currently we are supporting following types: Text field, Text Area (WYSIWYG-ed text area using ckedit), Number, Choose Single, Choose Multiple, Date, Time, Date & Time, Image.

#### Cms9::Post
field(name) - Returns Cms9::Field by name

#### Cms9::Field
Represents value for particular field. Depending on the PostField type 'value' column is serialized differently.

Following helpers can be applied to Cms9::Field for easier data extraction/displaying:

cms9\_field(field)

## Configuration

Authorization should be added using the current_user method. If you pass a block it will be triggered through a
before filter on first action in Cms9.

To begin with, you may be interested in setting up [Devise](https://github.com/sferik/rails_admin/wiki/Devise) or
something similar.

After, in your User model, you need to implement method **cms9_admin?** which will be used to recognize users and
give them permission to access Cms9 dashboard:

#### Example of User Model:

```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def cms9_admin?
    return true     # All users have access to Cms9 dashboard
  end
end
```

In `config/initializers/cms9_configurator.rb` we are passing Devise **current_user** method (or whatever you use
to recognize user) and **destroy_user_session_path** which is default path for deleting users session (logout):

```ruby
Cms9.configure do |config|
  config.current_user =  :current_user
  config.destroy_user_session =  :destroy_user_session_path
end
```

**Note**: In Devise, **current_user** method and **destroy_user_session_path** are used by default, it will work without passing it to Cms9
configuration. Be sure, if you are using something else, to pass that method and path.

### Dependencies

* Install ImageMagick for Dragonfly's image processing
  * If you will use Dragonfly data stores (which are not included in core of Dragonfly) you need to include them in Gemfile: [Amazon S3](https://github.com/markevans/dragonfly-s3_data_store), [Couch](https://github.com/markevans/dragonfly-couch_data_store) or [Mongo](https://github.com/markevans/dragonfly-mongo_data_store)
  * In case you need data store which is not listed, you can also build a custom data store - [Building a custom data store](http://markevans.github.io/dragonfly/data-stores/#building-a-custom-data-store)

### Dragonfly data stores

By default Dragonfly is using datastore:file. If you plan to use any other data store, after including gem and
install you need to override Dragonflys configuration.

For example if you are going to use Amazon S3 as your default data store, you need to make initializer
(e.g `config/initializers/init_dragonfly_s3.rb`)which will override configuration (one for Dragonfly uploader, and second for Ckeditor assets uploader):

```ruby
require 'dragonfly/s3_data_store'

Dragonfly.app.configure do
  ...
  datastore :s3,
    bucket_name: 'mybucket',
    access_key_id: 'my_access_key_id',
    secret_access_key: 'my_secret_access_key'
  ...
end

Dragonfly.app(:ckeditor).configure do
  ...

  datastore :s3,
    bucket_name: 'mybucket',
    access_key_id: 'my_access_key_id',
    secret_access_key: 'my_secret_access_key'

  ...
end
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
