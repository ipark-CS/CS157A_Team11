package sjsu.gntmarket;

public class GroceryListRow extends GroceryCardItem {
	
	private String nutrientInfo;

	public GroceryListRow(int id, String name, String nutrient) {
		
		super(id, name);
		
		nutrientInfo = nutrient;
	}
	
	public void setNutrientInfo(String nutrient) {
		nutrientInfo = nutrient;
	}
	
	public String getNutrientInfo() {
		
		return nutrientInfo;
	}
	

}
