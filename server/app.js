// Generated by CoffeeScript 1.10.0
(function() {
  var path;
  'use strict';
  var Sequelize, app, async, express, http, path, request, sequelize, serveStatic;

  express = require('express');

  request = require('request');

  path = require('path');

  http = require('http');

  path = require('path');

  async = require('async');

  serveStatic = require('serve-static');

  Sequelize = require('sequelize');

  sequelize = new Sequelize('atlasdb', 'postgres', '', {
    host: 'postgresql',
    dialect: 'postgres'
  });

  app = express();

  app.disable('etag');

  app.set('trust proxy', true);

  app.use(serveStatic('./bower_components/semantic/dist'));

  app.use(serveStatic('./scripts'));

  app.use(serveStatic('./stylesheets'));

  app.use(serveStatic('./scripts'));

  app.use(serveStatic('./', {
    'index': ['index.html', 'index.htm']
  }));

  app.get('/', function(req, res) {
    res.render('index', function(err, html) {
      res.send(html);
    });
  });

  app.get('/grids/:msa', function(req, res) {
    sequelize.query('SELECT * FROM grid WHERE msa = :msa ', {
      replacements: {
        msa: "" + req.params.msa
      },
      type: sequelize.QueryTypes.SELECT
    }).then(function(object) {
      res.json(object);
    });
    return;
  });

  app.get('/cities', function(req, res) {
    sequelize.query('SELECT * FROM city', {
      type: sequelize.QueryTypes.SELECT
    }).then(function(object) {
      res.json(object);
    });
  });

  app.get('/groups_data', function(req, res) {
    sequelize.query('SELECT * FROM group_data', {
      type: sequelize.QueryTypes.SELECT
    }).then(function(object) {
      res.json(object);
    });
  });

  app.get('/city_comparisons_all', function(req, res) {
    sequelize.query('SELECT * FROM city_comparison', {
      type: sequelize.QueryTypes.SELECT
    }).then(function(object) {
      res.json(object);
    });
  });

  app.get('/cityComparisonsData', function(req, res) {
    client.hgetall("city_comparison_data", function(err, object) {
      res.json(object);
    });
  });

  app.get('/us_json', function(req, res) {
    sequelize.query('SELECT * FROM us_json', {
      type: sequelize.QueryTypes.SELECT
    }).then(function(object) {
      res.json(object);
    });
  });

  app.get('/zipcode_business_geojson/:msa', function(req, res) {
    sequelize.query('SELECT * FROM zipcode_business', {
      type: sequelize.QueryTypes.SELECT
    }).then(function(object) {
      res.json(object);
    });
  });


  /* Start the server */

  module.exports = {
    app: app,
    port: 8080
  };

}).call(this);