# Description:
#   画面が汚れた時のためにログを流すscript
#   連続発言させるとkaachanが寝てしまうので、長い文字列でごまかす
# Command:
#   kaachan clear

module.exports = (robot) ->
  robot.hear /^clear$|^kaachan clear$/, (msg) ->
    src1 = """
           #/usr/local/bin/ruby
           # encoding: utf-8
           
           # ------------------------------------ #
           # requires
           require 'httpclient'
           require 'nokogiri'
           require 'optparse'
           
           # ------------------------------------ #
           # methods
           def check_args
             if ARGV[0] == nil
               logger('how to use this file')
               logger(' => command: \"ruby ./pic.rb $url ($save_directory)\"')
               raise ArgumentError, 'invalid argument'
             end
             ARGV[1] = './' if ARGV[1] == nil
             logger(' ARGV')
             logger(\" url = \#{ARGV[0]}\")
             logger(\" dir = \#{ARGV[1]}\")
             return ARGV[0], ARGV[1]
           end
           
           def get_img_urls_from_doc(doc)
             img_urls = []
             rtn_urls = []
             doc.css('a').each do | img |
               logger(\"  href = \#{img[:href]}\")
               img_urls << img[:href] if img[:href] != nil
             end
             img_urls.each do | url |
               ary = url.split('/')
               next unless (ary[0] == 'http:') or (ary[0] == 'https:')
               ary = url.split('.')
               extnsn = ary[ary.size - 1]
               next unless (extnsn == 'jpg') or (extnsn == 'jpeg')
               rtn_urls << url
             end
             return rtn_urls
           end
           
           def save_imgs(dir, img_urls)
             client = HTTPClient.new
             img_urls.each_with_index do | url, i |
               file_name = \"\#{dir}\#{i}.jpg\"
               logger(\" downloading... \#{url}\")
               open(file_name, 'wb') do | file |
                 file.puts client.get_content(url)
               end
             end
           end
           
           def logger(msg)
             puts \"[pic.rb] \#{msg}\"
           end
           
           def proc_ex(ex)
             logger(' !!!!!!!!!!!!!!!')
             logger(' RAISE EXCEPTION')
             logger(\" class = \#{ex.class}\")
             logger(\" msg = \#{ex.message}\")
             logger(' trace = ')
             ex.backtrace.each do | line |
               logger(\" \#{line}\")
             end
           end
           
           # ------------------------------------ #
           # main
           puts('')
           logger('BEGIN download images...')
           begin
             url, dir = check_args
             doc = Nokogiri::HTML(open(url))
             img_urls = get_img_urls_from_doc(doc)
             save_imgs(dir, img_urls)
           rescue => ex
             proc_ex(ex)
           end
           logger('END download images...')
           puts('')
           """
    src2 = """
           #!/usr/bin/python
           # -*- coding: utf-8 -*-
           \"\"\"
           @brief FizzBuzz問題を実行するスクリプト
           @file fizzbuzz.py
           @version 1
           @since 2015/06/11
           @note [How to Use]
                 # python fizzbuzz.py ${MAX_NUM}
                 第一引数${MAX_NUM}にFizzBuzz問題の最大値を指定する。
           \"\"\"
           
           
           # --------------------------------------
           # import
           import sys
           
           
           # --------------------------------------
           # const
           ERR_ARG_NUM = \'Wrong number of arguments or invalid property assignment\'
           ERR_ARG_TYPE = \'Arguments type is mismatch\'
           USAGE = \'[Usage] # python fizzbuzz.py ${MAX_NUM}\n\'
           FIZZ = \'Fizz\'
           BUZZ = \'Buzz\'
           
           
           # --------------------------------------
           # mathod
           
           def check_args():
               \"\"\"
               @brief 引数のチェックを行う
               @details 引数が無い場合、引数が2つ以上ある場合、引数に数字以外を
                        指定した場合、Usageを表示して処理を終了する
               @param -
               @return -
               \"\"\"
               # 引数の取得
               args = sys.argv
           
               # 引数の数チェック
               if 2 != len(args):
                   print ERR_ARG_NUM
                   print USAGE
                   quit()
           
               # 引数の型チェック
               try:
                   int(args[1])
               except ValueError:
                   print ERR_ARG_TYPE
                   print USAGE
                   quit()
           
               # 抜けきったら終了
               return
           
           
           def fizzbuzz():
               \"\"\"
               @brief fizzbuzz問題を実行する
               @details 以下の条件で1行ずつ文字列を表示する
                        1から最大値まで順に処理していく
                        3の倍数であれば\"Fizz\"
                        5の倍数であれば\"Buzz\"
                        15の倍数であれば\"FizzBuzz\"
                        それ以外の数字であれば数字
               @param -
               @return -
               \"\"\"
               max_num = int(sys.argv[1])
               # 最大値の回数繰り返し
               for i in xrange(max_num):
                   # 0から始めてしまうので調整
                   num = i+1
                   if num % 15 == 0:
                       # 15の倍数
                       print FIZZ + BUZZ
                   elif num % 3 == 0:
                       # 3の倍数
                       print FIZZ
                   elif num % 5 == 0:
                       # 5の倍数
                       print BUZZ
                   else:
                       # その他
                       print num
           
           
           # --------------------------------------
           # main
           check_args()
           fizzbuzz()
           """
    src3 = """
           <!doctype html>
           <html>
             <head>
               <meta charset=\"utf-8\" />
               <meta name=\"format-detection\" content=\"telephone=no\" />
               <meta name=\"msapplication-tap-highlight\" content=\"no\" />
           <!--    <meta name=\"viewport\" content=\"user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi\" /> -->
               <link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\" />
               <!-- angular -->
               <script src=\"bower_components/angular/angular.js\"></script>
               <!-- jquery -->
               <script src=\"bower_components/jquery/dist/jquery.min.js\"></script>
               <!-- onsen ui -->
               <script src=\"bower_components/onsenui/build/js/onsenui.js\"></script>
               <link rel=\"stylesheet\" type=\"text/css\" href=\"bower_components/onsenui/build/css/onsenui.css\" />
               <link rel=\"stylesheet\" type=\"text/css\" href=\"bower_components/onsenui/build/css/onsen-css-components-blue-basic-theme.css\" />
               <link rel=\"stylesheet\" type=\"text/css\" href=\"bower_components/onsenui/build/css/list_icons.css\" />
               <script>
                 ons.bootstrap();
               </script>
               <title>Hello World</title>
             </head>
             <!--
             <body ng-controller=\"AppController\">
               <ons-navigator var=\"navigator\">
                 <ons-page ng-controller=\"PageController\">
                 </ons-page>
               </ons-navigator>
             </body>
             -->
             <body>
               <ons-page>
                 <ons-toolbar>
                   <div class=\"center\">List Icons</div>
                 </ons-toolbar>
                 <ons-list>
                   <ons-list-item modifier=\"tappable\">
                     2015.05.01 - 2015.05.30
                   </ons-list-item>
                   <ons-list-item modifier=\"chevron\">
                     Change Credit Card
                   </ons-list-item>
                 </ons-list>
               </ons-page>
             </body>
           </html>
           """
    src4 = """
           /! ----------------------------------------
           /! TopPage --------------------------------
           
           ons-navigator title=\"Navigator\" var=\"slNavi\"
             ons-page
               ons-toolbar
                 .center
                   |シフトラボ
               ons-list
                 /! 追加ボタン
                 ons-list-item(
                   modifier=\"tappable\"
                   onclick=\"moveToStartDay()\"
                 )
                   .(style=\"text-align:center;\")
                     ons-icon(
                       icon=\"fa-plus\"
                       size=\"20px\"
                     )
             
                 /! 作成済みのシフト
                 /! 2015.04
                 ons-list-item(
                   modifier=\"tappable\"
                   onclick=\"writeit()\"
                 )
                   ons-gesture-detector
                     #aiueo
                       |2015.04.01 - 2015.04.30
           
                 /! 2015.05
                 ons-list-item(
                   modifier=\"tappable\"
                   onclick=\"readit()\"
                 )
                   |2015.05.01 - 2015.05.31
           
                 ons-list-item(modifier=\"tappable\" onclick=\"moveToStartDay()\")
                   |moveToStartDay
                 ons-list-item(modifier=\"tappable\" onclick=\"moveToNumOfWorker()\")
                   |moveToNumOfWorker
                 ons-list-item(modifier=\"tappable\" onclick=\"moveToStyle()\")
                   |moveToNumOfStyle
                 ons-list-item(modifier=\"tappable\" onclick=\"moveToShiftOpt()\")
                   |moveToShiftOpt
                 ons-list-item(modifier=\"tappable\" onclick=\"moveToRest()\")
                   |moveToRest
                 ons-list-item(modifier=\"tappable\" onclick=\"moveToAddOpt()\")
                   |moveToAddOpt()
           
           
           /! ----------------------------------------
           /! SubContent -----------------------------
           
           /! tmp ----
           ons-template id=\"sample\"
             ons-page
               ons-toolbar
                 .left
                   ons-icon(
                     icon=\"fa-angle-double-left\"
                     size=\"40px\"
                     onclick=\"slNavi.popPage()\"
                   )
                 .center
                   | 作成済み
           
           
           /! start_day 開始日 -----------------------
           ons-template id=\"start_day\"
             ons-page(style=\"background-color: #7fbcad;\")
               ons-toolbar
                 .left
                   ons-icon(
                     icon=\"fa-angle-double-left\"
                     size=\"40px\"
                     onclick=\"slNavi.popPage()\"
                   )
                 .center
                   |シフト開始日
                 .right
                   ons-icon(
                     icon=\"fa-angle-double-right\"
                     size=\"40px\"
                     onclick=\"moveToMember()\"
                   )
           """
    msg.send msg.random [src1, src2, src3, src4]
