package Controller;

import Model.Orders;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class OrdersTest {

    public static int insert(Orders o) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        i = (Integer) s.save(o);

        t.commit();
        s.close();
        return i;
    }

    public static List<Orders> read() {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Query q = s.createQuery("FROM Orders");
        List<Orders> li = q.list();

        t.commit();
        s.close();
        return li;
    }

    public static List<Orders> searchOrders(String keyword) {

        Session session = Factory.getSessionFactory().openSession();

        String hql = "FROM Orders WHERE "
                + "lower(name) LIKE :key OR "
                + "lower(city) LIKE :key OR "
                + "lower(state) LIKE :key OR "
                + "lower(mobile) LIKE :key";

        List<Orders> list = session.createQuery(hql)
                .setParameter("key", "%" + keyword.toLowerCase() + "%")
                .list();

        session.close();
        return list;
    }

    public static Orders edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Orders obj = (Orders) s.get(Orders.class, id);

        t.commit();
        s.close();
        return obj;
    }

    public static int update(Orders o) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        s.update(o);

        t.commit();
        s.close();
        return 1;
    }

    public static int delete(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Orders o = (Orders) s.get(Orders.class, id);

        if (o != null) {
            s.delete(o);
            t.commit();
            s.close();
            return 1;
        }

        t.rollback();
        s.close();
        return 0;
    }
}
