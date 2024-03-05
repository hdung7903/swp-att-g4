
package entity;

import java.sql.Date;

public class New extends BaseEntity {
    private int id;
    private Date create_date;
    private String title;
    private String content;

    public New() {
    }

    public New(int id, Date create_date, String title, String content) {
        this.id = id;
        this.create_date = create_date;
        this.title = title;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
