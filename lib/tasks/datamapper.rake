# Need to be able to monkey-patch MigrationRunner before all migrations
# are loaded to work around a bug, so replace db:migrate:load with our own
# version

# From http://github.com/eugenebolshakov/override_rake_task
Rake::TaskManager.class_eval do
  def alias_task(old_name, new_name)
    @tasks[new_name] = @tasks.delete(old_name)
  end 
end

def alias_task(old_name, new_name)
  Rake.application.alias_task(old_name, new_name)
end

def override_task(*args, &block)
  name, params, deps = Rake.application.resolve_args(args.dup)
  alias_task name.to_s, "#{name}:original"
  Rake::Task.define_task(*args, &block)
end

override_task :'db:migrate:load' => :environment do
  require 'dm-migrations/migration_runner'

  # Original version has an instance var, not a class, and doesn't work
  # for me
  module DataMapper
    module MigrationRunner
      def migrations
        @@migrations ||= []
      end
    end
  end

  # Code from original task
  FileList['db/migrate/*.rb'].each do |migration|
    load migration
  end

end
