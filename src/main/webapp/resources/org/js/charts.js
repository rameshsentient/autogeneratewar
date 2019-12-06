      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Date');
      data.addColumn('number', 'Open Transaction');
      data.addColumn('number', 'Closed Transaction');
      data.addColumn('number', 'Assigned');
      // data.addColumn('number', 'Delayed');

      data.addRows([
        ['Mar 5',  37.8, 80.8, 41.8],
        ['Mar 15',  30.9, 69.5, 32.4],
        ['Mar 25',  25.4,   57, 25.7],
        ['Apr 5',  11.7, 18.8, 10.5],
        ['Apr 15',  11.9, 17.6, 10.4],
        ['Apr 25',   8.8, 13.6,  7.7],
        ['June 5',   7.6, 12.3,  9.6],
        ['June 15',  12.3, 29.2, 10.6],
        ['June 25',  16.9, 42.9, 14.8],
        ['July 5', 12.8, 30.9, 11.6],
      ]);

      var options = {
        chart: {
          title: 'Transaction status',
        },
        position :'bottom',
        width: 1000,
        height: 500
      };

      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }