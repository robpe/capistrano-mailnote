require 'action_mailer'
require 'rails'
require 'markerb'

require 'capistrano/mailnote/mailer'
require 'capistrano/mailnote/configuration'


module Capistrano
  module Mailnote

  end
end

Markerb.processing_options = { tables: true, autolink: true }

load File.expand_path("tasks/mailnote.rake", File.dirname(__FILE__))
