
package entity;

import dal.DBContext;
import java.sql.Date;

public class Application extends BaseEntity{
    private int id;
    private Student student;
    private Date create_date;
    private String content;
    private TypeApplication type;
    private Boolean isSpend;
    private Boolean isApprove;
    private String comment;

    public Application() {
    }

    public Application(int id, Student student, Date create_date, String content, TypeApplication type, Boolean isSpend, Boolean isApprove, String comment) {
        this.id = id;
        this.student = student;
        this.create_date = create_date;
        this.content = content;
        this.type = type;
        this.isSpend = isSpend;
        this.isApprove = isApprove;
        this.comment = comment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public TypeApplication getType() {
        return type;
    }

    public void setType(TypeApplication type) {
        this.type = type;
    }

    public Boolean getIsSpend() {
        return isSpend;
    }

    public void setIsSpend(Boolean isSpend) {
        this.isSpend = isSpend;
    }

    public Boolean getIsApprove() {
        return isApprove;
    }

    public void setIsApprove(Boolean isApprove) {
        this.isApprove = isApprove;
    }
    
    
}