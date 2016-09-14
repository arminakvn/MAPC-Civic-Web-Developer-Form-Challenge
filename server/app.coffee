`var path`
'use strict'

express = require 'express'
request = require 'request'
path = require 'path' 
http = require 'http'
path = require 'path'
async = require 'async'
redis = require 'redis'
serveStatic = require 'serve-static'
redisHOST = 'redis'
client = redis.createClient('6379', redisHOST)
client.on 'error', (err) ->
  console.log 'Error in connecting to redis database' + err
  return

app = express()
app.disable 'etag'
app.set 'trust proxy', true
app.use serveStatic('./bower_components/semantic/dist')
app.use serveStatic('./bower_components/jquery/dist')
app.use serveStatic('./scripts')
app.use serveStatic('./stylesheets')
app.use serveStatic('./scripts')


app.use serveStatic('./', 'index': [
  'index.html'
  'index.htm'
])
app.set 'view engine', 'ejs'
app.get '/', (req, res) ->
  res.render 'index', (err, html) ->
    res.send html
    return
  return


app.get '/forminputemail/:email', (req, res) ->
  console.log req.params.email
  client.sadd [
    'emails'
    req.params.email
  ], (err, reply) ->
    res.json {'status': reply}
    # 3
  return


module.exports =
  app: app
  port: 8080