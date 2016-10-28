require "slack"
require "yaml"
require_relative  "stack"

include StackOverFlow

setting = YAML.load_file("settings.yml")
TOKEN = setting["token"]
puts TOKEN

BOTNAME = "test-bot"
Slack.configure {|config| config.token = TOKEN }
client = Slack.realtime

client.on :hello do
  puts 'Successfully connected.'
end

client.on :message do |data|
  if data.key?('text')
    if data['text']['&lt;post_to_stack&gt;'] && data['subtype'] != 'bot_message'
      $title = data['text']['&lt;title&gt;'] ? data['text'][data['text'].index('&lt;title&gt;') + ('&lt;title&gt;').length..data['text'].index('&lt;end_title&gt;') - 1] : ''
      $body = data['text']['&lt;body&gt;'] ? data['text'][data['text'].index('&lt;body&gt;') + ('&lt;body&gt;').length..data['text'].index('&lt;end_body&gt;') - 1] : ''
      $tags = data['text']['&lt;tags&gt;'] ? data['text'][data['text'].index('&lt;tags&gt;') + ('&lt;tags&gt;').length..data['text'].index('&lt;end_tags&gt;') - 1] : ''
      $access_token = data['text']['&lt;access_token&gt;'] ? data['text'][data['text'].index('&lt;access_token&gt;') + ('&lt;access_token&gt;').length..data['text'].index('&lt;end_access_token&gt;') - 1] : ''
      $key = data['text']['&lt;key&gt;'] ? data['text'][data['text'].index('&lt;key&gt;') + ('&lt;key&gt;').length..data['text'].index('&lt;end_key&gt;') - 1] : ''
      $preview = data['text']['&lt;preview&gt;'] ? data['text'][data['text'].index('&lt;preview&gt;') + ('&lt;preview&gt;').length..data['text'].index('&lt;end_preview&gt;') - 1] : ''
      sof_message = $title + "\n" + $body + "\n" + $tags + "\n" + $access_token + "\n" + $key + "\n" + $preview
      puts sof_message
      
      sof = SOF.new()
      #StackOverFlowは投稿タイトルと本文をよくチェックするので、ご注意ください。
      #投稿タイトルと本文が不合格になれば、エラーメッセージ："This post does not meet our quality standards."が出ます。
      result = sof.questions
      
      
      params = {
        token: TOKEN,
        channel: data['channel'],
        text: "<@#{data['user']}> \n" + sof_message} 
      Slack.chat_postMessage params

    end
  end

  
end

client.start
Process.daemon


