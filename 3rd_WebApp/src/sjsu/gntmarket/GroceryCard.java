package sjsu.gntmarket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GroceryCard {

   private List<GroceryCardItem> gCard;

   // constructor
   public GroceryCard() {
      gCard = new ArrayList<GroceryCardItem>();
   }

   public void add(int id, String name) {
      Iterator<GroceryCardItem> iter = gCard.iterator();
      while (iter.hasNext()) {
         GroceryCardItem item = iter.next();
         if (item.getId() == id) {
            // id found, do nothing
            return;
         }
      }
      // id not found, create a new CartItem
      gCard.add(new GroceryCardItem(id, name));
   }

   // Remove 
   public void remove(int id) {
      Iterator<GroceryCardItem> iter = gCard.iterator();
      while (iter.hasNext()) {
         GroceryCardItem item = iter.next();
         if (item.getId() == id) {
            gCard.remove(item);
            return;
         }
      }
   }

   public int size() {
      return gCard.size();
   }
   public boolean isEmpty() {
      return gCard.size() == 0;
   }

   public List<GroceryCardItem> getItems() {
      return gCard;
   }

   public void clear() {
      gCard.clear();
   }
}
