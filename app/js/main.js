$(document).ready(function () {
  $('.slider-items').slick({
    autoplay: true,
    autoplaySpeed: 2000,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    variableWidth: true,
    prevArrow: $('.prev'),
    nextArrow: $('.next'),
  });
});