<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var getUser = new RegExp("^[a-zA-Z0-9]{3,16}$");
var getEmail = new RegExp("^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]");

var idCheck = false;
var pwdCheck = false;
var pwd2Check = false;
var emailCheck = false;

//ID 유효성 검증
$('#id').on(
    {
        keyup : function(){
            if(getUser.test($('#id').val()) != true) {  //|| !$('#userId').val() == ""
                var ment = "잘못된 형식으로 입력하셨습니다.";
                    $('.tdid').text(ment);
                    $('#id').css("border","1px solid red");
                    idCheck=false;
            } else {
                var ment = "올바른 형식으로 입력하셨습니다.";
                   $('.tdid').text(ment);
                   $('#id').css("border","1px solid green");
                   idCheck=true;
            };
    }, 
      blur : function() {
          $('.tdid').empty();
      }
    
});


//PASSWORD 검증
$('#pwd').on(
        {
            keyup : function(){
                
                if(getUser.test($(this).val()) != true) {  
                    var ment = "잘못된 형식으로 입력하셨습니다.";
                        $('.tdpw').text(ment);
                        console.log($('#userPass').val());
                        $('#pwd').css("border","1px solid red");
                        pwdCheck=false;
                } else {
                    var ment = "올바른 형식으로 입력하셨습니다.";
                       $('.tdpw').text(ment);
                       $('#pwd').css("border","1px solid green");
                       pwdCheck=true;
                };
        },
          blur : function() {
              $('.tdpw').empty();
          }

});


//PASSWORD 일치여부 
$('#pwdcheck').on(
        {
            keyup : function(){ 
                   if($('#pwd').val() != $('#pwdcheck').val()){
                       $('.tdpwch').text('암호가 일치하지 않습니다');
                       $('#pwdcheck').css("border","1px solid red");
                        pwd2Check = false;
                   }else{
                       $('.tdpwch').text('암호가 일치합니다');
                       $('#pwdcheck').css("border","1px solid green");
                        pwd2Check = true;
                   }
        }, 
                blur : function() {
              $('.tdpwch').empty();
          }

});


//Email 검증 

$('#email').on(
        {
            keyup : function(){    
                if(getEmail.test($(this).val()) != true) {  
                    var ment = "잘못된 형식으로 입력하셨습니다.";
                        $('.tdmail').text(ment);
                        $('#email').css("border","1px solid red");
                        emailCheck = false;
                } else {
                    var ment = "올바른 형식으로 입력하셨습니다.";
                       $('.tdmail').text(ment);
                       $('#email').css("border","1px solid green");
                       emailCheck = true;
                };
        },
            blur : function() {
            $('.tdmail').empty();
               }

});
</script>