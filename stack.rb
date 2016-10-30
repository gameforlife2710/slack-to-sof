#stack.rb
require "httparty"

module StackOverFlow
  
  $site = 'stackoverflow'
  $access_token = '' #取得したaccess_token
  $title = '' #投稿するタイトル
  $body = '' #投稿する本文
  $tags = '' #投稿するタグ
  $key = '' #登録したstackappのキー
  $preview = true #テストだけにしたければtrueにして下さい。
  
  class SOF
    include HTTParty
    base_uri "https://api.stackexchange.com"
  
    def questions
      return self.class.post("/2.2/questions/add", 
      { body: {site: $site, title: $title, body: $body, tags: $tags, key: $key, access_token: $access_token, preview: $preview} })
    end
  
  end

  
end


