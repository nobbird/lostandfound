package dao;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class BaseDao {

    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;



    public Connection getConnection(){
        String url="jdbc:mysql://localhost:3306/lostandfound";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public int doExcuteSql(String sql,String[] arr){
        int j =0;
        conn=getConnection();
        try {
            ps=conn.prepareStatement(sql);
            if(arr!=null&&arr.length>0){
                for(int i=0;i<arr.length;i++){
                    ps.setString(i+1, arr[i]);
                }
            }
            j=ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return j ;
    }

    public void closeAll(Connection conn,PreparedStatement ps ,ResultSet rs){
        if(conn!=null){
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(rs!=null){
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }




}

