package dto;

public class ProductDTO {
	private int pid; // pid int default 1
	private String productName; // productName varchar(10), 
	private String productCategory; // productCategory varchar(10),
	private int price; // prise varchar(100),
	private String productDescript; // productDescript varchar(200),
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductDescript() {
		return productDescript;
	}
	public void setProductDescript(String productDescript) {
		this.productDescript = productDescript;
	}
	
	
	
}
