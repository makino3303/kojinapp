// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .

$(function() {
  $('.slider').slick({
      prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
      nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
      dots: true,
      autoplay: true,
      autoplayspeed: 1000,
      arrows: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});

$(function() {
  $('.content-main-slides').slick({
      prevArrow:'<i class="fa fa-angle-left arrow arrow-leftchild"></i>',
      nextArrow:'<i class="fa fa-angle-right arrow arrow-rightchild"></i>',
      arrows: true,
      slidesToShow:4,
      slidesToScroll:4,
      centerMode: true,
      Padding: '100px',
  });
});


  // document.getElementById("#show-down-right-main-box-rate-button").onclick = function() {
  //   document.getElementById("#show-down-right-main-box-rate-button").innerHTML = `<div class="show-down-right-main-box-rate-check">
  //                 <i class="fas.fa-check"></i>
  //                 フィードバックをお寄せいただきありがとうございます。
  //               </div>`
  // };

// $(function() {
//   $('.show-down-right-main-box-rate-check').on('.show-down-right-main-box-rate-button', function(e){

//   }
// })
