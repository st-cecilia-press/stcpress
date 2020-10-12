task :git_pull do
  ['miscellaneous', 'sca_dance', 'bel-accueil', 'gervaise_quart_livre_de_danceries', 'stcpress-data'].each do |d|
    unless File.exists?("/usr/src/shared/#{d}")
      Dir.chdir("/usr/src/shared") do
		   `git clone https://github.com/st-cecilia-press/#{d}.git`
			end
		else
      Dir.chdir("/usr/src/shared/#{d}") do
				`git pull -v`
			end
		end
	end
end
