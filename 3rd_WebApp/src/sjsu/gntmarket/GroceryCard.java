package sjsu.gntmarket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GroceryCard {

   private List<GroceryCardItem> groceryCard;

   // constructor
   public GroceryCard() {
      groceryCard = new ArrayList<GroceryCardItem>();
   }

   public void add(int id, String name) {
      Iterator<GroceryCardItem> iter = groceryCard.iterator();
      while (iter.hasNext()) {
         GroceryCardItem item = iter.next();
         if (item.getId() == id) {
            // id found, do nothing
            return;
         }
      }
      // id not found, create a new CartItem
      groceryCard.add(new GroceryCardItem(id, name));
   }

   // Remove 
   public void remove(int id) {
      Iterator<GroceryCardItem> iter = groceryCard.iterator();
      while (iter.hasNext()) {
         GroceryCardItem item = iter.next();
         if (item.getId() == id) {
            groceryCard.remove(item);
            return;
         }
      }
   }

   public boolean isEmpty() {
      return groceryCard.size() == 0;
   }

   public List<GroceryCardItem> getItems() {
      return groceryCard;
   }

   public void clear() {
      groceryCard.clear();
   }
}
