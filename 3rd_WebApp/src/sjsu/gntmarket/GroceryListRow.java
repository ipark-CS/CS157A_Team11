package sjsu.gntmarket;

/**
 * 
 * A class that extends GroceryCardItem to also store the nutrient of a food idea.
 * 
 */
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
