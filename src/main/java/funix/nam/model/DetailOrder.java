package funix.nam.model;

public class DetailOrder {
	private int orderId;
	private Product product;
	private int amount;
	private float price;

	public DetailOrder() {
	}

	public DetailOrder(int orderId, Product product, int amount, float price) {
		this.product = product;
		this.orderId = orderId;
		this.amount = amount;
		this.price = price;
	}

	public int getMoney() {
		return 99;
	}
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
