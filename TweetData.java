package Upload;

public class TweetData {

    int id;
    String tweetBody;
    String image;
    String tweetUrl;
    float percentage;

    public TweetData(int id, String tweetBody, String image, String tweetUrl, float percentage) {
        this.id = id;
        this.tweetBody = tweetBody;
        this.image = image;
        this.tweetUrl = tweetUrl;
        this.percentage = percentage;
    }

    public int getId() {
        return id;
    }

    public String getTweetBody() {
        return tweetBody;
    }

    public String getImage() {
        return image;
    }

    public String getTweetUrl() {
        return tweetUrl;
    }

    public float getPercentage() {
        return percentage;
    }

}
