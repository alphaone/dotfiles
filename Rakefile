require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md LICENSE oh-my-zsh ssh hg-prompt]
  non_dot_files = %w[Brewfile Caskfile]
  files << Dir['oh-my-zsh/custom/*']
  files << Dir['ssh/*']
  files.flatten.each do |filename|
    target_filename = filename.sub(/\.erb$/, '')
    target_filename = "." + target_filename unless non_dot_files.include?(target_filename)

    # create target dir if neccessary
    system %Q{mkdir -p "$HOME/.#{File.dirname(filename)}"} if filename =~ /\//

    if File.exist?(File.join(ENV['HOME'], target_filename))
      if File.identical? filename, File.join(ENV['HOME'], target_filename)
        puts "identical ~/#{target_filename}"
      elsif replace_all
        replace_file(filename, target_filename)
      else
        print "overwrite ~/#{target_filename}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(filename, target_filename)
        when 'y'
          replace_file(filename, target_filename)
        when 'q'
          exit
        else
          puts "skipping ~/#{target_filename}"
        end
      end
    else
      link_file(filename, target_filename)
    end
  end
end

def replace_file(filename, target_filename)
  system %Q{rm -rf "$HOME/#{target_filename}"}
  link_file(filename, target_filename)
end

def link_file(filename, target_filename)
  if filename =~ /.erb$/
    puts "generating ~/#{target_filename}"
    File.open(File.join(ENV['HOME'], target_filename), 'w') do |new_file|
      new_file.write ERB.new(File.read(filename)).result(binding)
    end
  elsif filename =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/#{target_filename}"
    system %Q{cp "$PWD/#{filename}" "$HOME/#{target_filename}"}
  else
    puts "linking ~/.#{filename}"
    system %Q{ln -s "$PWD/#{filename}" "$HOME/#{target_filename}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end
