package dao;

import entity.Admin;

import java.util.ArrayList;

public interface AdminDao {
    Admin login( String adminname, String adminpass);
    int LastPage(int pageSize);
    ArrayList getListByPage( int page, int pageSize);
}
