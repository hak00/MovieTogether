<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".login-window").click(function() {
		
		// Getting the variable's value from a link 
		var loginBox = $(this).attr('href');

		//Fade in the Popup and add close button
		$(loginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
	});
});//로그인
</script>

    <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="/MovieTogether5/assets/img/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
          <form method="post" class="signin" action="/MovieTogether5/User/login.do" name="login">
                <fieldset class="textbox">
            	<label class="username">
                <span>아이디</span>
                <input id="username" name="id" type="text" autocomplete="on" placeholder="Username">
                </label>
                
                <label class="password">
                <span>비밀 번호</span>
                <input id="password" name="pass" type="password" placeholder="Password">
                </label>
                
                <button class="submit button" type="submit"><span style="color: black; font-weight: 400;">로그인 하기</span></button>
                </fieldset>
          </form>
	</div>
	
	