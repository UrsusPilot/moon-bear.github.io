define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class TestView extends Backbone.View
    template: JST['app/scripts/templates/test.ejs']