// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import ApexCharts from 'apexcharts'
import * as bootstrap from "bootstrap"
import Chart from 'chart.js/auto'
import * as echarts from 'echarts'
import * as quill from 'quill'
import * as DataTable from 'simple-datatables'
import * as tinymce from 'tinymce'
import "./php-email-form"
import "./main"


window.ApexCharts = ApexCharts;
window.bootstrap = bootstrap;
window.Chart = Chart;
window.echarts = echarts; 
window.quill = quill; 
window.DataTable = DataTable; 
window.tinymce = tinymce;

