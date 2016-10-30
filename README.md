# slack-to-sof  
・StackOverFlowのAPIキーの取得  
・StackOverFlowにAPIを経由して適当な質問を投稿  
・SlackBotと結合し、Slack上に投稿されたStringをStackOverFlowに投稿  
  
 ◆stackoverflowに投稿できるため、access_tokenを取る必要です。      
  ・http://qiita.com/yoichiro6642/items/a951178fbd2d82256d68    
  
  
◆投稿できるため、write_accessの権限を取る必要です。  
・write_accessの権限のため、アプリのStack Apps Postがなければならない、Stack Apps Postはこんな感じです  
　http://stackapps.com/questions/7099/placeholder-ruby-script-for-posting-question-to-stackoverflow-by-slack-message  
  
◆メッセージパターン  
&lt;post_to_stack&gt;      
&lt;title&gt;this is a title&lt;end_title&gt;    
&lt;body&gt;this is a body&lt;end_body&gt;    
&lt;tags&gt;this is a tags&lt;end_tags&gt;    
&lt;access_token&gt;this is a access_token&lt;end_access_token&gt;      
&lt;key&gt;this is a key&lt;end_key&gt;    
&lt;preview&gt;this is a preview&lt;end_preview&gt;  テストなら、trueにしてください               
  
