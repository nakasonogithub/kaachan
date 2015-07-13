# Description:
#   http://tiqav.com/
#   ここを検索して画像を返す
# Command:
#   kaachan res ${keyword}

API_URI = 'http://api.tiqav.com/search.json?q='
module.exports = (robot) ->
  robot.respond /res (.*)/i, (msg) ->
    req = require('request');
    req.get("#{API_URI}#{msg.match[1]}"
    , (error, response, body) ->
      if error or response.statusCode != 200
        msg.send('J( \'ー`)し 失敗しちゃった')
      data = JSON.parse(body)
      # random
      order = Math.floor(Math.random() * data.length)
      selected = data[order]
      msg.send "J( \'ー`)し http://img.tiqav.com/#{selected.id}.#{selected.ext}" )
