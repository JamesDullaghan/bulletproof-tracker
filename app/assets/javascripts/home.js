  var barChartData = {
    labels : ["Jan.","Feb.","Mar.","Apr.","May","June","July"],
    datasets : [
      {
        fillColor : "rgba(222,80,0,0.5)",
        strokeColor : "rgba(222,80,0,1)",
        data : [207,201,198,186,181,178,173]
      },
      {
        fillColor : "rgba(57,57,59,0.5)",
        strokeColor : "rgba(57,57,59,1)",
        data : [208,203,198,194,189,181,177]
      }
    ]
  }

  var barChartOptions = {
    //String - Scale label font declaration for the scale label
    scaleFontFamily : "'Helvetica'",
    //Number - Scale label font size in pixels
    scaleFontSize : 12,
    //String - Scale label font weight style
    scaleFontStyle : "normal",
    //Number - Number of animation steps
    animationSteps : 300,
    //String - Animation easing effect
    animationEasing : "easeOutQuart"
  }

var bce = document.getElementById("indexBarChart").getContext("2d");

var myBarExample = new Chart(bce).Bar(barChartData, barChartOptions);

// Pie chart data
var pieChartData = [
  {
    value: 90,
    color:"#F27620"
  },
  {
    value : 54,
    color : "#DE5200"
  },
  {
    value : 36,
    color : "#39393B"
  }
]

var pce = document.getElementById("indexPieChart").getContext("2d");

var myPieExample = new Chart(pce).Pie(pieChartData);


// Doughnut Chart
var doughnutChartData = [
  {
    value: 120,
    color:"#39393B"
  },
  {
    value : 120,
    color : "#DE5200"
  },
  {
    value : 120,
    color : "#F27620"
  }

]

var dce = document.getElementById("indexDoughnutChart").getContext("2d");

var myDoughnutExample = new Chart(dce).Doughnut(doughnutChartData, doughnutChartOptions)

var doughnutChartOptions = {
  //Boolean - Whether we should show a stroke on each segment
  segmentShowStroke : true,
  //String - The colour of each segment stroke
  segmentStrokeColor : "#fff",
  //Number - The width of each segment stroke
  segmentStrokeWidth : 2,
  //The percentage of the chart that we cut out of the middle.
  percentageInnerCutout : 50,
  //Boolean - Whether we should animate the chart
  animation : true,
  //Number - Amount of animation steps
  animationSteps : 300,
  //String - Animation easing effect
  animationEasing : "easeOutBounce",
  //Boolean - Whether we animate the rotation of the Doughnut
  animateRotate : true,
  //Boolean - Whether we animate scaling the Doughnut from the centre
  animateScale : true,
  //Function - Will fire on animation completion.
  onAnimationComplete : null
}


