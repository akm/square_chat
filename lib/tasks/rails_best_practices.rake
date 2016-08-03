desc "Check by rails_best_practices"
task :rails_best_practices do
  r = `rails_best_practices`
  if $?.exitstatus >= (ENV['RAILS_BEST_PRACTICES_ALLOWANCE'] || 5).to_i
    $stderr.puts r
  end
end

if Rails.env.development?
  Rake::Task[:spec].enhance do
    Rake::Task[:rails_best_practices].invoke
  end
end
