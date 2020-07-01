$(function() {
	check();
}); // 전체 function end

function check() {
	var isId = false;
	var isNickName = false;
	
	$('#nickName_btn').on('click', function() {
		event.preventDefault();
		var userName = $('#user_nickName').val();
		$.ajax({
			url : "nickNameCheck",
			type : "POST",
			data : {
				user_nickName : userName
			},
			dataType : "json",
			async : false,
			success : function(data) {
				if (data.check) {
					alert('사용 가능한 닉네임 입니다.');
				} else {
					alert('이미 존재하는 닉네임 입니다.');
				}
				
				isNickName = data.check;
				console.log('닉네임 : ' + isNickName);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		})
		
	})
	
	$('#id_btn').on('click', function() {
		event.preventDefault();
		var userid = $('#user_id').val()
		$.ajax({
			url : "idCheck",
			type : "POST",
			data : {
				user_id : userid
			},
			dataType : "json",
			async : false,
			success : function(data) {
				if (data.check) {
					alert('사용가능한 아이디입니다.');
				} else {
					alert('이미 존재하는 아이디입니다.');
				}
				
				isId = data.check;
				console.log('아이디 : ' + isId);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}

		})
	})
	
	return join(isId, isNickName);
};

function join(id, nickName) {
	$('#join_btn').on('click', function(event) {
		event.preventDefault();
		
		if($('#user_id').val() == "") alert('아이디란이 비어있습니다.');
		if($('#user_pw').val() == "") alert('암호란이 비어있습니다.');
		if($('#user_pw').val() != $('#pw_confirm').val()) alert('암호가 일치하지 않습니다.');
		if($('#user_nickName').val() == "") alert('닉네임란이 비어있습니다.');
		if($('#user_tel').val() == "") alert('전화번호란이 비어있습니다.');
		if(id == 'false') alert('아이디 중복체크를 해주세요');
		if(nickName == 'false') alert('닉네임 중복체크를 해주세요');
		
		
	})
};