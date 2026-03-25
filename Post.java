public class Post {
    private String username;
    private String imageUrl;
    private String caption;

    public Post(String u, String i, String c) {
        this.username = u; this.imageUrl = i; this.caption = c;
    }
    // Getters
    public String getUsername() { return username; }
    public String getImageUrl() { return imageUrl; }
    public String getCaption() { return caption; }
}
