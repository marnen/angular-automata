angular.module('filters').filter 'cells', ['$sce', ($sce) ->
  (string) ->
    stringArray = (string || '').split ''
    $sce.trustAsHtml(("<span class='cell' data-value='#{char}'></span>" for char in stringArray).join '')
]
