import Chart from 'chart.js'

function initCharts(){
  const ctx = document.getElementById('myChart');
  const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['1 Oct', '8 Oct', '16 Oct', '31 Oct'],
        datasets: [{
            label: 'Monthly spend',
            data: [680, 790, 383, 1853],
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
