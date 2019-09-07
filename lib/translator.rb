require "yaml"


def load_library(path)
  hash = {}
  hash[:get_meaning] = {}
  hash[:get_emoticon] = {}
  
  emoticons_list = YAML.load_file(path)
  emoticons_list.each { |k,v|
    jp_emoticon = emoticons_list[k][1]
    eng_emoticon = emoticons_list[k][0]
    hash[:get_meaning][jp_emoticon] = k
    hash[:get_emoticon][eng_emoticon] = jp_emoticon
  }
  hash
end

def get_japanese_emoticon(path,emoticon)
  hash = load_library(path)
  if hash[:get_emoticon][emoticon]
    return hash[:get_emoticon][emoticon] 

  else 
    return "Sorry, that emoticon was not found"

  end
  
end
  


def get_english_meaning(path, emoticon)
  
  hash = load_library(path)
  if hash[:get_meaning][emoticon]
    return hash[:get_meaning][emoticon] 

  else 
    return "Sorry, that emoticon was not found"

  end
  
  
  
end












