define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class HomeView extends Backbone.View
    template: JST['app/scripts/templates/home.ejs']