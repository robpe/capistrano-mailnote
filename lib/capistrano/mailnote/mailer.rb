module Capistrano
  module Mailnote
    class Mailer < ActionMailer::Base

      prepend_view_path File.expand_path('../../../views', File.dirname(__FILE__))

      def note(config)
        config.each { |k,v| instance_variable_set("@#{k}", v) }

        mail(
          to:       @mailnote_to,
          from:     @mailnote_from,
          subject:  @mailnote_subject
        ) do |format|
          format.text
          format.html
        end
      end

    end
  end
end