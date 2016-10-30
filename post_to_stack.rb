require "slack"
require "yaml"
require_relative  "stack"
require 'pp'

include StackOverFlow

setting = YAML.load_file("settings.yml")
TOKEN = setting["token"]

BOTNAME = "test-bot"
Slack.configure {|config| config.token = TOKEN }
client = Slack.realtime

client.on :hello do
  puts 'Successfully connected.'
end

client.on :message do |data|
  if data.key?('text')
    if data['text']['&lt;post_to_stack&gt;'] && data['subtype'] != 'bot_message'
      $title = get_content data['text'], 'title'
      $body = get_content data['text'], 'body'
      $tags = get_content data['text'], 'tags'
      $access_token = get_content data['text'], 'access_token'
      $key = get_content data['text'], 'key'
      $preview = get_content data['text'], 'preview'
      sof_message = $title + "\n" + $body + "\n" + $tags + "\n" + $access_token + "\n" + $key + "\n" + $preview
      puts sof_message
      
      sof = SOF.new()
      #StackOverFlowは投稿タイトルと本文をよくチェックするので、ご注意ください。
      #投稿タイトルと本文が不合格になれば、エラーメッセージ："This post does not meet our quality standards."が出ます。
      response = sof.questions      
      pp response
      result = "post to StackOverFlow succeed"
      if response.has_key?'error_message'
        result = "post to StackOverFlow failed : #{response['error_message']}"
      end

      params = {
        token: TOKEN,
        channel: data['channel'],
        text: "<@#{data['user']}> #{result} \n" + response.to_s} 
      Slack.chat_postMessage params

    end
  end

  
end

def get_content(data, interceptor) 
  return data["&lt;#{interceptor}&gt;"] ? data[data.index("&lt;#{interceptor}&gt;") + ("&lt;#{interceptor}&gt;").length..data.index("&lt;end_#{interceptor}&gt;") - 1] : ''
end

client.start
Process.daemon


