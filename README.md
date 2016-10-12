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

## Configuration

Authorization can be added using the current_user method. If you pass a block it will be triggered through a before filter on every action in Cms9.

To begin with, you may be interested in setting up [Devise](https://github.com/sferik/rails_admin/wiki/Devise) or something else.

In `config/initializers/cms9_configurator.rb`:

#### For example:

```ruby
Cms9.configure do |config|
  config.current_user =  :current_user
end
```


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


[demo]: #
