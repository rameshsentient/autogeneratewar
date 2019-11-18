 $(document).ready(function(){
    $('#selector_div').show();
     $('#receiver_div').hide();

     $('#sendMap').click(function(){
        $('#selector_div').show();
         $('#receiver_div').hide();
     })

      $('#receiveMap').click(function(){
        $('#receiver_div').show();
         $('#selector_div').hide();
     })
 })

   google.charts.load('current', {'packages':['geochart']});
      google.charts.setOnLoadCallback(drawSender);


function drawSender() {

        var data = google.visualization.arrayToDataTable([ ['Country', 'Transaction Amount'],
         ['Germany', 100000],
          ['United States', 250000],
          ['Brazil', 300000],
          ['France', 25000],['Russia',810000],['India',774500],
          ['South Korea',72000]]);

        var options = {
           chart: {
              title: 'Transaction status',
          },
          
          colorAxis :  {colors: ['#ff8181','#ff0f0f',]},
          width: 1100,
          height: 400
        };

   var chart = new google.visualization.GeoChart(document.getElementById('selector_div'));

        chart.draw(data, options);
      }


         // google.charts.load('current', {'packages':['geochart']});
      google.charts.setOnLoadCallback(drawReceiver);


function drawReceiver() {

        var data = google.visualization.arrayToDataTable([ ['Country', 'Transaction Amount'],
          ['Portugal', 100000],
          ['Greenland', 250000],
          ['Canada', 300000],
          ['Japan', 25000],['Brazil',110000],['Australia',564500],
          ['Paraguay',856000],['China',72000]]);

        var options = {
           chart: {
              title: 'Transaction status',
          },
          colorAxis :  {colors: ['#83c3ff','#3d81c0']},
          width: 800,
          height: 400
        };

        var chart = new google.visualization.GeoChart(document.getElementById('receiver_div'));

        chart.draw(data, options);
      }