package entity;

import com.sun.xml.internal.bind.v2.model.core.ID;

public class Found {
    private int id;
    private int tid;
    private int userId;
    private String updatetime;
    private String reason;
    private String content;
    private String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag( String flag ) {
        this.flag = flag;
    }


    public int getId() {
        return id;
    }

    public void setId( int id ) {
        this.id = id;
    }

    public int getTid() {
        return tid;
    }

    public void setTid( int tid ) {
        this.tid = tid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId( int userId ) {
        this.userId = userId;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime( String updatetime ) {
        this.updatetime = updatetime;
    }

    public String getReason() {
        return reason;
    }

    public void setReason( String reason ) {
        this.reason = reason;
    }

    public String getContent() {
        return content;
    }

    public void setContent( String content ) {
        this.content = content;
    }
}
