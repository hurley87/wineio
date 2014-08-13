var app = angular.module("switchableGrid", ['ngResource']);

// Create and register the new "instagram" service
app.factory('instagram', function($resource){

  return {
    fetchPopular: function(callback){

      // The ngResource module gives us the $resource service. It makes working with
      // AJAX easy. Here I am using the client_id of a test app. Replace it with yours.

      var api = $resource('https://api.instagram.com/v1/tags/wine/media/recent?client_id=:client_id&callback=JSON_CALLBACK',{
        client_id: '0c766e6dbec44777b5e340a3dfef2d80'
      },{
        // This creates an action which we've chosen to name "fetch". It issues
        // an JSONP request to the URL of the resource. JSONP requires that the
        // callback=JSON_CALLBACK part is added to the URL.

        fetch:{method:'JSONP'}
      });

      api.fetch(function(response){

        // Call the supplied callback function
        callback(response.data);

      });
    }
  }

});

// The controller. Notice that I've included our instagram service which we
// defined below. It will be available inside the function automatically.

function SwitchableGridController($scope, instagram){

  // Default layout of the app. Clicking the buttons in the toolbar
  // changes this value.

  $scope.layout = 'list';

  $scope.pics = [];

  // Use the instagram service and fetch a list of the popular pics
  instagram.fetchPopular(function(data){

    // Assigning the pics array will cause the view
    // to be automatically redrawn by Angular.
    $scope.pics = data;
  });

}