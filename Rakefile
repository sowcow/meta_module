require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
# task :default => :spec

task :+ => [:spec, :mutant]
task :default => :+


desc 'mutate-test given class'
task :mutate, [:who, :file] do |t,args|
  # args.with_defaults who: 'Map'; who = args.who
  who, file = args.who, args.file
  klass = who
  # file = who.underscore
  system "mutant -I lib -r #{ file } --rspec-dm2 ::#{ klass }"
end


desc 'run all mutation tests'
task :mutant do
  Rake::Task[:mutate].invoke 'MetaModule::MModule', 'meta_module'
  Rake::Task[:mutate].reenable
  Rake::Task[:mutate].invoke 'MetaModule::MModule2', 'meta_module'
  # use file instead of class, get all files in lib/**?
end
task :m => :mutant


BEGIN{
class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
  def +@; inspect end
end
}
