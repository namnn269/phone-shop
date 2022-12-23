package funix.nam.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<DetailOrder> listItem;

	public Cart() {
	}

	public Cart(int a) {
		this.listItem = new ArrayList<>();
	}

	public List<DetailOrder> getListItem() {
		return listItem;
	}

	public void setListItem(List<DetailOrder> listItem) {
		this.listItem = listItem;
	}

	public float getTotalMoney() {
		float total = 0;
		for (DetailOrder detailOrder : listItem) {
			total += detailOrder.getPrice() * detailOrder.getAmount();
		}

		total = (float) (Math.round(total * 100) / 100.0);
		return total;
	}

	public void addToCart(Product product, int quantity) {
		for (DetailOrder detailOrder : listItem) {
			if (detailOrder.getProduct().getProductId() == product.getProductId()) {
				detailOrder.setAmount(detailOrder.getAmount() + quantity);
				return;
			}
		}

		DetailOrder detailOrder = new DetailOrder();
		detailOrder.setAmount(quantity);
		detailOrder.setOrderId(0);
		detailOrder.setPrice(product.getPrice());
		detailOrder.setProduct(product);
		listItem.add(detailOrder);
	}

	public void deleteDetailOrder(int id) {

		for (DetailOrder detailOrder : listItem) {
			if (detailOrder.getProduct().getProductId() == id) {
				listItem.remove(detailOrder);
				return;
			}
		}
	}

}
