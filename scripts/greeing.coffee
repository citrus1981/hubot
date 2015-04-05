# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   citrus1981 <citrus8119@gmail.com>

module.exports = (robot) ->
  robot.respond /おはよう/, (res) ->
    res.reply "おはようございます"

  robot.hear /おはよう/, ->
    res.send "おはようございます"

  robot.hear /おつかれ/, ->
    res.send "お疲れまでした"
