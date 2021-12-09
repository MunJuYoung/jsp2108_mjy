package admin.vo;

public class ProductOptionVO {
	private int price;
	private String color;
	private String size;
	private int cnts;
	private String photo;
	private String content;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getCnts() {
		return cnts;
	}
	public void setCnts(int cnts) {
		this.cnts = cnts;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ProductOptionVO [price=" + price + ", color=" + color + ", size=" + size + ", cnts=" + cnts + ", photo="
				+ photo + ", content=" + content + "]";
	} 
	
	
	
	
}
