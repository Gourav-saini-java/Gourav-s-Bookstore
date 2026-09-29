package Model;

public class Books implements java.io.Serializable {

    private Integer id;
    private String title;
    private String author;
    private String genre;
    private String description;
    private int price;
    private String image;

    public Books() {
    }

    public Books(String title, String author, String genre, String description, int price, String image) {
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getGenre() {
        return this.genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
