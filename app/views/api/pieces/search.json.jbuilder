json.array! (@pieces) do |piece|
  json.title piece.title
  json.composer piece.composer.name
  json.slug piece.slug
end
