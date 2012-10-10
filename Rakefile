require 'rake/clean'

CLEAN.include FileList['inputrc', 'screenrc', 'tmux.conf', 'gitconfig', 'vim', 'vimrc', 'gvimrc', 'bash_profile', 'bashrc', 'zshrc'].pathmap("#{ENV['HOME']}/.%p")


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
		link_file("sublime-config", ".config/sublime-text-2/Packages/User")
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

task :default => [:link,
				  :install_vim]
