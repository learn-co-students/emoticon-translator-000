# require modules here
require "yaml"
require "pry"


def load_library(filePath)
  hash = {"get_meaning" => { }, "get_emoticon" => { }}
  hashNew = YAML.load_file(filePath)
    hashNew.each do |key, value|
      hash["get_meaning"][value[1]] = key
      hash["get_emoticon"][value[0]] = value[1]
    end
  return hash
end

def get_japanese_emoticon(filePath, emoticon)
  flash = ""
  hash = load_library(filePath)
  hash["get_emoticon"].each do |englishEmoticon|
    if englishEmoticon = emoticon
      flash = hash["get_emoticon"][emoticon]
   end
 end
  if flash == nil
    return "Sorry, that emoticon was not found"
  else
    return flash
  end
end

def get_english_meaning(filePath, emoticon)
  flash = ""
  hash = load_library(filePath)
  hash["get_meaning"].each do |englishEmoticon|
    if englishEmoticon = emoticon
      flash = hash["get_meaning"][emoticon]
   end
 end
  if flash == nil
    return "Sorry, that emoticon was not found"
  else
    return flash
  end
end