
namespace :deploy do

  desc 'Show deployment mailnote.'
  task 'mailnote:show' do
    on roles(:app) do
      configuration = Capistrano::Mailnote::Configuration.read(self)
      info Capistrano::Mailnote::Mailer.note(configuration)
    end
  end

  desc 'Send deployment mail note'
  task :mailnote do
    on roles(:app) do
      configuration = Capistrano::Mailnote::Configuration.read(self)
      info "[deploy:mailnote] Sending deployment mail note."
      Capistrano::Mailnote::Mailer.note(configuration).deliver
    end
  end

  task :set_release_notes do
    desc "Set and show release notes."
    task :release_notes do
      on release_roles :app do
        within repo_path do
          with fetch(:git_environmental_variables) do
            git_commits_range = "#{fetch(:previous_revision).strip}..#{fetch(:current_revision).strip}"
            git_log = capture :git, "log #{fetch(:branch)} --pretty=oneline --abbrev-commit #{git_commits_range} |cat"
            set :release_notes, git_log
            info git_log
          end
        end
      end
    end
  end

  after   'deploy:finished', 'deploy:mailnote'
  before  'deploy:mailnote', 'deploy:set_release_notes'
  before  'deploy:mailnote', 'set_release_time' do
    set :release_time, Time.now
  end

end