
import java.sql.Date;

public class Person {
    private int Id;
    private String Name;
    private String Gender;
    private Date Dob;

    public Person(int Id, String Name, String Gender, Date Dob) {
        this.Id = Id;
        this.Name = Name;
        this.Gender = Gender;
        this.Dob = Dob;
    }

    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public Date getDob() {
        return Dob;
    }

    public void setDob(Date Dob) {
        this.Dob = Dob;
    }
    
    
}
