package entity;

public class Admin {
    private  int id;
    private String adminname;
    private  String adminpass;
    private  String admintel;
    private  String adminemail;


    public String getAdminemail() {
        return adminemail;
    }

    public void setAdminemail( String adminemail ) {
        this.adminemail = adminemail;
    }


    public int getId() {
        return id;
    }

    public void setId( int id ) {
        this.id = id;
    }


    public String getAdmintel() {
        return admintel;
    }

    public void setAdmintel( String admintel ) {
        this.admintel = admintel;
    }


    public String getAdminname() {
        return adminname;
    }

    public void setAdminname( String adminname ) {
        this.adminname = adminname;
    }

    public String getAdminpass() {
        return adminpass;
    }

    public void setAdminpass( String adminpass ) {
        this.adminpass = adminpass;
    }
}
