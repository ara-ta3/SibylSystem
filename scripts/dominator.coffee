# Description:
#   対象の脅威判定が更新されました。
#
# Commands:
# #
#

Dominator =  require "../sibyl/Dominator"

module.exports = (robot) ->
  robot.respond /dominate$/i, (msg) ->
    msg.send "携帯型心理診断鎮圧執行システム、ドミネーター起動しました。"

  robot.respond /dominate (.*)$/i, (msg) ->
    target =  msg.match[1]
    crimeCoefficient = Math.floor(Math.random() * 1000)
    message = Dominator.detectMode crimeCoefficient
    msg.send message

