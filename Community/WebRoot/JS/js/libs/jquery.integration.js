//整合(integration)页面js
$(document).ready(function(){$(".megamenu").megamenu();});
//slider.jsp 滑动条样式
$(function(){
	$('.scroll-pane').jScrollPane();
});
//
$(document).ready(function($) {
	$(".scroll").click(function(event){		
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
	});
});
//至页顶
$(document).ready(function() {
	var defaults = {
		containerID: 'toTop', // fading element id
		containerHoverID: 'toTopHover', // fading element hover id
		scrollSpeed: 1200,
		easingType: 'linear' 
	};
	$().UItoTop({ easingType: 'easeOutQuart' });
	
});
//single.jsp 商品图片展示及放大
$(document).ready(function($){
	
	$('#etalage').etalage({
		thumb_image_width: 300,
		thumb_image_height: 400,
		
		show_hint: true,
		click_callback: function(image_anchor, instance_id){
			alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
		}
	});
	// This is for the dropdown list example:
	$('.dropdownlist').change(function(){
		etalage_show( $(this).find('option:selected').attr('class') );
	});

});
//single.jsp 图片滚动
$(window).load(function() {

	$("#flexiselDemo3").flexisel({
		visibleItems: 5,
		animationSpeed: 1000,
		autoPlay: true,
		autoPlaySpeed: 3000,    		
		pauseOnHover: true,
		enableResponsiveBreakpoints: true,
    	responsiveBreakpoints: { 
    		portrait: { 
    			changePoint:480,
    			visibleItems: 1
    		}, 
    		landscape: { 
    			changePoint:640,
    			visibleItems: 2
    		},
    		tablet: { 
    			changePoint:768,
    			visibleItems: 3
    		}
    	}
    });
    
});
//single.jsp tab切换
$(document).ready(function() {
	$("#Commodity_introduction").show();
    $("#Evaluation").hide();
});
$(document).ready(function() {
    $("#cbtn").click(function() {
        $("#Commodity_introduction").show();
		$("#Evaluation").hide();
    });
	$("#ebtn").click(function() {
        $("#Commodity_introduction").hide();
		$("#Evaluation").show();
    });
});
//single.jsp验证数量
$(document).ready(function(){
	$("#addlink").click(function(){
		var num = $("#dynamnum").val();
		num++;
		$("#dynamnum").val(num);
		$("#gsNum").val(num);
	});
	$("#redulink").click(function(){
		var num = $("#dynamnum").val();
		if(num>1) num--;
		$("#dynamnum").val(num);
		$("#gsNum").val(num);
	});
	$("#dynamnum").keyup(function(){
		var num = $("#dynamnum").val();
		if(isNaN(num)||num<=0){
			$("#dynamnum").val(1);
		}
	});
});
