import java.sql.Connection;

/**
 * Created with IntelliJ IDEA.
 * User: marjolaine
 * Date: 19/11/13
 * Time: 22:37
 * To change this template use File | Settings | File Templates.
 */
public abstract class DAO<T> {
    protected Connection connection = null;

    public DAO(Connection connection){
        this.connection = connection;
    }

    public abstract boolean create(T obj);

    public abstract boolean delete(T obj);

    public abstract boolean update(T obj);

    public abstract T find(int id);
}


