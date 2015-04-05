module.exports = (robot) ->
  robot.respond /天気/, (msg) ->
    keyword = encodeURIComponent msg.match[1]
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
                          #.query(q: keyword)
                          .get()
    request (err, res, body) ->
      json = JSON.parse body
      text = "#{json.location.area}地方 #{json.location.prefecture}の天気\n"
      for obj in json.forecasts
                forcast = "●#{obj.dateLabel}の予報\n" + "天気 : #{obj.telop}\n"
                if (obj.temperature.min)
                    forcast += "最低気温:#{obj.temperature.min.celsius}℃\n"
                if (obj.temperature.max)
                    forcast += "最高気温:#{obj.temperature.max.celsius}℃\n"
                text += "\n"
                text = text + forcast
      text += "\n"
      text += "#{json.description.text}"
      msg.send text
