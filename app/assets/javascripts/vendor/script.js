//    window.onscroll = function() {
//        var top = document.documentElement.scrollTop || document.body.scrollTop;
//        if (top > 40) {
//            $(".topmenu").addClass("topmenusrcoll");
//        } else if (top < 20) {
//            $(".topmenu").removeClass("topmenusrcoll");
//    }
//    console.log(top)
//    if(top>400)
//    {
//
//    	$(".goBackTop").css("display","block");
//    }
//    else if( top<400)
//    {
//$(".goBackTop").css("display","none");
//
//    }
//}
$(function () {
    var win = $(window);
    win.scroll(function () {
        if (win.scrollTop() > 400) {
            $(".goBackTop").show();
        } else {
            $(".goBackTop").hide();
        }
        if(win.scrollTop()>20)
        {
            $(".topmenu").addClass("topmenusrcoll");
        }
        else if(win.scrollTop()<20)
        {
            $(".topmenu").removeClass("topmenusrcoll");
        }
    });
    $(".goBackTop").click(function () {
      $('html,body').animate({scrollTop:0},(win.scrollTop() /2))
    });
})

