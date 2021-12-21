json.array! @ingredients do |ingredient|
  json.name ingredient.name
  json.content sample.content
  json.name sample.user.name
end