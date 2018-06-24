package dao.impl;

import dao.BaseDao;
import dao.UserDao;
import entity.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDaoImpl implements UserDao{


    BaseDao dao = new BaseDao();
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;

    @Override
    public int updateUsersById( Users users ) {
                int i =0 ;
        String sql="update users set username=?,userpass=?,usernumb=?,usertel=?,useremail=? where id=?";
        String arr[]={users.getUsername(),users.getUserpass(),users.getUsernumb()+"",
                users.getUsertel(),users.getId()+"",users.getUseremail()};

        i=dao.doExcuteSql(sql, arr);
        return i ;
    }

    @Override
    public Users getUsersById( int id ) {
          String sql="select * from users where id=?";
        Users users = new Users();
        try {
            conn=dao.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs=ps.executeQuery();
            if(rs.next()){
                users.setId(rs.getInt("id"));
                users.setUseremail(rs.getString("useremail"));
                users.setUsertel(rs.getString("usertel"));
                users.setUsername(rs.getString("username"));
                users.setUserpass(rs.getString("userpass"));
                users.setUsernumb(rs.getString("usernumb"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public Users login( String username, String userpass ) {
        Users users = null;
        String sql="select * from users where username=? "
                + "and userpass=? ";
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, userpass);
            rs=ps.executeQuery();
            while (rs.next()){
                users = new Users();
                users.setId(rs.getInt("id"));
                users.setUsername(rs.getString("username"));
                users.setUserpass(rs.getString("userpass"));
                users.setUsernumb(rs.getString("usernumb"));
                users.setUsertel(rs.getString("usertel"));
                users.setUseremail(rs.getString("useremail"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return users;
    }

    @Override
    public int LastPage( int pageSize ) {
          int page = 0;//
        int pageCount=0;//
        String sql="select COUNT(*) as pagecount from users ";
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

    @Override
    public int deleteByIds( String ids ) {
          String sql="delete from users where id  in ("+ids+")";
        int i =0;
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            i=ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            dao.closeAll(conn, ps, rs);
        }
        return i;
    }

    @Override
    public int deleteById( int Id ) {
         String sql="delete from users where id=?";
        String arr[]={Id+""};
        int  i=dao.doExcuteSql(sql, arr);
        return i;
    }

    @Override
    public ArrayList getListByPage( int page, int pageSize ) {
        ArrayList list = new ArrayList();
        String sql = "select * from users order by id asc limit " +
                (page - 1) * pageSize + "," + pageSize;
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();

            while(rs.next()){
                Users users = new Users();
                users.setId(rs.getInt("id"));
                users.setUseremail(rs.getString("useremail"));
                users.setUsertel(rs.getString("usertel"));
                users.setUsername(rs.getString("username"));
                users.setUserpass(rs.getString("userpass"));
                users.setUsernumb(rs.getString("usernumb"));
                list.add(users);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return list;
    }

    @Override
    public ArrayList getList() {
        ArrayList list = new ArrayList();
        String sql="select * from  users";
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();

            while(rs.next()){
                Users users = new Users();
                users.setId(rs.getInt("id"));
                users.setUseremail(rs.getString("email"));
                users.setUsertel(rs.getString("usertel"));
                users.setUsername(rs.getString("username"));
                users.setUserpass(rs.getString("userpass"));
                users.setUsernumb(rs.getString("usernumb"));
                list.add(users);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return list;
    }
}
