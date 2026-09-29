package Model;

public class Registration  implements java.io.Serializable {

     private Integer id;
     private String name;
     private String email;
     private String number;
     private String gender;
     private String dob;
     private String username;
     private String password;

    public Registration() {
    }

    public Registration(String name, String email, String number, String gender, String dob, String username, String password) {
       this.name = name;
       this.email = email;
       this.number = number;
       this.gender = gender;
       this.dob = dob;
       this.username = username;
       this.password = password;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getNumber() {
        return this.number;
    }
    
    public void setNumber(String number) {
        this.number = number;
    }
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getDob() {
        return this.dob;
    }
    
    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
}