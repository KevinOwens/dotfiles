require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[bin bash Rakefile README.md LICENSE id_rsa.pub osx_bootstrap.sh].include? file
    puts(file)

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      print "overwrite ~/.#{file}? [ynaq] "
      case $stdin.gets.chomp
      when 'y'
        replace_file(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file}"
      end
    else
      link_file(file)
    end
  end

  # Handle ssh pubkey on its own
  puts "Linking public ssh key"
  if File.directory?(File.expand_path('~/.ssh'))
    system %Q{rm "$HOME/.ssh/id_rsa.pub"}
  else
    system %Q{mkdir "$HOME/.ssh/"}
  end
  system %Q{ln -s "$PWD/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"}

  #Make a .tmp directory for vim stuff
  system %Q{mkdir -p ~/.tmp}
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
