# require modules here
require "yaml"
#path = "emoticons.yml"
#emoticon = "(￣ー￣)"

def load_library(path)
  # code goes here
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons = YAML.load_file(path)
  emoticons.each do |meaning, icons|
    english, japanese = icons
    new_hash["get_emoticon"][english] = japanese
    new_hash["get_meaning"][japanese] = meaning
  end
  new_hash
  #puts emoticons
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  #puts library["get_meaning"][emoticon]
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  #puts library["get_meaning"][emoticon]
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

#load_library(path)
#get_japanese_emoticon(path, emoticon)
