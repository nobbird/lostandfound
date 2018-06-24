package dao.impl;

import dao.AdminDao;
import dao.BaseDao;
import entity.Admin;
import entity.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDaoImpl implements AdminDao{
    BaseDao dao = new BaseDao();
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;


    public Admin login( String adminname, String adminpass ) {
        Admin admin = null;
        String sql="select * from admins where adminname=? "
                + "and adminpass=? ";
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1, adminname);
            ps.setString(2, adminpass);
            rs=ps.executeQuery();
            while (rs.next()){
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setAdminname(rs.getString("adminname"));
                admin.setAdminpass(rs.getString("adminpass"));
                admin.setAdmintel(rs.getString("admintel"));
                admin.setAdminemail(rs.getString("adminemail"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return admin;
    }


    public int LastPage( int pageSize ) {
        int page = 0;//
        int pageCount=0;//
        String sql="select COUNT(*) as pagecount from admins ";
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next()){
                pageCount=rs.getInt("pagecount");
            }
            if(pageCount%pageSize==0){
                page=pageCount/pageSize;
            }else{
                page=pageCount/pageSize+1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return page;
    }

    public ArrayList getListByPage( int page, int pageSize ) {
        ArrayList list = new ArrayList();
        String sql = "select * from admins order by id asc limit " +
                (page - 1) * pageSize + "," + pageSize;
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();

            while(rs.next()){
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setAdminname(rs.getString("adminname"));
                admin.setAdminpass(rs.getString("adminpass"));
                admin.setAdmintel(rs.getString("admintel"));
                admin.setAdminemail(rs.getString("adminemail"));
                list.add(admin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return list;
    }

}
