package dao;

import java.security.PublicKey;
import java.util.ArrayList;

public interface WupingDao {
     ArrayList getListByPage( int pages, int pageSize ,int flag);
    int LastPage( int pageSize );
}
