# Description:
#   wikipedia検索する
# Command:
#   kaachan ${keyword}とは|${keyword}ってなに|${keyword}って何

API_URI = 'http://wikipedia.simpleapi.net/api?output=json&keyword='
module.exports = (robot) ->
  robot.respond /(.*)ってなに$|(.*)とは$|(.*)って何$/, (msg) ->
    if msg.match[1] != undefined
      query = msg.match[1]
    if msg.match[2] != undefined
      query = msg.match[2]
    if msg.match[3] != undefined
      query = msg.match[3]
    req = require('request');
    req.get("#{API_URI}#{query}"
    , (error, response, body) ->
      if error or response.statusCode != 200 
        msg.send('J( \'ー`)し 失敗しちゃった')
      try
        url = JSON.parse(body)[0].url
        body = JSON.parse(body)[0].body.replace(/\<br\/\>/g, '')
        msg.send("J( \'ー`)し #{url}")
        msg.send("J( \'ー`)し #{body}")
      catch error
        msg.send('J( \'ー`)し 失敗しちゃった'))


####



#[コマンド]
#kaachan clear
#画面が汚れた時のためにログを流すscript
#連続発言させるとkaachanが寝てしまうので、長い文字列でごまかす
####
#API_URI = 'http://wikipedia.simpleapi.net/api?output=xml&keyword='
#module.exports = (robot) ->
#  robot.respond /(.*)とは/, (msg) ->
#    req = require('request');
#    req.get("#{API_URI}#{msg.match[1]}"
#    , (error, response, body) ->
#      if error or response.statusCode != 200
#        return msg.send('画像検索に失敗しました...')
#      data = JSON.parse(body)[0]
#      # robot.logger.info data
#      msg.send "http://img.tiqav.com/#{data.id}.#{data.ext}" )
#
#
#
#
####
#oldoldold
#API_URI = 'http://wikipedia.simpleapi.net/api?output=xml&keyword='
#
#module.exports = (robot) ->
#  robot.respond /(.*)とは$|(.*)ってなに$|(.*)って何$/, (msg) ->
#    msg.send msg.match[1]
#    req = require 'request'
#    req.get "#{API_URI}#{msg.match[1]}"
#    , (err, res, body) ->
#      throw err if err
#      if res.statucCode is 200
#        msg.send '200 OK'
#        jbody = JSON.parse(body)
#        msg.send jbosy[0]["url"]
#      else
#        msg.send '! 200 OK'
#    msg.send "end"
####
