// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"
import "bootstrap";
import "bootstrap-datepicker"
import "bootstrap-datepicker-css"
document.addEventListener('DOMContentLoaded', function() {
    const datepickers = document.querySelectorAll('.datepicker');
    datepickers.forEach(function(el) {
      new bootstrap.Datepicker(el, {
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
      });
    });
  });