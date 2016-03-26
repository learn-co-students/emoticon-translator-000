# require modules here
require "yaml"
def load_library(path)
  # code goes here
  emojis = YAML.load_file(path)
  reorg = {}
  emojis.each do |meaning, emoji|
    us = emoji[0]
    jp = emoji[1]
    reorg["get_emoticon"] ||= {}
    reorg["get_emoticon"][us] = jp
    reorg["get_meaning"] ||= {}
    reorg["get_meaning"][jp] = meaning
  end
  reorg
end

def get_japanese_emoticon(path, us)
  # code goes here
  reorg = load_library(path)
  jp = reorg["get_emoticon"][us]
  jp ? jp : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, jp)
  # code goes here
  reorg = load_library(path)
  meaning = reorg["get_meaning"][jp]
  meaning ? meaning : "Sorry, that emoticon was not found"
end