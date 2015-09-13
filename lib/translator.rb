# require modules here
require 'pry'
require "yaml"
def load_library(file)
  # code goes here
  emo_data = YAML.load_file(file)


  new_hash = {
              "get_meaning" => {},
              "get_emoticon" => {}
              }

  emo_data.each do |data_array|

      japan_emo = data_array[1][1]
      english_word = data_array[0]
      english_emo = data_array[1][0]

      new_hash["get_meaning"][japan_emo] = english_word
      new_hash["get_emoticon"][english_emo] = japan_emo
  end

  new_hash
 end

def get_japanese_emoticon(file, emoticon)
  # code goes here

  emo_hash = load_library(file)
  emo_to_return = emo_hash["get_emoticon"][emoticon]

  if emo_to_return.nil?
    "Sorry, that emoticon was not found"
  else
    emo_to_return
  end
  
end

def get_english_meaning(file, emoticon)
  # code goes here
  emo_hash = load_library(file)
  emo_to_return = emo_hash["get_meaning"][emoticon]

  if emo_to_return.nil?
    "Sorry, that emoticon was not found"
  else
    emo_to_return
  end
end