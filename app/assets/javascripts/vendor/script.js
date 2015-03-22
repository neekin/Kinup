(function() {
        window.onscroll = function() {
            var top = document.documentElement.scrollTop || document.body.scrollTop;
            if (top > 40) {
                $(".topmenu").addClass("topmenusrcoll");
            } else if (top < 20) {
                $(".topmenu").removeClass("topmenusrcoll");
        }
        console.log(top)
        if(top>400)
        {

        	$(".goBackTop").css("display","block");
        }
        else if( top<400)
        {
	$(".goBackTop").css("display","none");

        }
    }
})()