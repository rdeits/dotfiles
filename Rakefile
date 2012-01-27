desc "Link files to their appropriate locations"
task :link do
	%w[inputrc screenrc].each do |script|
		link_file(script)
	end
	if RUBY_PLATFORM.include? "darwin"
		link_file("bash_profile_mac", ".bash_profile")
	elsif RUBY_PLATFORM.include? "linux"
		link_file("bashrc_linux", ".bashrc")
	end
end

def link_file(script, dotname=nil)
	if dotname == nil
		dotfile = File.join(ENV['HOME'], ".#{script}")
	else
		dotfile = File.join(ENV['HOME'], dotname)
	end
	if File.exist? dotfile
		warn "~/.#{script} already exists"
	else
		ln_s script, dotfile
	end
end

task :default => [:link]
