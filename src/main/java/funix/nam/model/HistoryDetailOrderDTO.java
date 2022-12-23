package funix.nam.model;

import java.sql.Timestamp;

public class HistoryDetailOrderDTO {
	private String imgSource;
	private String name;
	private String type;
	private int amount;
	private float price;
	private Timestamp date;

	public HistoryDetailOrderDTO() {
	}

	public HistoryDetailOrderDTO(String imgSource, String name, String type, int amount, float price, Timestamp date) {
		this.imgSource = imgSource;
		this.type = type;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.date = date;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}
