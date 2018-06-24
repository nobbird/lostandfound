package dao;

import java.util.ArrayList;

public  interface FoundDao{
    ArrayList getListByPage( int pages, int pageSize );
    int LastPage( int pageSize );
}
