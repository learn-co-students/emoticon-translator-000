require 'Pry'
require 'yaml'

def load_library(file_path)
  emoticon_yaml = YAML.load_file(file_path)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticon_yaml.each{|meaning, emoticon_set|
    emoticons["get_meaning"][emoticon_set[1]] = meaning
    emoticons["get_emoticon"][emoticon_set[0]] = emoticon_set[1]
  }
  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"].include?(emoticon)
    return emoticons["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end  
  emoticons
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"].include?(emoticon)
    return emoticons["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end