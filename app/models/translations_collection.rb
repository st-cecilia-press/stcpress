class TranslationsCollection < Repository 
    def editions(piece)
        return "/#{self.name}/#{piece.slug}/#{piece.slug}.pdf"
    end
end
