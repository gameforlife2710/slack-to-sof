# slack-to-sof  
・StackOverFlowのAPIキーの取得  
・StackOverFlowにAPIを経由して適当な質問を投稿  
・SlackBotと結合し、Slack上に投稿されたStringをStackOverFlowに投稿　　
  　　
◆stackoverflowに投稿できるため、access_tokenを取る必要です。    
・http://qiita.com/yoichiro6642/items/a951178fbd2d82256d68  
  
  
◆投稿できるため、write_accessの権限を取る必要です。  
・write_accessの権限のため、アプリのStack Apps Postがなければならない、Stack Apps Postはこんな感じです  
　http://stackapps.com/questions/7099/placeholder-ruby-script-for-posting-question-to-stackoverflow-by-slack-message  
  
◆Ruby2.xはSSLの問題がまだ発生しているので、SSL問題を修正しないと実行できないです。  
・http://stackoverflow.com/questions/4528101/ssl-connect-returned-1-errno-0-state-sslv3-read-server-certificate-b-certificat   
・http://d.hatena.ne.jp/komiyak/20130508/1367993536