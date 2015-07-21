# require modules here
require 'yaml'

def load_library(yaml)
  # code goes here
  yaml_hash = YAML.load_file(yaml)
  yaml_hash.each_with_object({ "get_emoticon" => {}, "get_meaning" => {} }) do |(meaning, smiles), hash|
  	hash["get_meaning"][smiles.last] = meaning
  	hash["get_emoticon"][smiles.first] = smiles.last
  end
end

def get_japanese_emoticon(path, english_smile)
  # code goes here
  smile = load_library(path)["get_emoticon"][english_smile]
  smile == nil ? "Sorry, that emoticon was not found" : smile
end

def get_english_meaning(path, japanese_smile)
  # code goes here
  meaning = load_library(path)["get_meaning"][japanese_smile]
  meaning == nil ? "Sorry, that emoticon was not found" : meaning
end