`var path`
'use strict'

express = require 'express'
request = require 'request'
# redis = require 'redis'
path = require 'path' 
http = require 'http'
path = require 'path'
async = require 'async'
# redis = require 'redis'
# MongoClient = require('mongodb').MongoClient
serveStatic = require 'serve-static'

# redisHOST = 'redis'

# client = redis.createClient('6379', redisHOST)
# client.on 'error', (err) ->
#   console.log 'Error ' + err
#   return

# client.hgetall 'cityCentroids', (err, object) ->
#   console.log object
#   return



# MongoClient.connect 'mongodb://mongo:27017/atlasdb', (err, db) ->
#   console.log "trying to conncet to mongo`"
#   if err
#     throw err
#   db.collection('cities').find().toArray (err, result) ->
#     if err
#       throw err
#     console.log "results",result
#     return
#   return



Sequelize = require('sequelize')
sequelize = new Sequelize('atlasdb', 'postgres', ''
  host: 'postgresql'
  dialect: 'postgres')


# Model = sequelize.define('model',
#   type: Sequelize.STRING
#   name: Sequelize.STRING)

# sequelize.sync().then(->
#   Model.create
#     type: 'sometype'
#     name: 'somename'
# ).then (type) ->
#   console.log type.get(plain: true)
#   return

app = express()
app.disable 'etag'
app.set 'trust proxy', true
app.use serveStatic('./bower_components/semantic/dist')
app.use serveStatic('./scripts')
app.use serveStatic('./stylesheets')


app.use serveStatic('./scripts')


app.use serveStatic('./', 'index': [
  'index.html'
  'index.htm'
])

app.get '/', (req, res) ->
  res.render 'index', (err, html) ->
    res.send html
    return
  return


app.get '/grids/:msa', (req, res) ->
  sequelize.query('SELECT * FROM grid WHERE msa = :msa ',
    replacements: msa: "#{req.params.msa}"
    type: sequelize.QueryTypes.SELECT).then (object) ->
      res.json object
      return
    return
  return

app.get '/cities', (req, res) ->
  sequelize.query('SELECT * FROM city', type: sequelize.QueryTypes.SELECT).then (object) ->
    res.json object
    return
  return

app.get '/groups_data', (req, res) ->
  sequelize.query('SELECT * FROM group_data', type: sequelize.QueryTypes.SELECT).then (object) ->
    res.json object
    return
  return

app.get '/city_comparisons_all', (req, res) ->
  sequelize.query('SELECT * FROM city_comparison', type: sequelize.QueryTypes.SELECT).then (object) ->
    res.json object
    return
  return

app.get '/cityComparisonsData', (req, res) ->
  client.hgetall "city_comparison_data", (err, object) ->
    res.json object 
    return
  return



# app.get '/comparisonsData/:datacomponent', (req, res) ->
#   client.hgetall "#{req.params.datacomponent}", (err, object) ->
#     res.json object 
#     return
#   return

app.get '/us_json', (req, res) ->
  sequelize.query('SELECT * FROM us_json', type: sequelize.QueryTypes.SELECT).then (object) ->
    res.json object
    return
  # client.hgetall "us_json", (err, object) ->
  #   res.json object
  #   return 
  return 
 
  # client.get "us_json", (err, object) ->
  #   stringifiedObject = JSON.stringify(object.replace('"',''))
  #   jsonObject = JSON.parse(stringifiedObject)
  #   res.json jsonObject
  #   return
  # return 

app.get '/zipcode_business_geojson/:msa', (req, res) ->
  # sequelize.query("zipcode_business_geojson_#{req.params.msa}", type: sequelize.QueryTypes.SELECT).then (object) ->
  sequelize.query('SELECT * FROM zipcode_business', type: sequelize.QueryTypes.SELECT).then (object) ->
    res.json object
    return
  # client.hgetall "zipcode_business_geojson_#{req.params.msa}", (err, object) ->
  #   res.json object
  #   return
  return 




### Start the server ###

# server = app.listen(process.env.PORT or '8080', '0.0.0.0', ->
#   console.log 'App listening at http://%s:%s', server.address().address, server.address().port
#   console.log 'Press Ctrl+C to quit.'
#   console.log 'checking if adjustments work'
#   return
# )
# export the app object for test
module.exports =
  app: app
  port: 8080