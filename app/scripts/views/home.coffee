define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class HomeView extends Backbone.View
    el: '#main-context',
    template: JST['app/scripts/templates/intro.ejs'],
    render: ->
      $(@el).html(@template())
