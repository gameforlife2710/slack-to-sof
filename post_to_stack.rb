ENV["SSL_CERT_FILE"] = "./cacert.pem" #OpenSSLの対策です。
require "httparty"

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
    self.class.post("/2.2/questions/add", 
    { body: {site: $site, title: $title, body: $body, tags: $tags, key: $key, access_token: $access_token, preview: $preview} })
  end

end

sof = SOF.new()
#StackOverFlowは投稿タイトルと本文をよくチェックするので、ご注意ください。
#投稿タイトルと本文が不合格になれば、エラーメッセージ："This post does not meet our quality standards."が出ます。
puts sof.questions

