
const inputQuantity = document.querySelectorAll(".input-quantity");
const inputPrice = document.querySelectorAll(".price");
const totalMoneyFiled = document.querySelector(".totalMoney");
const phoneNumber = document.querySelector("#phonenum");
const msg = document.querySelector(".msg")


function changeMoney() {

	const quantityArr = [];
	const priceArr = [];

	inputQuantity.forEach(function(e) {
		quantityArr.push(Number(e.value))
	})
	inputPrice.forEach(function(e) {
		let priceStr = e.innerHTML
		priceStr = priceStr.substring(1);
		priceArr.push(Number(priceStr))
	})

	let totalMoney = 0;
	for (let i = 0; i < priceArr.length; i++) {
		totalMoney += priceArr[i] * quantityArr[i];
	}
	totalMoneyFiled.innerHTML = totalMoney.toFixed(2);
};

function checkFormUser() {
	if (isNaN(phoneNumber.value) || phoneNumber.value.trim().length <= 9) {
		msg.innerHTML = 'Thông tin không hợp lệ!';
		return false;
	} 

	return true;
}





