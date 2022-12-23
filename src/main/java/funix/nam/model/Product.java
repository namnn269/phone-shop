package funix.nam.model;

public class Product {
	private int productId;
	private String productName;
	private String description;
	private float price;
	private String imgSource;
	private String type;
	private String brand;

	public Product() {
	}

	public Product(int productId, String productName, String description, float price, String imgSource, String type,
			String brand) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.imgSource = imgSource;
		this.type = type;
		this.brand = brand;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getImgSource() {
		return imgSource;
	}

	public void setImgSource(String imgSource) {
		this.imgSource = imgSource;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", description=" + description
				+ ", price=" + price + ", imgSource=" + imgSource + ", type=" + type + ", brand=" + brand + "]";
	}

}
