package dao.impl;

import dao.BaseDao;
import entity.Found;
import entity.Wuping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FoundDaoImpl {
    BaseDao dao = new BaseDao();
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    public ArrayList getListByPage( int page, int pageSize ) {
        ArrayList list = new ArrayList();
        String sql = "select * from found  order by id asc limit " +
                (page - 1) * pageSize + "," + pageSize;
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();

            while(rs.next()){
                Found found=new Found();
                found.setId(rs.getInt("Id"));
                found.setTid(rs.getInt("tid"));
                found.setUserId(rs.getInt("userId"));
                found.setContent(rs.getString("content"));
                found.setReason(rs.getString("reason"));
                found.setUpdatetime(rs.getString("updatetime"));
                found.setFlag(rs.getString("flag"));
                list.add(found);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return list;
    }

    public int LastPage( int pageSize ) {
        int page = 0;
        int pageCount=0;
        String sql="select COUNT(*) as pagecount from found";
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

}
