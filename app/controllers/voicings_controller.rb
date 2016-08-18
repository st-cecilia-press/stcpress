class VoicingsController < ApplicationController
  def index
    @voicings = voicing_sort(Voicing.all)    
    @number_of_voices =  @voicings.each.map{ |voice| voice.name.length}.uniq.sort
  end
  def show
    if params[:voicing].to_i > 0
      num = params[:voicing].to_i
      v = Voicing.all
      @pieces = v.select{| voice| voice.name.length == num }.map{ |voice| voice.pieces }.flatten.uniq
    else
      voicing = Voicing.find_by(name: params[:voicing])
      @pieces = voicing.pieces
    end  
  end

  private
  def voicing_sort(voicings)
    return voicings.sort{|left, right| 
      if left.name.length != right.name.length
        left.name.length <=> right.name.length  
      else
        left.weigh_voicing <=> right.weigh_voicing 
      end
    }

  end
end
