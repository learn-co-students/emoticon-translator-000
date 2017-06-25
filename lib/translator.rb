# require modules here

# require modules here
require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  dictionary = {"get_meaning" => {}, "get_emoticon" => {}} 
  emoticons.each do |emotion, emoticons|
    dictionary["get_meaning"][emoticons[1]] = emotion
    dictionary["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  dictionary
end

def get_japanese_emoticon(path, emoticon)
  # returns the Japanese equivalent of an English emoticon
  dictionary = load_library(path)
  japanese_emoticon = dictionary["get_emoticon"][emoticon]
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # returns the meaning of a Japanese emoticon
  dictionary = load_library(path)
  meaning = dictionary["get_meaning"][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end