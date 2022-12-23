const emailInput = document.querySelector('#email');
const passwordInput = document.querySelector('#password');
const message = document.querySelector('.msg');

function checkEmpty() {
	const email = emailInput.value;
	const password = passwordInput.value;
	if (email == '' || password == '') {
		message.innerHTML = "Không được để trống !!!";
		return false;
	} else if( password.length < 8){
		message.innerHTML = "Mật khẩu tối thiếu 8 ký tự !!!";
		return false;
	}
	return true;
}

