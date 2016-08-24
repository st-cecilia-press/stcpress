require 'erb'
require 'date'

namespace :cpdl  do
  task :text, [:slug] => :environment do |t, args|
    @template  = %q{
 [http://stcpress.org/miscellaneous/<%= @slug %>/<%= @slug%>.pdf {{extpdf}}] [http://stcpress.org/miscellaneous/<%= @slug %>/<%= @slug%>.mid {{extmid}}] [http://stcpress.org/miscellaneous/<%= @slug %>/<%= @slug%>.mp3 {{extmp3}}] [https://github.com/st-cecilia-press/miscellaneous/blob/master/<%= @slug %>/<%= @slug %>.ly {{extly}}] [http://stcpress.org/pieces/<%= @slug%> {{net}}] Part Midis and Mp3s Available
{{Editor|Monique Rio|<%=@date%>}}{{ScoreInfo|Letter|<%= @pages %>|<%= @size %>}}{{CopyCC|Attribution 4.0}}
:'''Edition notes:''' 
}
    @slug = args[:slug]
    @date = Date.today.to_s
    path = "./public/miscellaneous/#{@slug}/#{@slug}.pdf" 
    reader = PDF::Reader.new(path)
    @pages = reader.page_count
    @size = File.size(path)/1024
    puts ERB.new(@template).result(binding) 
    
  end
end

