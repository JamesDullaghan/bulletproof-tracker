var barChartData={labels:["Jan","Feb","Mar","Apr","May","Jun","Jul"],datasets:[{fillColor:"rgba(222,80,0,0.5)",strokeColor:"rgba(222,80,0,1)",data:[207,201,198,186,181,178,173]},{fillColor:"rgba(57,57,59,0.5)",strokeColor:"rgba(57,57,59,1)",data:[208,203,198,194,189,181,177]}]},barChartOptions={scaleFontFamily:"'Helvetica'",scaleFontSize:12,scaleFontStyle:"normal",animationSteps:300,animationEasing:"easeOutQuart"},bce=document.getElementById("indexBarChart").getContext("2d"),myBarExample=new Chart(bce).Bar(barChartData,barChartOptions),pieChartData=[{label:"Fats",value:90,color:"#F27620"},{label:"Proteins",value:54,color:"#DE5200"},{label:"Carbs",value:36,color:"#39393B"}],pce=document.getElementById("indexPieChart").getContext("2d"),myPieExample=new Chart(pce).Pie(pieChartData),doughnutChartData=[{label:"Sleep",value:120,color:"#39393B"},{label:"Excercise",value:120,color:"#DE5200"},{label:"Work",value:120,color:"#F27620"}],dce=document.getElementById("indexDoughnutChart").getContext("2d"),myDoughnutExample=new Chart(dce).Doughnut(doughnutChartData,doughnutChartOptions),doughnutChartOptions={segmentShowStroke:!0,segmentStrokeColor:"#fff",segmentStrokeWidth:2,percentageInnerCutout:50,animation:!0,animationSteps:300,animationEasing:"easeOutBounce",animateRotate:!0,animateScale:!0,onAnimationComplete:null};