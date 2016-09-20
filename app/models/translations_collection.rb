class TranslationsCollection < Repository 
    def editions(piece)
        return "/#{self.slug}/#{piece.slug}/#{piece.slug}.pdf"
    end
end
