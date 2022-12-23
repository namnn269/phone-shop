const passwordInput = document.querySelector("#password")
const passwordInput2 = document.querySelector("#password2")
const message = document.querySelector(".msg")
const phoneNumber = document.querySelector("#phone")

function checkRegister() {

	const pass = passwordInput.value;
	const pass2 = passwordInput2.value;
	if (isNaN(phoneNumber.value) || phoneNumber.value.length <= 9) {
		message.innerHTML = "SĐT không hợp lệ !!"
		return false;
	} else if (pass != pass2) {
		message.innerHTML = "Mật khẩu không khớp!!"
		return false;
	} else if (pass.length < 8 || pass2.length < 8) {
		message.innerHTML = "Mật khẩu tối thiểu 8 ký tự!!"
		return false;
	}
	message.innerHTML = ""
	return true;
}

