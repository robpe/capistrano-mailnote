capistrano-mailnote
===================

Capistrano Deployment email notification with commit messages based release notes. Mailer supports markdown templates.

delpoy.rb configuration
-----------------------

Add following lines to your deployment config file:

```
# Mailer configuration for gmail/google apps 
#
set :mailnote_method, :smtp # or use :sendmail
set :mailnote_smtp, {
  address:    'smtp.gmail.com',
  port:       587,
  domain:     'subscribeasy.com',
  user_name:  fetch(:google_username),
  password:   fetch(:google_password),
  authentication: 'plain',
  enable_starttls_auto: true
}

set :mailnote_to,       'your_team_email@example.com'
set :mailnote_from,     '"Capistrano Deployment" <capistrano@example.com>'
set :mailnote_subject,  Proc.new {
  "#{fetch(:application).capitalize}: [DEPLOY][#{fetch(:stage).upcase}][#{fetch(:repo_url)}]"
}
```

Customized views
----------------

You can override default views by adding following line:

```
Capistrano::Mailnote::Mailer.prepend_view_path '/path/to/your/views'
```

This gem supports *markdown* templates (https://github.com/plataformatec/markerb). Look for default mailer view in _views/capistrano/mailnote/mailer/note.markerb_. 
