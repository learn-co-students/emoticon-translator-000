require 'pry'
require 'yaml'
# YAML.load_file('/lib/emoticons.yml')

def load_library(file_path)
  original = YAML.load_file(file_path)
  answer = {"get_meaning" => {}, "get_emoticon" => {}}
  original.each do |word, array_of_emoticons|
  	answer["get_meaning"][array_of_emoticons[1]] = word
  	answer["get_emoticon"][array_of_emoticons[0]] = array_of_emoticons[1]
  end
  answer
end

def get_japanese_emoticon(file_path, emoticon)
	if load_library(file_path)["get_emoticon"][emoticon]
		load_library(file_path)["get_emoticon"][emoticon]
	else
		"Sorry, that emoticon was not found"
	end
end

def get_english_meaning(file_path, emoticon)
	if load_library(file_path)["get_meaning"][emoticon]
		load_library(file_path)["get_meaning"][emoticon]
	else
		"Sorry, that emoticon was not found"
	end
end