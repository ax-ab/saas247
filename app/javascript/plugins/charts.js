import Chart from 'chart.js'


function initCharts(){
  const ctx = document.getElementById('myChart');
  console.log(ctx.dataset.values.first);
  const labels12Months = ['2018-12', '2019-1','2019-2','2019-3','2019-4','2019-5','2019-6', '2019-7', '2019-8', '2019-9', '2019-10', '2019-11'];


  const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels12Months,
        datasets: [{
            label: 'Monthly spend',
            data: [680, 790, 800, 1000, 790, 800, 1000, 680, 790, 800, 1000, 900],
            backgroundColor: [
                // 'rgba(255, 99, 132, 0.2)',
                // 'rgba(54, 162, 235, 0.2)',
                // 'rgba(255, 206, 86, 0.2)',
                // 'rgba(75, 192, 192, 0.2)',
                // 'rgba(153, 102, 255, 0.2)',
                // 'rgba(255, 159, 64, 0.2)'
                // '#bfe9f5'
                //'rgb(180, 238, 255)',
                'rgba(180 ,238, 255, 0.2)',
                //  'rgba(180 ,238, 255, 0.1)',
                //'rgba(180 ,238, 255, 0.8758054247089461)',
                //'rgba(0, 212, 255, 1) 100%)'



            ],
            borderColor: [
            '#109CF1'



            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {

          xAxes: [{
            gridLines: {
                display:false
            }
            }],

            yAxes: [{
                ticks: {
                    beginAtZero: true,

                    gridLines: {
                borderDash: [8, 4],
                color: "#f9ca24",
              }
            }

            }]
        }
    }
  });
}



  export { initCharts }
