# Description:
#   kaachanができることをおしえてくれる
# Command:
#   kaachan help

module.exports = (robot) ->
  robot.respond /help$/, (msg) ->
    msg.send """
             kaachan ping
               => J( 'ー`)し かあちゃんが起きてたら返事するからね

             kaachan clear
               => J( 'ー`)し 誤魔化すね

             kaachan \${キーワード}とは|\${キーワード}ってなに
               => J( 'ー`)し わからないことを聞いてね

             kaachan img|image ${キーワード}
               => J( 'ー`)し 画像を調べてくるね

             kaachan res ${キーワード}
               => J( 'ー`)し 画像で返事するよ

             kaachan pug me
               => J( 'ー`)し パグかわいい

             """

