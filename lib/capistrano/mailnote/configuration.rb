module Capistrano
  module Mailnote
    class Configuration

      DEFAULT_WHITELIST = [
          :mailnote_from,
          :mailnote_to,
          :mailnote_subject,
          :release_notes,
          :release_path,
          :release_time,
          :previous_revision,
          :current_revision,
          :application,
          :application_url,
          :env,
          :stage,
          :repo_url,
          :branch
      ].freeze

      #
      # Sets up mailer configuration (delivery_method, smtp) as well as filters
      # environmental variables passed to the mailnote mailer template.
      #
      def self.read(config, whitelist=[])

        ActionMailer::Base.delivery_method  = config.fetch(:mailnote_method, :sendmail)
        ActionMailer::Base.smtp_settings    = config.fetch(:mailnote_smtp, {})

        whitelist.concat(DEFAULT_WHITELIST).inject({}) do |result, key|
          result[key] = config.fetch(key, '') ; result
        end
      end

    end
  end
end