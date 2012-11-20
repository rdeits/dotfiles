require 'rake/clean'

CLEAN.include FileList['inputrc', 'screenrc', 'tmux.conf', 'gitconfig', 'vim', 'vimrc', 'gvimrc', 'bash_profile', 'bashrc', 'zshrc', '/.config/sublime-text-2/Packages/User'].pathmap("#{ENV['HOME']}/.%p")

desc "Install oh-my-zsh from github"
task :zsh do
	sh "curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"
end


desc "Link files to their appropriate locations"
task :link do
	%w[inputrc screenrc tmux.conf gitconfig vim zshrc].each do |script|
		link_file(script)
	end
	if RUBY_PLATFORM.include? "darwin"
		link_file("bash_profile_mac", ".bash_profile")
		link_file("sublime-config", "Library/Application Support/sublime text 2/packages/User")
	elsif RUBY_PLATFORM.include? "linux"
		link_file("bashrc_linux", ".bashrc")
		if File.exist? File.join(ENV['HOME'], ".config/sublime-text-2")
			link_file("sublime-config", ".config/sublime-text-2/Packages/User")
		end
	end
end

def link_file(script, dotname=nil)
	if dotname == nil
		dotname = ".#{script}"
	end
	dotfile = File.join(ENV['HOME'], dotname)
	if File.exist? dotfile
		warn "~/#{dotname} already exists"
	else
		ln_s File.join(File.dirname(__FILE__), script), dotfile
	end
end

task :install_vim do
	Dir.chdir "vim"
	sh "rake"
	Dir.chdir ".."
end

task :apt do
	sh "sudo apt-get update"
	sh "sudo apt-get install git rake vim-gnome curl tmux zsh"
end

task :default => [:link,
				  :install_vim]
