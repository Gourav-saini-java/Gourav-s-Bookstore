package Controller;

import Model.Login;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class LoginTest {

    public static int insert(Login log) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        int i = (Integer) s.save(log);

        t.commit();
        s.close();
        return i;
    }

    public static List<Login> read() {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Query q = s.createQuery("FROM Login");
        List<Login> li = q.list();

        t.commit();
        s.close();
        return li;
    }

    public static Login edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Login obj = (Login) s.get(Login.class, id);

        t.commit();
        s.close();
        return obj;
    }

    public static int update(Login log) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        s.update(log);

        t.commit();
        s.close();
        return 1;
    }

    public static int delete(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Login log = (Login) s.get(Login.class, id);

        if (log != null) {
            s.delete(log);
            t.commit();
            s.close();
            return 1;
        }

        t.rollback();
        s.close();
        return 0;
    }
}
