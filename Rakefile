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
		dotname = ".#{script}"
	end
	dotfile = File.join(ENV['HOME'], dotname)
	if File.exist? dotfile
		warn "~/#{dotname} already exists"
	else
		ln_s File.join('.config_files', script), dotfile
	end
end

task :default => [:link]
