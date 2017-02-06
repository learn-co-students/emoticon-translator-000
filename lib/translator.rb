# require modules here
require 'pry'
require 'yaml'


def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  results = {"get_emoticon" => {}, "get_meaning" => {}}
  
  emoticons.each do 
    |key,value| results["get_meaning"][value[1]] = key
    results["get_emoticon"][value[0]] = value[1]
  end
  results
 #binding.pry
  
end

def get_japanese_emoticon(file,emote)
  # code goes here
  emoticon_hash = load_library(file)
  emoticon_hash["get_emoticon"].each do |x,y|
    if x == emote
      return y
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file,emote)
  # code goes here
  emoticon_hash = load_library(file)
    emoticon_hash["get_meaning"].each do |x,y|
    if x == emote
      return y
    end
  end
  return "Sorry, that emoticon was not found"
end

