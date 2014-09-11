mainApp = angular.module("MainApp", [])

mainApp.controller("Clock", function($scope){
  $scope.currentTime = new Date();
})
