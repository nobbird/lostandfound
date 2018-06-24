package dao.impl;

import com.sun.xml.internal.bind.v2.model.core.ID;
import dao.BaseDao;
import entity.Users;
import entity.Wuping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WupingDaoimpl {
    BaseDao dao = new BaseDao();
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    public ArrayList getListByPage( int page, int pageSize ,int flga) {
        ArrayList list = new ArrayList();
        String sql = "select * from wuping where flag=" + flga + " order by id asc limit " +
                (page - 1) * pageSize + "," + pageSize;
        conn=dao.getConnection();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();

            while(rs.next()){
                Wuping wuping = new Wuping();
                wuping.setId(rs.getInt("Id"));
                wuping.setTitle(rs.getString("title"));
                wuping.setContent(rs.getString("content"));
                wuping.setTypes(rs.getString("types"));
                wuping.setLosttime(rs.getString("losttime"));
                wuping.setUpdatetime(rs.getString("updatetime"));
                wuping.setState(rs.getString("state"));
                list.add(wuping);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.closeAll(conn, ps, rs);
        }
        return list;
    }

    public int LastPage( int pageSize,int flag ) {
        int page = 0;
        int pageCount=0;
        String sql="select COUNT(*) as pagecount from wuping where flag=" + flag;
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

