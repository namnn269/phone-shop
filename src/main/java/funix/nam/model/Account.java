package funix.nam.model;

public class Account {
	private String userMail, password, name, address, phone;
	private int role;
	private boolean registered;

	public Account() {
	}

	public Account(String userMail, String password, String name, String address, String phone, int role,
			boolean registered) {
		this.userMail = userMail;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.role = role;
		this.registered = registered;

	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public boolean isRegistered() {
		return registered;
	}

	public void setRegistered(boolean registered) {
		this.registered = registered;
	}

	@Override
	public String toString() {
		return "Account [userMail=" + userMail + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", phone=" + phone + ", role=" + role + ", registered=" + registered + "]";
	}



}
