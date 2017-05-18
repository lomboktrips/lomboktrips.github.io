app.directive("hiGrid", function() {
    return {
    	restrict: 'E',
        templateUrl : "/templates/hi-grid.html"
    };
});

app.directive('hiSlider', function($timeout) {
  return {
    restrict: 'E',
    templateUrl: '/templates/hi-slider.html'
  };
});

app.directive('loading', function () {
      return {
        restrict: 'E',
        replace:true,
        template: '<div class="loading"><div class="spinner"><div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div><div class="rect5"></div></div></div>',
        link: function (scope, element, attr) {
              scope.$watch('loading', function (val) {
                  if (val)
                      $(element).show();
                  else
                      $(element).hide();
              });
        }
      }
});