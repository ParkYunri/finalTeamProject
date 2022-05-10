<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/adopt/adoptView.css" type="text/css">
<style>
/*모달css*/
	.modal {
	display: none;
	z-index: 500;
	width: 100%;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.3);
}

.modal button {
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}

.modalBox {
	position: relative;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -20%);
	background-color: #ffffff;
	width: 40%;
	height: 20%;
	text-align: center;
}
.modaltop{
	
	background-color: red;
	height:40%;
	overflow: hidden;
}
.modalbody{
	padding-top:30px;
	background-color: blue;
	width:100%;
	height:60%;
	overflow: hidden;
	float: left;
}
#messagecontent{
	width:70%;
	height:70%;
	
}

#messageSubmit{
	width:10%;
	height: 70%;
}




</style>
<script type="text/javascript">
	
	$(function(){
		console.log(123)
		$(document).on('click','#chatBtn',function(){
			$(".modal").show();
		});
		
		//.modal안에 button을 클릭하면 .modal닫기
		$(".modal button").click(function(){
			$(".modal").hide();
		});
		
		//.modal밖에 클릭시 닫힘
		$(".modal").click(function (e) {
		    if (e.target.className != "modal") {
		      return false;
		    } else {
		      $(".modal").hide();
		    }   
	  	});
		
		$('#messagebtn').on('click',function(){
	    	
			//메세지 내용 공백 검사
	    	var content=document.getElementById("messagecontent");
			if(content.value==""){
				alert("메세지를 입력해주세요.");
				content.focus();
				return false;
			}
			var username = document.getElementById("username");//메세지 받는 계정
			
			var content = document.getElementById("messagecontent");//내용
			var logName = "${logName}";
			
			//로그인 상태일 경우 메세지 보내기 진행
			if(logName!=null){
				//메세지 보내기 절차
				var url= "${url}/message/messagesend";
				var params = "username="+username.value+"&content="+messagecontent.value;
				$.ajax({
					url:url,
					data:params,
					success:function(result){
						var $result = $(result);
						alert("쪽지를 보냈습니다.");
						$(".modal").hide();
					},
					error:function(e){
						console.log(e.resopnseText);
					}
				});
			}
			else{
				alert("로그인후 이용해주세요.");
				return false;
			}

	    	/*$('#messageForm').submit();*/
		});
	});

</script>

<div class="Adopt_group container">
	<div class="Adopt_logo"><h1><i class="fa-solid fa-paw"></i>입양 프로필<i class="fa-solid fa-paw"></i></h1></div>
	<div class="Adopt_img"><img name="filename1" src="/img/board/adopt/cat.jpeg"></div>
	<br/>
	<div class="Adopt_content">
		고양이의 입양과 임시보호를 올리는 게시판입니다. 내눈에 순화적 길고양로 보여도 가엽다고 무조건 입양글을 올리면
		안됩니다. 길에서 살아갈 수 없는 고양이에 한해 성격파악후 입양을 추진해야 해당 고양이에게 피해가 없답니다. 입양은 아이의
		묘생 전체가 좌지우지되는 일입니다. 보내는 분들도 입양하시는 분들 모두 고양이를 존중하는 신중한 판단을 요합니다.	
		<br/><br/>
		 제 수명을 다할 때까지 사랑해주고 보호해 주셔야 하며, 실외 또는 외출 고양이로 키우시는 것은 안됩니다.<br/>
		 - 입양 후, 3개월 간은 임시보호기간입니다.  지속적인 연락 등이 되지 않거나, 소식을 보내주시지 않으면 입양이 취소됩니다.<br/>
  		 - 부득이한 사정으로 키우지 못하게 되시는 경우, 반드시 원보호자에게 다시 돌려 보내주셔야 합니다.<br/>
  		 - 결혼을 앞둔 분, 신혼이신 분은 안됩니다.<br/>
  		 - 미성년자는 부모의 동의가 있어도 안됩니다.<br/>
  		 - 입양신청서를 작성해서 이메일로 보내주셔야 합니다.(메일을 보내시면 입양조건에 동의하신 것으로 간주합니다.)<br/>
		이름, 나이, 전화번호, 현주소, 직업, 가족상황과 입양에 대한 반응등을 적어서 보내주세요.
	</div>
	<div class="Adopt_files">
		<img src="img/board/adopt/cat.jpeg" alt="고양이이미지">
		<img src="img/board/adopt/cat.jpeg" alt="고양이이미지">
	</div>
	<div class="row Adopt_info">
		<div class="col-10 Adopt_host">
			게시글 작성자 정보<br/>
			게시글 작성자 정보<br/>
			게시글 작성자 정보<br/>
			게시글 작성자 정보<br/>
		</div>
		<div class="col-2 Adopt_chatBtn">
			<input type="button" id="chatBtn" value="쪽지보내기"/>
		</div>
	</div>
	<br/>
	<div class="Adopt_reply">
	<h3>댓글</h3>
	<div>
		
		<input type="text" name="content" id="replyContent"/>
		
		
		<input type="button" id="replyBtn" value="등록" />
	</div>
	



</div>
</div>
<br/><br/>

				
<!-- 팝업 될 곳 -->
	<div class="modal">
		<button>&times;</button>
		<div class="modalBox">
			<div class="modaltop">
				<br>
				<h4>설명부분</h4>
			</div>
			<div class="modalbody">
				<form method="get" id="messageForm" action="#">			
					<input type="text" name="messagecontent" id="messagecontent" maxlength="100" />					
					<input type="hidden" name ="username" id="username" value="서범석계정1" maxlength="100" />
					<input type="button" value="전송" id="messagebtn"/>				
					
				</form>
				
			</div>
			
		</div>
	</div>