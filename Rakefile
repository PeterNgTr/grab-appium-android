require 'rubygems'
require 'rake'

# Run sh and ignore exception
def run_sh(cmd)
  begin; sh cmd; rescue; end
end

# Run cmd. On failure run install and try again.
def bash(cmd)
  sh cmd do |successful, result|
    # exitstatus 7 means bundle install failed
    # exitstatus 1 means the spec failed
    if !successful && result.exitstatus == 7
      Rake::Task['install'].execute
      run_sh cmd
    end
  end
end

def run_android
  puts "Executing rpsec using Appium"
  cmd = 'bundle exec rspec'
  bash cmd
end

# Run all tests with:
# rake android
desc 'Run the Android tests'
task :android do
  run_android
end