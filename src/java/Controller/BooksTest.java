package Controller;

import Model.Books;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BooksTest {

    public static int insert(Books book) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        i = (Integer) s.save(book);

        t.commit();
        s.close();
        return i;
    }

    public List<Books> getAllBooks() {

        Session session = Factory.getSessionFactory().openSession();
        List<Books> books = session.createQuery("from Books").list();
        session.close();
        return books;
    }

    public List<Books> searchBooks(String keyword) {

        Session session = Factory.getSessionFactory().openSession();

        String hql = "FROM Books WHERE lower(title) LIKE :key OR lower(author) LIKE :key OR lower(genre) LIKE :key";

        List<Books> books = session.createQuery(hql)
                .setParameter("key", "%" + keyword.toLowerCase() + "%")
                .list();
        session.close();
        return books;
    }

    public static Books edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Books obj = (Books) s.get(Books.class, id);

        t.commit();
        s.close();
        return obj;
    }

    public static int update(Books book) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        s.update(book);

        t.commit();
        s.close();
        return 1;
    }

    public static int delete(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        Books book = (Books) s.get(Books.class, id);

        if (book != null) {
            s.delete(book);
            t.commit();
            s.close();
            return 1;
        }

        t.rollback();
        s.close();
        return 0;
    }
}
