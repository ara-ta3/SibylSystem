# Description:
#   対象の脅威判定が更新されました。
#
# Commands:
# #
#

class Dominator
  @Parallelizer = 100
  @Eliminator = 300
  @Decomposer = 500

  @detectMode: (crimeCoefficient) ->
    prefix = "犯罪係数" + crimeCoefficient + "。 "
    if crimeCoefficient < @Parallelizer
      return prefix + "執行対象ではありません。トリガーをロックします"
    else if crimeCoefficient <= @Eliminator
      return prefix + "執行対象です。セーフティを解除します。執行モード、ノンリーサル・パラライザー。\n" +
            "落ち着いて照準を定め対象を制圧してください。"
    else if crimeCoefficient < @Decomposer
      return prefix + "執行対象です。セーフティを解除します。執行モード、リーサル・エリミネーター。\n" +
            "慎重に照準を定め対象を排除してください。"
    else
      return prefix + "執行対象です。セーフティを解除します。執行モード、デストロイ・デコンポーザー。\n" +
            "対象を完全排除します。ご注意ください。"

module.exports = (robot) ->
  robot.respond /dominate$/i, (msg) ->
    msg.send "携帯型心理診断鎮圧執行システム、ドミネーター起動しました。"

  robot.respond /dominate (.*)$/i, (msg) ->
    target =  msg.match[1]
    crimeCoefficient = Math.floor(Math.random() * 1000)
    message = Dominator.detectMode crimeCoefficient
    msg.send message

