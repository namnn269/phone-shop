package funix.nam.model;

import java.sql.Timestamp;
import java.util.List;

public class Order {
	private int orderId;
	private Account account;
	private List<DetailOrder> listDetailOrders;
	private float totalPrice;
	private String username;
	private boolean orderStatus;
	private Timestamp orderDate;
	private Timestamp receiveDate;
	private String orderDiscountCode;
	private String address;
	private String phoneNumber;

	public Order() {
	}

	public Order(int orderId, List<DetailOrder> listDetailOrders, float totalPrice, String username,
			boolean orderStatus, Timestamp orderDate, Timestamp receiveDate, String orderDiscountCode, String address,
			String phoneNumber) {
		super();
		this.orderId = orderId;
		this.listDetailOrders = listDetailOrders;
		this.totalPrice = totalPrice;
		this.username = username;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.receiveDate = receiveDate;
		this.orderDiscountCode = orderDiscountCode;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	public String getOrderDiscountCode() {
		return orderDiscountCode;
	}

	public void setOrderDiscountCode(String orderDiscountCode) {
		this.orderDiscountCode = orderDiscountCode;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public List<DetailOrder> getListDetailOrders() {
		return listDetailOrders;
	}

	public void setListDetailOrders(List<DetailOrder> listDetailOrders) {
		this.listDetailOrders = listDetailOrders;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(boolean orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public Timestamp getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Timestamp receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}
