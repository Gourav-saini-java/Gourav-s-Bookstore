package Controller;

import Model.Registration;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegistrationTest {

    public static int insert(Registration reg) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        i = (Integer) s.save(reg);

        t.commit();
        s.close();
        return i;
    }

    public static Registration authenticate(String username, String password) {

        Session s = Factory.getSessionFactory().openSession();

        Query q = s.createQuery("from Registration where username=:u and password=:p");
        q.setString("u", username);
        q.setString("p", password);

        Registration user = (Registration) q.uniqueResult();
        s.close();

        return user;
    }

    public static List<Registration> read() {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Query q = s.createQuery("FROM Registration");
        List<Registration> li = q.list();

        t.commit();
        s.close();
        return li;
    }

    public static List<Registration> searchUsers(String keyword) {

        Session session = Factory.getSessionFactory().openSession();

        String hql = "FROM Registration WHERE "
                + "lower(name) LIKE :key OR "
                + "lower(email) LIKE :key OR "
                + "lower(username) LIKE :key OR "
                + "lower(number) LIKE :key";

        List<Registration> list = session.createQuery(hql)
                .setParameter("key", "%" + keyword.toLowerCase() + "%")
                .list(); 

        session.close();
        return list;
    }

    public static Registration edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Registration obj = (Registration) s.get(Registration.class, id);

        t.commit();
        s.close();
        return obj;
    }

    public static int update(Registration reg) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        s.update(reg);

        t.commit();
        s.close();
        return 1;
    }

    public static int delete(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Registration reg = (Registration) s.get(Registration.class, id);

        if (reg != null) {
            s.delete(reg);
            t.commit();
            s.close();
            return 1;
        }

        t.rollback();
        s.close();
        return 0;
    }
}
