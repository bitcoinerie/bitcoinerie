import java.sql.Connection;

/**
 * Created with IntelliJ IDEA.
 * User: marjolaine
 * Date: 19/11/13
 * Time: 22:42
 * To change this template use File | Settings | File Templates.
 */

public class MyTransactionDAO extends DAO<MyTransaction> {
    protected Connection connection = null;

    public MyTransactionDAO(Connection connection){
        super(connection);
    }

    public boolean create(MyTransaction obj){
        return true;
    }

    public boolean delete(MyTransaction obj){
        return true;
    }

    public boolean update(MyTransaction obj){
        return true;
    }

    public MyTransaction find(int id){
        return MyTransaction;
    }


}
