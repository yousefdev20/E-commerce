//To Make Slider Responsive With All Screens More Responsive
$(document).ready(function(){
    var windowHeight = (window.innerHeight);
    var first_nav = parseInt($('.navbar').css('height'));
    var algo = windowHeight - (first_nav*2);
    $('.cus-height').css('height',algo+20);
});