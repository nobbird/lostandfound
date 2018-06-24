package entity;

import javax.xml.soap.Text;
import java.io.Serializable;

/**
 * 商品实体类
 */
public class Wuping implements Serializable{
    private int id;
    private int flag;
    private String userId;
    private String title;
    private String content;
    private String types;
    private String losttime;
    private String updatetime;
    private String state;

    public int getId() {
        return id;
    }

    public void setId( int id ) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId( String userId ) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle( String title ) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent( String content ) {
        this.content = content;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes( String types ) {
        this.types = types;
    }

    public String getLosttime() {
        return losttime;
    }

    public void setLosttime( String losttime ) {
        this.losttime = losttime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime( String updatetime ) {
        this.updatetime = updatetime;
    }

    public String getState() {
//        if (state=="0")
//            state="未找到";
//        if (state=="1")
//            state="已找到";
//        if (state=="2")
//            state="未领取";
//        if (state=="3")
//            state="已领取";
        return state;
    }

    public void setState( String state ) {
        this.state = state;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag( int flag ) {
        this.flag = flag;
    }
}
