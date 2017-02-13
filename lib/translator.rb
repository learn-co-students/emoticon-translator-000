# require modules here
require 'pry'
require 'yaml'

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  meanings_library = {}
  emoticons_library = {}
  emoticons.each do |meaning, emoticons|
    english_emoticon = emoticons[0]
    japanese_emoticon = emoticons[1]
    meanings_library[japanese_emoticon] = meaning
    emoticons_library[english_emoticon] = japanese_emoticon
  end
  library = {}
  library["get_meaning"] = meanings_library
  library["get_emoticon"] = emoticons_library
  library
end

def get_japanese_emoticon(path, english_emoticon)
  # code goes here
  library = load_library(path)
  japanese_emoticon = library["get_emoticon"][english_emoticon]
  if japanese_emoticon
    return japanese_emoticon
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, japanese_emoticon)
  # code goes here
  library = load_library(path)
  english_meaning = library["get_meaning"][japanese_emoticon]
  if english_meaning
    return english_meaning
  else 
    return "Sorry, that emoticon was not found"
  end
end

