$(function() {
	check();
}); // 전체 function end

/*function idCheck(boo) {
	$('#id_btn').click(function() {
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
				
				boo = data.check;
				console.log('아이디 : ' + boo);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}

		})
	})
	
	var idBoo = boo;
	return join(idBoo, nicKNameBoo);
};
*/
function check() {
	var idBoo = false;
	var nickNameBoo = false;
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
					nickNameBoo = true;
					alert('사용 가능한 닉네임 입니다.');
				} else {
					alert('이미 존재하는 닉네임 입니다.');
				}
				
				console.log('닉네임 : ' + nickNameBoo)
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
				
				idBoo = data.check;
				console.log('아이디 : ' + idBoo);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}

		})
	})
	
	return join(idBoo, nickNameBoo);
};

function join(id, nickName) {
	$('#join_btn').on('click', function() {
		console.log('회원가입');
		console.log('idBoo : ' + id);
		console.log('nickNameBoo : ' + nickName);
		event.preventDefault();
		if($('#user_id').val() == "") alert('아이디란이 비어있습니다.');
		if($('#user_pw').val() == "") alert('암호란이 비어있습니다.');
		if($('#user_pw').val() != $('#pw_confirm').val()) alert('암호가 일치하지 않습니다.');
		if($('#user_nickName').val() == "") alert('닉네임란이 비어있습니다.');
		if($('#user_tel').val() == "") alert('전화번호란이 비어있습니다.');
		if(!id) alert('아이디 중복체크를 해주세요');
		if(!nickName) alert('닉네임 중복체크를 해주세요');
	})
};