# Cms9

Small CMS Admin module for Rails.
[Try the demo][demo].

## What Is Cms9?

Cms9 is a library for Rails apps
that automatically generates cms dashboard.
Cms9's dashboard give non-technical users clean interfaces
that allow them to create, edit, search, and delete definitions,
field types and posts related to it.

Cms9 provides a better user experience and it's easy for developers to customize.

### Features
* Simple integration with Rails 5 apps
* Custom actions
* Automatic form validation
* Authentication customizable (via [Devise](https://github.com/plataformatec/devise) or other)
* Supported ORM ActiveRecord
* [Dragonfly](https://github.com/markevans/dragonfly) for handling images and other attachments
* [Ckeditor](https://github.com/galetahub/ckeditor) as default WYSIWYG text editor
* Bootstrap 3+ with Admin LTE template
  * Can be used or extended for wider usage

## Getting Started

Add Cms9 to your Gemfile:

```ruby
# Gemfile
gem "cms9"
```

Re-bundle, then run the installer:

```bash
$ rails generate cms9:install [DEF_ROUTE]
```
Where [DEF_ROUTE] is optional and presents where your Cms9 route will be mounted, by default it's /cms9

Install generator will mount Cms9 route, add current_user configurator initializer and additional configuration for Ckeditor.

Then run:

```bash
$ rails db:migrate
```

Restart your server, and visit http://localhost:3000/cms9 (or where you defined Cms9 to be mounted)
to see your new Cms9 dashboard in action.


When your Cms9 is up and running, before creating posts and populating them with content we need to create a Post Types. Post Types is defined by fields and its types.

After creating a Post Type, you are ready to populate/create it's data. For different field types you will get different input methods, for easier input handling. Once when it's stored, it's available to be showed in your application, for example:

```html
<% @Posts.each do |post| %>
  # TODO #           
<% end %>
```

You can make any kind of layout for your posts and showed them however you want.
Once you made a simple layout, you are ready to create as many posts as you want. It's that easy.

## Configuration

Authorization should be added using the current_user method. If you pass a block it will be triggered through a before filter on first action in Cms9.

To begin with, you may be interested in setting up [Devise](https://github.com/sferik/rails_admin/wiki/Devise) or something similar.

After, in your User model, you need to implement method **cms9_admin?** which will be used to recognize users and give them permission to access Cms9 dashboard:

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

In `config/initializers/cms9_configurator.rb` we are passing Devise **current_user** method (or whatever you use to recognize user):

```ruby
Cms9.configure do |config|
  config.current_user =  :current_user
end
```

**Note**: In Devise, **current_user** method is used by default, it will work without passing it to Cms9 configuration. Be sure, if you are using something else, to pass that method.

### Dependencies

* Install ImageMagick for Dragonfly's image processing
  * If you will use Dragonfly datastores (which are not included in core of Dragonfly) you need to include them in Gemfile: [Amazon S3](https://github.com/markevans/dragonfly-s3_data_store), [Couch](https://github.com/markevans/dragonfly-couch_data_store) or [Mongo](https://github.com/markevans/dragonfly-mongo_data_store)
* Make sure that Gemfile has either kaminari or will_paginate

### Dragonfly Datastores

By default Dragonfly is using datastore:file. If you plan to use any other datastore, after including gem and install you need to override Dragonflys configuration.

For example if you are going to use Amazon S3 as your default datastore, you need to make initializer (e.g `config/initializers/init_dragonfly_s3.rb`)which will override configuration (one is for Dragonfly uploader, and second for Ckeditor assets uploader):

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


[demo]: #
