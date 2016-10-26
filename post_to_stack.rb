require "httparty"

#Ruby2.xはSSLの問題がまだ発生しているので、SSL問題を修正しないと実行できないです。
#http://stackoverflow.com/questions/4528101/ssl-connect-returned-1-errno-0-state-sslv3-read-server-certificate-b-certificat 
#http://d.hatena.ne.jp/komiyak/20130508/1367993536

response = HTTParty.post('http://api.stackexchange.com/2.2/questions/add', body: {
  site: 'stackoverflow', title: 'placeholder just test StackExchange write_access api', body: 'placeholder just test StackExchange write_access api',
  tags: 'placeholder', key: 'X6slp5xIMDTom2t0y051iQ((', access_token: 'KSHEQgM3y6Nd6W6*l(S9ow))', preview: 'true'})
puts response
