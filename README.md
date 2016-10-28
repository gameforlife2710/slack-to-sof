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
<post_to_stack>  
<title>this is a title<end_title>  
<body>this is a body<end_body>  
<tags>this is a tags<end_tags>  
<access_token>this is a access_token<end_access_token>  
<key>this is a key<end_key>  
<preview>this is a preview<end_preview>  テストなら、trueにしてください           
  
