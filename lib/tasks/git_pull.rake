task :git_pull do
  ['miscellaneous', 'sca_dance', 'bel-accueil', 'gervaise_quart_livre_de_danceries', 'stcpress-data'].each do |d|
	  unless File.exists?("public/#{d}")
			Dir.chdir("public") do
		   `git clone https://github.com/st-cecilia-press/#{d}.git`
			end
		else
			Dir.chdir("public/#{d}") do
				`git pull -v`
			end
		end
	end
end
