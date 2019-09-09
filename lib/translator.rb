require "yaml"

def load_library(file_path)
  result = {}
  japanese_emotion = []
  meaning = []
  english_emoticon = []
  all_about_emo = YAML.load_file("lib/emoticons.yml")
  all_about_emo.each do |key, value|
    japanese_emotion.push(value[1])
    meaning.push(key)
    english_emoticon.push(value[0])
  end
    result[:get_meaning] = Hash[japanese_emotion.zip meaning]
    result[:get_emoticon] = Hash[english_emoticon.zip japanese_emotion]
  result

end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  eng_emoticon = emoticon_hash[:get_emoticon].map { |english_emoticon, japanese_emotion| english_emoticon }
  i = 0 
  while i<eng_emoticon.length do 
    if eng_emoticon[i] == emoticon 
      return emoticon_hash[:get_emoticon][emoticon]
    end
    i+=1
  end
  sorry_message = "Sorry, that emoticon was not found" 
  return sorry_message
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  jap_emoticon = emoticon_hash[:get_meaning].map { |japanese_emotion, english_mening| japanese_emotion }
  i = 0 
  while i<jap_emoticon.length do 
    if jap_emoticon[i] == emoticon 
      return emoticon_hash[:get_meaning][emoticon]
    end
    i+=1
  end
  sorry_message = "Sorry, that emoticon was not found" 
  return sorry_message
end




