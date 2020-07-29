package sjsu.gntmarket;

public class GroceryCardItem {

   private int id;
   private String name;

   // Constructor
   public GroceryCardItem(int id, String name) {
      this.id = id;
      this.name = name;
   }

   public int getId() {
      return id;
   }

   public String getName() {
      return name;
   }
}
