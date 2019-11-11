var app = angular.module('sentiApp',['ngStorage','ngFileUpload','ngTagsInput','datatables','datatables.buttons','datatables.tabletools']);

app.controller('AngularWayCtrl', AngularWayWithOptionsCtrl);

function AngularWayWithOptionsCtrl( DTOptionsBuilder, DTColumnDefBuilder) {
    var vm = this;
    vm.persons = [];
    vm.dtOptions = DTOptionsBuilder.newOptions()
    
    .withOption('bPaginate', false).withOption('bInfo', false)
    .withOption('lengthChange', false)
    .withOption('language', {
    	infoEmpty: "no results found",
        searchPlaceholder: "Search here.."
      })
    .withButtons([]);
    vm.dtColumnDefs = [
        DTColumnDefBuilder.newColumnDef(0),
        DTColumnDefBuilder.newColumnDef(0).notSortable()
    ];
    
};

app.filter('capitalize', function() {
    return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    }
});