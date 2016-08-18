require 'erb'

namespace :cpdl  do
  task :text, [:slug, :date] => :environment do |t, args|
    @template  = %q{
 [http://stcpress.org/miscellaneous/<%= @slug %>/<%= @slug%>.pdf {{extpdf}}] [http://stcpress.org/miscellaneous/<%= @slug %>/<%= @slug%>.mid {{extmid}}] [http://stcpress.org/miscellaneous/<%= @slug %>/<%= @slug%>.mp3 {{extmp3}}] [https://github.com/st-cecilia-press/miscellaneous/blob/master/<%= @slug %>/<%= @slug %>.ly {{extly}}] [http://stcpress.org/pieces/<%= @slug%> {{net}}] Part Midis and Mp3s Available
{{Editor|Monique Rio|<%=@date%>}}{{ScoreInfo|Letter|<%= @pages %>|<%= @size %>}}{{CopyCC|Attribution 4.0}}
:'''Edition notes:''' Formerly Edited by [[User:Aaron Elkiss|Aaron Elkiss]]; Updated 2016-08-17
}
    @slug = args[:slug]
    @date = args[:date]
    path = "./public/miscellaneous/#{@slug}/#{@slug}.pdf" 
    reader = PDF::Reader.new(path)
    @pages = reader.page_count
    @size = File.size(path)/1024
    puts ERB.new(@template).result(binding) 
    
  end
end

